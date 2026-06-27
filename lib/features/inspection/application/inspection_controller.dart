import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../../../data/local/db/app_database.dart';
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

  Future<String> startNewInspection({
    String? checklistId,
    String? checklistName,
  }) async {
    final id = const Uuid().v4();

    try {
      await repo.createDraftInspection(id: id, checklistName: checklistName);

      final db = repo.db;
      List<String> questions = [];
      if (checklistId != null && checklistId.isNotEmpty) {
        final items = await (db.select(db.checklistItems)
              ..where((t) => t.checklistId.equals(checklistId)))
            .get();
        questions = items.map((e) => e.question).toList();
      }

      if (questions.isEmpty) {
        questions = [
          'Yangın tüpü mevcut mu?',
          'Acil çıkışlar açık mı?',
          'Elektrik panosu güvenli mi?',
          'Zemin kaygan mı?',
        ];
      }

      for (final q in questions) {
        await db.into(db.inspectionItems).insert(
              InspectionItemsCompanion.insert(
                inspectionId: id,
                title: q,
                result: '', // empty/unanswered
              ),
            );
      }
    } catch (e, s) {
      debugPrint('Create inspection error: $e');
      debugPrintStack(stackTrace: s);
    }

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
