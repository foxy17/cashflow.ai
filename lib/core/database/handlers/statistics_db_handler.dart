import 'package:sembast/sembast.dart';
import 'package:cashflow_ai/core/models/models.dart';
import 'base_db_handler.dart';

class StatisticsDbHandler extends BaseDbHandler<SpendStatistics> {
  StatisticsDbHandler(Database database)
      : super(database, intMapStoreFactory.store('spend_statistics'));

  @override
  Future<int> add(SpendStatistics item) async {
    final key = await store.add(database, item.toMap());
    return key as int;
  }

  @override
  Future<void> update(int id, SpendStatistics item) async {
    await store.record(id).update(database, item.toMap());
  }

  @override
  Future<void> delete(int id) async {
    await store.record(id).delete(database);
  }

  @override
  Future<SpendStatistics?> getById(int id) async {
    final record = await store.record(id).get(database);
    if (record == null) return null;
    final map = record as Map<String, dynamic>;
    map['id'] = id;
    return SpendStatistics.fromMap(map);
  }

  @override
  Future<List<SpendStatistics>> getAll() async {
    final records = await store.find(database);
    return records.map((record) {
      final map = record.value as Map<String, dynamic>;
      map['id'] = record.key;
      return SpendStatistics.fromMap(map);
    }).toList();
  }

  Future<SpendStatistics?> getStatisticsForMonth(DateTime month) async {
    final finder = Finder(
      filter: Filter.custom((record) {
        final recordMonth =
            DateTime.parse((record.value as Map)['month'] as String);
        return recordMonth.year == month.year &&
            recordMonth.month == month.month;
      }),
    );

    final record = await store.findFirst(database, finder: finder);
    if (record == null) return null;

    final map = record.value as Map<String, dynamic>;
    map['id'] = record.key;
    return SpendStatistics.fromMap(map);
  }

  @override
  Future<List<int>> addAll(List<SpendStatistics> items) async {
    final keys = await store.addAll(
      database,
      items.map((item) => item.toMap()).toList(),
    );
    return keys.map((key) => key as int).toList();
  }

}
