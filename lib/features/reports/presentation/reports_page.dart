import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../application/reports_provider.dart';

class ReportsPage extends ConsumerWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(reportsStatsProvider);
    final filter = ref.watch(filteredInspectionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Raporlar'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _StatsSection(
              total: stats['total'] as int,
              completed: stats['completed'] as int,
              draft: stats['draft'] as int,
              completionRate: stats['completionRate'].toString(),
            ),
            const SizedBox(height: 24),
            _FilterAndListSection(
              currentFilter: filter,
              onFilterChanged: (newFilter) {
                ref
                    .read(filteredInspectionsProvider.notifier)
                    .setFilter(newFilter);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsSection extends StatelessWidget {
  final int total;
  final int completed;
  final int draft;
  final String completionRate;

  const _StatsSection({
    required this.total,
    required this.completed,
    required this.draft,
    required this.completionRate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'İstatistikler',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          // Main completion percentage card
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade400,
                  Colors.blue.shade600,
                ],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  'Tamamlanma Oranı',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white70,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  '%$completionRate',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 12),
                // Progress bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: double.parse(completionRate) / 100,
                    minHeight: 8,
                    backgroundColor: Colors.white24,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.green.shade400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Stats row
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  title: 'Toplam',
                  value: total.toString(),
                  icon: Icons.assignment,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  title: 'Tamamlanan',
                  value: completed.toString(),
                  icon: Icons.check_circle,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  title: 'Taslak',
                  value: draft.toString(),
                  icon: Icons.edit,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterAndListSection extends ConsumerWidget {
  final String currentFilter;
  final Function(String) onFilterChanged;

  const _FilterAndListSection({
    required this.currentFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredList = ref.watch(filteredReportListProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Denetimler',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _FilterChip(
                label: 'Tümü',
                isSelected: currentFilter == 'all',
                onPressed: () => onFilterChanged('all'),
              ),
              const SizedBox(width: 8),
              _FilterChip(
                label: 'Tamamlanan',
                isSelected: currentFilter == 'completed',
                onPressed: () => onFilterChanged('completed'),
              ),
              const SizedBox(width: 8),
              _FilterChip(
                label: 'Taslak',
                isSelected: currentFilter == 'draft',
                onPressed: () => onFilterChanged('draft'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        if (filteredList.isEmpty)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.assignment_outlined,
                    size: 48,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Denetim bulunamadı',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              final inspection = filteredList[index];

              return _InspectionListTile(
                inspection: inspection,
              );
            },
          ),

        const SizedBox(height: 20),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onPressed(),
      backgroundColor: Colors.grey.shade100,
      selectedColor: Colors.blue.shade100,
      labelStyle: TextStyle(
        color: isSelected ? Colors.blue : Colors.grey.shade700,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
    );
  }
}

class _InspectionListTile extends StatelessWidget {
  final dynamic inspection;

  const _InspectionListTile({
    required this.inspection,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy HH:mm');
    final formattedDate = dateFormat.format(inspection.createdAt);

    final isCompleted = inspection.status == 'completed';
    final statusColor = isCompleted ? Colors.green : Colors.orange;
    final statusText = isCompleted ? 'Tamamlandı' : 'Taslak';

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Denetim ID: ${inspection.id.substring(0, 8)}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        formattedDate,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey.shade600,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    statusText,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  isCompleted
                      ? Icons.check_circle_outline
                      : Icons.edit_document,
                  size: 20,
                  color: statusColor,
                ),
                const SizedBox(width: 8),
                Text(
                  isCompleted
                      ? 'Tamamlanan denetim'
                      : 'Devam eden denetim',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: statusColor,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
