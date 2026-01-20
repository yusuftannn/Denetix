import 'package:drift/drift.dart';
import '../db/app_database.dart';

class SignatureLocalRepo {
  final AppDatabase db;
  SignatureLocalRepo(this.db);

  Stream<Signature?> watchByInspection(String inspectionId) {
    return (db.select(db.signatures)
      ..where((t) => t.inspectionId.equals(inspectionId)))
        .watchSingleOrNull();
  }

  Future<void> saveOrUpdateSignature({
    required String inspectionId,
    required String filePath,
  }) async {
    await db.into(db.signatures).insert(
      SignaturesCompanion.insert(
        inspectionId: inspectionId,
        filePath: filePath,
      ),
      mode: InsertMode.insertOrReplace,
    );
  }
}

