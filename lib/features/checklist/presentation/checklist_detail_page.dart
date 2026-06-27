import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/checklist_controller.dart';

class ChecklistDetailPage extends ConsumerWidget {
  final String checklistId;
  final String checklistName;

  const ChecklistDetailPage({
    super.key,
    required this.checklistId,
    required this.checklistName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(checklistItemsStreamProvider(checklistId));

    return Scaffold(
      appBar: AppBar(
        title: Text(checklistName),
      ),
      body: itemsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Hata: $err')),
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.question_mark_rounded,
                    size: 64,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Henüz soru eklenmemiş.',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Şablona sorular eklemek için aşağıdaki butonu kullanın.',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 14,
                    backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(item.question),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () async {
                      await ref
                          .read(checklistControllerProvider)
                          .deleteQuestion(item.id);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddQuestionDialog(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Soru Ekle'),
      ),
    );
  }

  void _showAddQuestionDialog(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Yeni Soru Ekle'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Soru / Kontrol Maddesi',
            hintText: 'Örn: Zemin kayganlık uyarısı var mı?',
            border: OutlineInputBorder(),
          ),
          textCapitalization: TextCapitalization.sentences,
          maxLines: 2,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Vazgeç'),
          ),
          FilledButton(
            onPressed: () async {
              final question = controller.text.trim();
              if (question.isNotEmpty) {
                Navigator.pop(context);
                await ref
                    .read(checklistControllerProvider)
                    .addQuestion(checklistId, question);
              }
            },
            child: const Text('Ekle'),
          ),
        ],
      ),
    );
  }
}
