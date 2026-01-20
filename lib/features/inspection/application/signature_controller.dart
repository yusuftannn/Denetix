import 'dart:io';
import 'dart:typed_data';
import '../../../data/local/repositories/signature_local_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'signature_providers.dart';

final signatureControllerProvider =
Provider<SignatureController>((ref) {
  final repo = ref.watch(signatureRepoProvider);
  return SignatureController(repo);
});

class SignatureController {
  final SignatureLocalRepo repo;
  SignatureController(this.repo);

  Future<void> saveSignatureBytes({
    required String inspectionId,
    required Uint8List bytes,
  }) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'signature_$inspectionId.png'));

    await file.writeAsBytes(bytes);

    await repo.saveOrUpdateSignature(
      inspectionId: inspectionId,
      filePath: file.path,
    );
  }
}
