import 'package:freezed_annotation/freezed_annotation.dart';

part 'spend_statistics.freezed.dart';
part 'spend_statistics.g.dart';

@freezed
class SpendStatistics with _$SpendStatistics {
  const factory SpendStatistics({
    int? id,
    required DateTime month,
    required double totalSpent,
    required double percentDifference,
    required String mostSpentCategory,
    required String mostUsedPaymentMode,
    Map<String, double>? categoryBreakdown,
    Map<String, double>? paymentModeBreakdown,
  }) = _SpendStatistics;

  factory SpendStatistics.fromJson(Map<String, dynamic> json) =>
      _$SpendStatisticsFromJson(json);

  // Custom fromMap factory for Sembast
  factory SpendStatistics.fromMap(Map<String, dynamic> map) {
    return SpendStatistics(
      id: map['id'] as int?,
      month: DateTime.parse(map['month'] as String),
      totalSpent: map['totalSpent'] as double,
      percentDifference: map['percentDifference'] as double,
      mostSpentCategory: map['mostSpentCategory'] as String,
      mostUsedPaymentMode: map['mostUsedPaymentMode'] as String,
      categoryBreakdown: (map['categoryBreakdown'] as Map<String, dynamic>?)?.map(
        (k, v) => MapEntry(k, v as double),
      ),
      paymentModeBreakdown: (map['paymentModeBreakdown'] as Map<String, dynamic>?)?.map(
        (k, v) => MapEntry(k, v as double),
      ),
    );
  }
}

extension SpendStatisticsX on SpendStatistics {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'month': month.toIso8601String(),
      'totalSpent': totalSpent,
      'percentDifference': percentDifference,
      'mostSpentCategory': mostSpentCategory,
      'mostUsedPaymentMode': mostUsedPaymentMode,
      'categoryBreakdown': categoryBreakdown,
      'paymentModeBreakdown': paymentModeBreakdown,
    };
  }
} 