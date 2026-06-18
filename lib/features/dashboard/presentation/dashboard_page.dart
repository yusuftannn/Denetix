import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../inspection/application/inspection_controller.dart';
import '../../inspection/presentation/inspection_form_page.dart';

import '../application/dashboard_provider.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inspections =
    ref.watch(dashboardInspectionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Denetix'),
      ),
      floatingActionButton:
      FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Yeni Denetim'),
        onPressed: () async {
          final controller =
          ref.read(
            inspectionControllerProvider,
          );

          final inspectionId =
          await controller
              .startNewInspection();

          if (!context.mounted) return;

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) =>
                  InspectionFormPage(
                    inspectionId:
                    inspectionId,
                  ),
            ),
          );
        },
      ),
      body: inspections.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (e, _) => Center(
          child: Text(e.toString()),
        ),
        data: (list) {
          final total = list.length;

          final draftCount = list
              .where(
                (e) =>
            e.status == 'draft',
          )
              .length;

          final completedCount = list
              .where(
                (e) =>
            e.status ==
                'completed',
          )
              .length;

          return SingleChildScrollView(
            padding:
            const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        title:
                        'Toplam Denetim',
                        value:
                        total.toString(),
                        icon: Icons
                            .assignment,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: _StatCard(
                        title: 'Taslak',
                        value: draftCount
                            .toString(),
                        icon: Icons
                            .edit_document,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                _StatCard(
                  title: 'Tamamlanan',
                  value: completedCount
                      .toString(),
                  icon:
                  Icons.check_circle,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:
        const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: 12),
            Text(
              value,
              style:
              const TextStyle(
                fontSize: 28,
                fontWeight:
                FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(title),
          ],
        ),
      ),
    );
  }
}