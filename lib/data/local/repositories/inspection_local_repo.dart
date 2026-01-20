import 'package:drift/drift.dart';
import '../db/app_database.dart';

class InspectionLocalRepo {
  final AppDatabase db;
  InspectionLocalRepo(this.db);

  Future<void> createDraftInspection({
    required String id,
  }) {
    return db.into(db.inspections).insert(
      InspectionsCompanion.insert(
        id: id,
        status: 'draft',
        createdAt: DateTime.now(),
      ),
    );
  }

  Stream<List<Inspection>> watchAll() {
    return db.select(db.inspections).watch();
  }

  Future<void> archiveInspection(String id) {
    return (db.update(db.inspections)
      ..where((t) => t.id.equals(id)))
        .write(
      const InspectionsCompanion(
        status: Value('archived'),
      ),
    );
  }

  Future<void> completeInspection(String id) {
    return (db.update(db.inspections)
      ..where((t) => t.id.equals(id)))
        .write(
      const InspectionsCompanion(
        status: Value('completed'),
      ),
    );
  }
  Future<void> deleteInspection(String id) async {
    await (db.delete(db.inspectionItems)
      ..where((t) => t.inspectionId.equals(id)))
        .go();

    await (db.delete(db.photos)
      ..where((t) => t.inspectionId.equals(id)))
        .go();

    await (db.delete(db.signatures)
      ..where((t) => t.inspectionId.equals(id)))
        .go();

    await (db.delete(db.inspections)
      ..where((t) => t.id.equals(id)))
        .go();
  }
}
