import 'package:sembast/sembast.dart';

abstract class BaseDbHandler<T> {
  final Database database;
  final StoreRef store;

  BaseDbHandler(this.database, this.store);

  Future<int> add(T item);
  Future<List<int>> addAll(List<T> items);
  Future<void> update(int id, T item);
  Future<void> delete(int id);
  Future<T?> getById(int id);
  Future<List<T>> getAll();
} 