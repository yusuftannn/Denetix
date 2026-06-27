import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../inspection/application/inspection_controller.dart';
import '../../inspection/presentation/inspection_form_page.dart';
import '../application/dashboard_provider.dart';
import '../../checklist/application/checklist_controller.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/statistics_section.dart';
import 'widgets/quick_actions_section.dart';
import 'widgets/inspections_list_section.dart';
import 'widgets/sync_status_indicator.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inspections = ref.watch(dashboardInspectionsProvider);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: inspections.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (e, _) => Center(
          child: Text('Hata: $e'),
        ),
        data: (list) {
          final total = list.length;
          final draftCount = list.where((e) => e.status == 'draft').length;
          final completedCount =
              list.where((e) => e.status == 'completed').length;
          final inProgressCount =
              list.where((e) => e.status == 'in_progress').length;

          // Today's inspections
          final now = DateTime.now();
          final todayInspections = list.where((inspection) {
            return inspection.createdAt.year == now.year &&
                inspection.createdAt.month == now.month &&
                inspection.createdAt.day == now.day;

          }).toList();

          // Recent inspections (last 5)
          final recentInspections = list
              .where((e) => e.status != 'archived')
              .toList()
              ..sort((a, b) => b.createdAt.compareTo(a.createdAt))
              ..take(5);

          return SingleChildScrollView(
            child: Column(
              children: [
                // Header Section
                DashboardHeader(
                  totalInspections: total,
                ),

                // Sync Status
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: SyncStatusIndicator(),
                ),

                // Statistics Section
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: StatisticsSection(
                    total: total,
                    draft: draftCount,
                    completed: completedCount,
                    inProgress: inProgressCount,
                  ),
                ),

                // Quick Actions
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: QuickActionsSection(
                    onNewInspection: () => _startNewInspection(context, ref),
                  ),
                ),

                const SizedBox(height: 16),

                // Today's Inspections
                if (todayInspections.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: InspectionsListSection(
                      title: "Bugünün Denetimleri",
                      inspections: todayInspections,
                      onInspectionTap: (inspection) =>
                          _openInspection(context, inspection.id),
                    ),
                  ),

                const SizedBox(height: 16),

                // Recent Inspections
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: InspectionsListSection(
                    title: "Son Denetimler",
                    inspections: recentInspections.toList(),
                    onInspectionTap: (inspection) =>
                        _openInspection(context, inspection.id),
                  ),
                ),

                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Yeni Denetim'),
        onPressed: () => _startNewInspection(context, ref),
      ),
    );
  }

  void _startNewInspection(BuildContext context, WidgetRef ref) async {
    final selection = await showModalBottomSheet<Map<String, String>>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const _TemplateSelectionSheet(),
    );

    if (selection == null) return;

    final checklistId = selection['id'];
    final checklistName = selection['name'];

    final controller = ref.read(inspectionControllerProvider);
    final inspectionId = await controller.startNewInspection(
      checklistId: checklistId,
      checklistName: checklistName,
    );

    if (!context.mounted) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => InspectionFormPage(inspectionId: inspectionId),
      ),
    );
  }

  void _openInspection(BuildContext context, String inspectionId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => InspectionFormPage(inspectionId: inspectionId),
      ),
    );
  }
}

class _TemplateSelectionSheet extends ConsumerWidget {
  const _TemplateSelectionSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checklistsAsync = ref.watch(checklistsStreamProvider);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Denetim Şablonu Seçin',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Başlatmak istediğiniz denetim türüne uygun şablonu seçin.',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),
          Flexible(
            child: checklistsAsync.when(
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (err, _) => Center(child: Text('Hata: $err')),
              data: (list) {
                return ListView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Card(
                      elevation: 0.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.grey.shade200),
                      ),
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.assignment, color: Colors.white),
                        ),
                        title: const Text('Genel Denetim (Varsayılan)'),
                        subtitle: const Text('Temel iş yeri güvenliği kontrol maddeleri'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => Navigator.pop(context, {'id': '', 'name': 'Genel Denetim'}),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...list.map((template) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Card(
                            elevation: 0.5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(color: Colors.grey.shade200),
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Theme.of(context).colorScheme.primary,
                                child: const Icon(Icons.list_alt, color: Colors.white),
                              ),
                              title: Text(template.name),
                              subtitle: const Text('Özel denetim şablonu'),
                              trailing: const Icon(Icons.chevron_right),
                              onTap: () => Navigator.pop(context, {
                                'id': template.id,
                                'name': template.name,
                              }),
                            ),
                          ),
                        )),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// DEPRECATED - Keeping for reference
/*
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
*/