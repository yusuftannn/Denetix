import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../data/local/db/database_provider.dart';
import '../../../data/local/repositories/photo_local_repo.dart';

final photoRepoProvider = Provider<PhotoLocalRepo>((ref) {
  final db = ref.watch(databaseProvider);
  return PhotoLocalRepo(db);
});

final inspectionPhotosProvider =
StreamProvider.family((ref, String inspectionId) {
  final repo = ref.watch(photoRepoProvider);
  return repo.watchByInspection(inspectionId);
});

final photoControllerProvider = Provider<PhotoController>((ref) {
  final repo = ref.watch(photoRepoProvider);
  return PhotoController(repo);
});

class PhotoController {
  final PhotoLocalRepo repo;
  PhotoController(this.repo);

  Future<void> takePhoto(String inspectionId) async {
    final picker = ImagePicker();
    final image =
    await picker.pickImage(source: ImageSource.camera);

    if (image == null) return;

    final dir = await getApplicationDocumentsDirectory();
    final fileName =
        'inspection_${inspectionId}_${DateTime.now().millisecondsSinceEpoch}.jpg';

    final savedFile =
    await File(image.path).copy(p.join(dir.path, fileName));

    await repo.addPhoto(
      inspectionId: inspectionId,
      filePath: savedFile.path,
    );
  }
}
