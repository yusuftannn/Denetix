import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/inspection_controller.dart';
import '../application/pdf_controller.dart';
import '../presentation/inspection_form_page.dart';

import '../../dashboard/application/dashboard_provider.dart';

import '../../../data/local/db/app_database.dart';

class InspectionsPage extends ConsumerWidget {
  const InspectionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inspections =
    ref.watch(dashboardInspectionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Denetimler'),
      ),
      body: inspections.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (e, _) => Center(
          child: Text(e.toString()),
        ),
        data: (list) {
          if (list.isEmpty) {
            return const Center(
              child: Text('Henüz denetim yok'),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: list.length,
            separatorBuilder: (_, __) =>
            const SizedBox(height: 8),
            itemBuilder: (_, i) {
              final item = list[i];

              return Card(
                child: ListTile(
                  title: Text(
                    'Denetim #${item.id.substring(0, 6)}',
                  ),
                  subtitle: Text(
                    'Durum: ${item.status}',
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                  ),
                  onTap: () {
                    if (item.status == 'draft') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              InspectionFormPage(
                                inspectionId: item.id,
                              ),
                        ),
                      );
                    } else if (item.status ==
                        'completed') {
                      ref
                          .read(
                        pdfControllerProvider,
                      )
                          .generateAndPreview(
                        item.id,
                      );
                    }
                  },
                  onLongPress: () {
                    _showInspectionActions(
                      context,
                      ref,
                      item,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

void _showInspectionActions(
    BuildContext context,
    WidgetRef ref,
    Inspection item,
    ) {
  showModalBottomSheet(
    context: context,
    builder: (_) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (item.status == 'draft')
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Düzenle'),
              onTap: () {
                Navigator.pop(context);

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        InspectionFormPage(
                          inspectionId: item.id,
                        ),
                  ),
                );
              },
            ),
          ListTile(
            leading: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            title: const Text(
              'Sil',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onTap: () async {
              Navigator.pop(context);

              final confirm =
              await showDialog<bool>(
                context: context,
                builder: (_) => AlertDialog(
                  title:
                  const Text('Denetimi Sil'),
                  content: const Text(
                    'Bu denetim kalıcı olarak silinecek. Emin misiniz?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () =>
                          Navigator.pop(
                            context,
                            false,
                          ),
                      child:
                      const Text('Vazgeç'),
                    ),
                    FilledButton(
                      onPressed: () =>
                          Navigator.pop(
                            context,
                            true,
                          ),
                      child: const Text('Sil'),
                    ),
                  ],
                ),
              );

              if (confirm == true) {
                await ref
                    .read(
                  inspectionControllerProvider,
                )
                    .deleteInspection(
                  item.id,
                );
              }
            },
          ),
        ],
      ),
    ),
  );
}