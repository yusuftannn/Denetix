import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../db/app_database.dart';

class ChecklistLocalRepo {
  final AppDatabase db;
  ChecklistLocalRepo(this.db);

  Stream<List<Checklist>> watchAll() {
    return (db.select(db.checklists)
          ..orderBy([
            (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)
          ]))
        .watch();
  }

  Future<List<Checklist>> getAll() {
    return (db.select(db.checklists)
          ..orderBy([
            (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)
          ]))
        .get();
  }

  Stream<List<ChecklistItem>> watchItems(String checklistId) {
    return (db.select(db.checklistItems)
          ..where((t) => t.checklistId.equals(checklistId)))
        .watch();
  }

  Future<List<ChecklistItem>> getItems(String checklistId) {
    return (db.select(db.checklistItems)
          ..where((t) => t.checklistId.equals(checklistId)))
        .get();
  }

  Future<String> createChecklist(String name) async {
    final id = const Uuid().v4();
    await db.into(db.checklists).insert(
          ChecklistsCompanion.insert(
            id: id,
            name: name,
            createdAt: DateTime.now(),
          ),
        );
    return id;
  }

  Future<void> addQuestion(String checklistId, String question) async {
    await db.into(db.checklistItems).insert(
          ChecklistItemsCompanion.insert(
            checklistId: checklistId,
            question: question,
          ),
        );
  }

  Future<void> deleteQuestion(int id) async {
    await (db.delete(db.checklistItems)..where((t) => t.id.equals(id))).go();
  }

  Future<void> deleteChecklist(String id) async {
    // Delete checklist items first
    await (db.delete(db.checklistItems)..where((t) => t.checklistId.equals(id))).go();
    // Delete the checklist itself
    await (db.delete(db.checklists)..where((t) => t.id.equals(id))).go();
  }

  Future<void> prepopulateDefaultsIfNeeded() async {
    final list = await db.select(db.checklists).get();
    if (list.isNotEmpty) return;

    // Create 1: İş Güvenliği ve Sağlığı (İSG) Kontrolü
    final isgId = await createChecklist('İş Güvenliği ve Sağlığı (İSG) Kontrolü');
    final isgQuestions = [
      'Yangın tüpleri dolu ve kontrol tarihleri güncel mi?',
      'Acil çıkış yolları ve kapıları açık ve engelsiz mi?',
      'Çalışanlar gerekli kişisel koruyucu donanımları (KKD) kullanıyor mu?',
      'İlk yardım dolabı tam ve erişilebilir durumda mı?',
    ];
    for (final q in isgQuestions) {
      await addQuestion(isgId, q);
    }

    // Create 2: Mağaza Düzen ve Temizlik Denetimi
    final magazaId = await createChecklist('Mağaza Düzen ve Temizlik Denetimi');
    final magazaQuestions = [
      'Zemin temiz, kuru ve kayma tehlikesinden arındırılmış mı?',
      'Raf düzeni ve ürün yerleşimi standartlara uygun mu?',
      'Aydınlatma ve havalandırma sistemleri sorunsuz çalışıyor mu?',
      'Mağaza içi görseller ve fiyat etiketleri güncel mi?',
    ];
    for (final q in magazaQuestions) {
      await addQuestion(magazaId, q);
    }

    // Create 3: Elektrik ve Tesisat Güvenliği
    final elektrikId = await createChecklist('Elektrik ve Tesisat Güvenliği');
    final elektrikQuestions = [
      'Elektrik panolarının önü kapalı mı, kilitli mi?',
      'Kablolar düzenli ve açıkta tehlikeli kablo var mı?',
      'Prizler ve anahtarlar hasarsız mı?',
      'Topraklama ve kaçak akım rölesi test edilmiş mi?',
    ];
    for (final q in elektrikQuestions) {
      await addQuestion(elektrikId, q);
    }
  }
}
