import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/local/db/app_database.dart';
import '../../../data/local/db/database_provider.dart';
import '../../../data/local/repositories/checklist_local_repo.dart';

final checklistRepoProvider = Provider<ChecklistLocalRepo>((ref) {
  final db = ref.watch(databaseProvider);
  return ChecklistLocalRepo(db);
});

final checklistsStreamProvider = StreamProvider<List<Checklist>>((ref) {
  final repo = ref.watch(checklistRepoProvider);
  // Pre-populate if empty on first listen
  repo.prepopulateDefaultsIfNeeded();
  return repo.watchAll();
});

final checklistItemsStreamProvider =
    StreamProvider.family<List<ChecklistItem>, String>((ref, checklistId) {
  final repo = ref.watch(checklistRepoProvider);
  return repo.watchItems(checklistId);
});

final checklistControllerProvider = Provider<ChecklistController>((ref) {
  final repo = ref.watch(checklistRepoProvider);
  return ChecklistController(repo);
});

class ChecklistController {
  final ChecklistLocalRepo repo;

  ChecklistController(this.repo);

  Future<String> createChecklist(String name) async {
    return repo.createChecklist(name);
  }

  Future<void> addQuestion(String checklistId, String question) async {
    await repo.addQuestion(checklistId, question);
  }

  Future<void> deleteQuestion(int id) async {
    await repo.deleteQuestion(id);
  }

  Future<void> deleteChecklist(String id) async {
    await repo.deleteChecklist(id);
  }
}
