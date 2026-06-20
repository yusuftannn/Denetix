import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/db/database_provider.dart';

final reportsInspectionsProvider = StreamProvider((ref) {
  final db = ref.watch(databaseProvider);

  return db.select(db.inspections).watch();
});

final reportsStatsProvider = Provider((ref) {
  final inspections =
      ref.watch(reportsInspectionsProvider).value ?? [];

  final total = inspections.length;

  final completed = inspections
      .where((e) => e.status == 'completed')
      .length;

  final draft = inspections
      .where((e) => e.status == 'draft')
      .length;

  final completionRate =
  total == 0 ? 0.0 : (completed / total * 100);

  return {
    'total': total,
    'completed': completed,
    'draft': draft,
    'completionRate': completionRate,
    'list': inspections,
  };
});

final filteredInspectionsProvider =
StateNotifierProvider<FilterNotifier, String>((ref) {
  return FilterNotifier();
});

class FilterNotifier extends StateNotifier<String> {
  FilterNotifier() : super('all');

  void setFilter(String filter) {
    state = filter;
  }
}

final filteredReportListProvider = Provider((ref) {
  final inspections =
      ref.watch(reportsInspectionsProvider).value ?? [];

  final filter =
  ref.watch(filteredInspectionsProvider);

  switch (filter) {
    case 'completed':
      return inspections
          .where((e) => e.status == 'completed')
          .toList();

    case 'draft':
      return inspections
          .where((e) => e.status == 'draft')
          .toList();

    case 'all':
    default:
      return inspections;
  }
});