import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:permission_handler/permission_handler.dart';
import '../models/spending.dart';
import '../exceptions/app_exceptions.dart' as app_exceptions;

class DatabaseService {
  static const String _appFolderName = 'cashflow.ai';
  static const String _dbFileName = 'cashflow.db';
  static DatabaseService? _instance;
  static Database? _database;
  
  // Store for spending records
  final _spendingStore = intMapStoreFactory.store('spending');

  // Private constructor
  DatabaseService._();

  static DatabaseService get instance {
    _instance ??= DatabaseService._();
    return _instance!;
  }

  // Get database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final appDir = await _getAppDirectory();
    final dbPath = join(appDir.path, _dbFileName);

    // Make sure the directory exists
    try {
      await Directory(dirname(dbPath)).create(recursive: true);
    } catch (e) {
      throw app_exceptions.DatabaseException('Failed to create database directory: $e');
    }

    // Open the database
    try {
      final DatabaseFactory dbFactory = databaseFactoryIo;
      final db = await dbFactory.openDatabase(
        dbPath,
        version: 1,
        onVersionChanged: (db, oldVersion, newVersion) async {
          // Handle database migrations here if needed
          if (oldVersion == 0) {
            // First creation, nothing to do
          }
        },
      );
      return db;
    } catch (e) {
      throw app_exceptions.DatabaseException('Failed to open database: $e');
    }
  }

  static Future<Directory> _getAppDirectory() async {
    try {
      final Directory documentsDir = await getApplicationDocumentsDirectory();
      final Directory appDir = Directory('${documentsDir.path}/$_appFolderName');

      if (!await appDir.exists()) {
        await appDir.create(recursive: true);
      }

      return appDir;
    } catch (e) {
      throw app_exceptions.DatabaseException('Failed to create or access app directory: $e');
    }
  }

  // CRUD Operations

  Future<int> addSpending(Spending spending) async {
    try {
      final db = await database;
      final key = await _spendingStore.add(db, spending.toMap());
      return key;
    } catch (e) {
      throw app_exceptions.DatabaseException('Failed to add spending: $e');
    }
  }

  Future<List<Spending>> getAllSpendings() async {
    try {
      final db = await database;
      final records = await _spendingStore.find(db);
      return records.map((record) {
        final map = record.value;
        map['id'] = record.key;
        return Spending.fromMap(map);
      }).toList();
    } catch (e) {
      throw app_exceptions.DatabaseException('Failed to get spendings: $e');
    }
  }

  Future<void> updateSpending(int id, Spending spending) async {
    try {
      final db = await database;
      await _spendingStore.record(id).update(db, spending.toMap());
    } catch (e) {
      throw app_exceptions.DatabaseException('Failed to update spending: $e');
    }
  }

  Future<void> deleteSpending(int id) async {
    try {
      final db = await database;
      await _spendingStore.record(id).delete(db);
    } catch (e) {
      throw app_exceptions.DatabaseException('Failed to delete spending: $e');
    }
  }

  // Helper method to check and request storage permissions
  static Future<bool> checkAndRequestPermissions() async {
    if (Platform.isAndroid) {
      final status = await Permission.storage.status;
      if (!status.isGranted) {
        final result = await Permission.storage.request();
        return result.isGranted;
      }
      return true;
    }
    // iOS doesn't require explicit storage permissions
    return true;
  }

  // Close the database
  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
} 