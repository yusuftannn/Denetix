import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../../../data/local/db/database_provider.dart';
import '../../../data/local/repositories/inspection_local_repo.dart';

final inspectionRepoProvider = Provider<InspectionLocalRepo>((ref) {
  final db = ref.watch(databaseProvider);
  return InspectionLocalRepo(db);
});

final inspectionControllerProvider =
Provider<InspectionController>((ref) {
  final repo = ref.watch(inspectionRepoProvider);
  return InspectionController(repo);
});

class InspectionController {
  final InspectionLocalRepo repo;
  InspectionController(this.repo);

  String startNewInspection() {
    final id = const Uuid().v4();

    Future.microtask(() async {
      try {
        await repo.createDraftInspection(id: id);
      } catch (e, s) {
        debugPrint('Create inspection error: $e');
        debugPrintStack(stackTrace: s);
      }
    });

    return id;
  }

  Future<void> archiveInspection(String id) async {
    try {
      await repo.archiveInspection(id);
    } catch (e, s) {
      debugPrint('Archive inspection error: $e');
      debugPrintStack(stackTrace: s);
    }
  }

  Future<void> completeInspection(String id) async {
    try {
      await repo.completeInspection(id);
    } catch (e, s) {
      debugPrint('Complete inspection error: $e');
      debugPrintStack(stackTrace: s);
    }
  }
  Future<void> deleteInspection(String id) async {
    try {
      await repo.deleteInspection(id);
    } catch (e, s) {
      debugPrint('Delete inspection error: $e');
      debugPrintStack(stackTrace: s);
    }
  }
}
