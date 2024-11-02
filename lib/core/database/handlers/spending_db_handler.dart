import 'package:sembast/sembast.dart';
import '../../models/spending.dart';
import 'base_db_handler.dart';

class SpendingDbHandler extends BaseDbHandler<Spending> {
  SpendingDbHandler(Database database)
      : super(database, intMapStoreFactory.store('spending'));

  @override
  Future<int> add(Spending item) async {
    final key = await store.add(database, item.toMap());
    return key as int;
  }

  @override
  Future<void> update(int id, Spending item) async {
    await store.record(id).update(database, item.toMap());
  }

  @override
  Future<void> delete(int id) async {
    await store.record(id).delete(database);
  }

  @override
  Future<Spending?> getById(int id) async {
    final record = await store.record(id).get(database);
    if (record == null) return null;
    final map = record as Map<String, dynamic>;
    map['id'] = id;
    return Spending.fromMap(map);
  }

  @override
  Future<List<Spending>> getAll() async {
    final records = await store.find(database);
    return records.map((record) {
      final map = record.value as Map<String, dynamic>;
      map['id'] = record.key;
      return Spending.fromMap(map);
    }).toList();
  }

  Future<List<Spending>> getSpendingsByMonth(DateTime month) async {
    final startOfMonth = DateTime(month.year, month.month, 1);
    final endOfMonth = DateTime(month.year, month.month + 1, 0, 23, 59, 59);

    final finder = Finder(
      filter: Filter.and([
        Filter.greaterThanOrEquals('date', startOfMonth.toIso8601String()),
        Filter.lessThanOrEquals('date', endOfMonth.toIso8601String()),
      ]),
    );

    final records = await store.find(database, finder: finder);
    return records.map((record) {
      final map = record.value as Map<String, dynamic>;
      map['id'] = record.key;
      return Spending.fromMap(map);
    }).toList();
  }

  @override
  Future<List<int>> addAll(List<Spending> items) async {
    final keys = await store.addAll(
      database,
      items.map((item) => item.toMap()).toList(),
    );
    return keys.map((key) => key as int).toList();
  }
} 