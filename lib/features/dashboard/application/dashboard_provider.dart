import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/local/db/database_provider.dart';

final dashboardInspectionsProvider = StreamProvider((ref) {
  final db = ref.watch(databaseProvider);
  return db.select(db.inspections).watch();
});
