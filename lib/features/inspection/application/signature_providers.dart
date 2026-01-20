import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/db/app_database.dart';
import '../../../data/local/db/database_provider.dart';
import '../../../data/local/repositories/signature_local_repo.dart';

final signatureRepoProvider = Provider<SignatureLocalRepo>((ref) {
  final db = ref.watch(databaseProvider);
  return SignatureLocalRepo(db);
});

final inspectionSignatureProvider =
StreamProvider.family<Signature?, String>((ref, inspectionId) {
  final repo = ref.watch(signatureRepoProvider);
  return repo.watchByInspection(inspectionId);
});
