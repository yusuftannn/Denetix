import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/db/database_provider.dart';
import '../../../data/local/repositories/inspection_item_local_repo.dart';

final inspectionItemRepoProvider =
Provider<InspectionItemLocalRepo>((ref) {
  final db = ref.watch(databaseProvider);
  return InspectionItemLocalRepo(db);
});

final inspectionItemsProvider =
StreamProvider.family((ref, String inspectionId) {
  final repo = ref.watch(inspectionItemRepoProvider);
  return repo.watchByInspection(inspectionId);
});

final inspectionItemControllerProvider =
Provider<InspectionItemController>((ref) {
  final repo = ref.watch(inspectionItemRepoProvider);
  return InspectionItemController(repo);
});

class InspectionItemController {
  final InspectionItemLocalRepo repo;
  InspectionItemController(this.repo);

  Future<void> setResult({
    required String inspectionId,
    required String title,
    required String result,
  }) {
    return repo.upsertItem(
      inspectionId: inspectionId,
      title: title,
      result: result,
    );
  }
}
