import 'package:drift/drift.dart';
import '../db/app_database.dart';

class PhotoLocalRepo {
  final AppDatabase db;
  PhotoLocalRepo(this.db);

  Stream<List<Photo>> watchByInspection(String inspectionId) {
    return (db.select(db.photos)
      ..where((t) => t.inspectionId.equals(inspectionId)))
        .watch();
  }

  Future<void> addPhoto({
    required String inspectionId,
    required String filePath,
  }) {
    return db.into(db.photos).insert(
      PhotosCompanion.insert(
        inspectionId: inspectionId,
        filePath: filePath,
      ),
    );
  }
}
