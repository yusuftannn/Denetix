import 'package:drift/drift.dart';
import '../db/app_database.dart';

class InspectionItemLocalRepo {
  final AppDatabase db;
  InspectionItemLocalRepo(this.db);

  Stream<List<InspectionItem>> watchByInspection(String inspectionId) {
    return (db.select(db.inspectionItems)
      ..where((t) => t.inspectionId.equals(inspectionId)))
        .watch();
  }

  Future<void> upsertItem({
    required String inspectionId,
    required String title,
    required String result,
  }) async {
    await db.into(db.inspectionItems).insert(
      InspectionItemsCompanion.insert(
        inspectionId: inspectionId,
        title: title,
        result: result,
      ),
      mode: InsertMode.insertOrReplace,
    );
  }
}
