import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast_io.dart';
import '../permissions/permission_handler.dart';
import 'package:cashflow_ai/core/exceptions/app_exceptions.dart' as app_exceptions;
import 'handlers/spending_db_handler.dart';
import 'handlers/statistics_db_handler.dart';

class DatabaseService {
  static const String _appFolderName = 'cashflow.ai';
  static const String _dbFileName = 'cashflow.db';
  static DatabaseService? _instance;
  static Database? _database;

  late final SpendingDbHandler spendingDb;
  late final StatisticsDbHandler statisticsDb;

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
    _initializeHandlers();
    return _database!;
  }

  void _initializeHandlers() {
    spendingDb = SpendingDbHandler(_database!);
    statisticsDb = StatisticsDbHandler(_database!);
  }

  Future<Database> _initDatabase() async {
    try {
      final appDir = await _getAppDirectory();
      final dbPath = join(appDir.path, _dbFileName);

      // Make sure the directory exists
      await Directory(dirname(dbPath)).create(recursive: true);

      // Open the database
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
      throw app_exceptions.DatabaseException('Failed to initialize database: $e');
    }
  }

  static Future<Directory> _getAppDirectory() async {
    try {
      final hasPermission = await PermissionHandler.checkStoragePermission();
      if (!hasPermission) {
        throw const app_exceptions.StoragePermissionDeniedException();
      }

      Directory? baseDir;
      if (Platform.isAndroid) {
        if (await PermissionHandler.isAndroid11OrHigher()) {
          // For Android 11+, use the root of external storage
          baseDir = Directory('/storage/emulated/0');
        } else {
          // For older Android versions, use app-specific directory
          baseDir = await getExternalStorageDirectory();
        }
      } else {
        baseDir = await getApplicationDocumentsDirectory();
      }

      if (baseDir == null) {
        throw const app_exceptions.DatabaseException('Failed to get storage directory');
      }

      final Directory appDir = Directory('${baseDir.path}/$_appFolderName');

      if (!await appDir.exists()) {
        await appDir.create(recursive: true);
      }

      return appDir;
    } catch (e) {
      throw app_exceptions.DatabaseException('Failed to create or access app directory: $e');
    }
  }


} 