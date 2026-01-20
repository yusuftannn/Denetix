import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/inspection_controller.dart';
import '../application/signature_providers.dart';
import '../application/inspection_item_controller.dart';
import '../application/photo_controller.dart';
import '../application/signature_controller.dart';
import '../application/pdf_controller.dart';
import '../domain/inspection_result.dart';
import 'signature_page.dart';

class InspectionFormPage extends ConsumerWidget {
  final String inspectionId;

  const InspectionFormPage({super.key, required this.inspectionId});

  static const items = [
    'Yangın tüpü mevcut mu?',
    'Acil çıkışlar açık mı?',
    'Elektrik panosu güvenli mi?',
    'Zemin kaygan mı?',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncItems = ref.watch(inspectionItemsProvider(inspectionId));

    final photos = ref.watch(inspectionPhotosProvider(inspectionId));

    final signature = ref.watch(inspectionSignatureProvider(inspectionId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Denetim Formu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Denetimi Sil'),
                  content: const Text(
                    'Bu denetim kalıcı olarak silinecek. Emin misiniz?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Vazgeç'),
                    ),
                    FilledButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Sil'),
                    ),
                  ],
                ),
              );

              if (confirm == true) {
                ref
                    .read(inspectionControllerProvider)
                    .deleteInspection(inspectionId);

                if (!context.mounted) return;
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: asyncItems.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (savedItems) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ...items.map((title) {
                final saved = savedItems
                    .where((e) => e.title == title)
                    .toList();

                final currentResult = saved.isEmpty
                    ? null
                    : InspectionResultX.from(saved.first.result);

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          children: InspectionResult.values.map((r) {
                            return ChoiceChip(
                              label: Text(r.name),
                              selected: currentResult == r,
                              onSelected: (_) {
                                ref
                                    .read(inspectionItemControllerProvider)
                                    .setResult(
                                      inspectionId: inspectionId,
                                      title: title,
                                      result: r.value,
                                    );
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                );
              }),

              const SizedBox(height: 24),

              Text(
                'Fotoğraf Kanıtlar',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),

              photos.when(
                loading: () => const CircularProgressIndicator(),
                error: (e, _) => Text(e.toString()),
                data: (list) => Column(
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: list
                          .map(
                            (p) => ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                File(p.filePath),
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 12),
                    FilledButton.icon(
                      icon: const Icon(Icons.camera_alt),
                      label: const Text('Fotoğraf Çek'),
                      onPressed: () {
                        ref
                            .read(photoControllerProvider)
                            .takePhoto(inspectionId);
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Text('İmza', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),

              signature.when(
                loading: () => const SizedBox(),
                error: (e, _) => Text(e.toString()),
                data: (sig) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (sig != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(File(sig.filePath), height: 120),
                      ),
                    const SizedBox(height: 8),
                    FilledButton.icon(
                      icon: const Icon(Icons.draw),
                      label: Text(
                        sig == null ? 'İmza Ekle' : 'İmzayı Güncelle',
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                SignaturePage(inspectionId: inspectionId),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              FilledButton.icon(
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text('PDF Rapor Oluştur'),
                onPressed: () {
                  ref
                      .read(pdfControllerProvider)
                      .generateAndPreview(inspectionId);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
