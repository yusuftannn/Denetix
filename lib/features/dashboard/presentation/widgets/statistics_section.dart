import 'package:flutter/material.dart';

class StatisticsSection extends StatelessWidget {
  final int total;
  final int draft;
  final int completed;
  final int inProgress;

  const StatisticsSection({
    super.key,
    required this.total,
    required this.draft,
    required this.completed,
    required this.inProgress,
  });

  @override
  Widget build(BuildContext context) {
    final completionRate =
        total > 0 ? ((completed / total) * 100).toStringAsFixed(1) : '0';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Denetim İstatistikleri',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        // Stats Grid
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.1,
          children: [
            _StatCard(
              title: 'Taslak',
              value: draft.toString(),
              icon: Icons.edit_document,
              color: Colors.orange,
              backgroundColor: Colors.orange.withOpacity(0.1),
            ),
            _StatCard(
              title: 'Devam Eden',
              value: inProgress.toString(),
              icon: Icons.assignment_turned_in,
              color: Colors.blue,
              backgroundColor: Colors.blue.withOpacity(0.1),
            ),
            _StatCard(
              title: 'Tamamlanan',
              value: completed.toString(),
              icon: Icons.check_circle,
              color: Colors.green,
              backgroundColor: Colors.green.withOpacity(0.1),
            ),
            _StatCard(
              title: 'Tamamlanma %',
              value: completionRate,
              icon: Icons.percent,
              color: Colors.purple,
              backgroundColor: Colors.purple.withOpacity(0.1),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Progress bar
        _ProgressSection(
          completed: completed,
          total: total,
          completionRate: double.parse(completionRate),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final Color backgroundColor;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
              ),
              const SizedBox(height: 2),
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProgressSection extends StatelessWidget {
  final int completed;
  final int total;
  final double completionRate;

  const _ProgressSection({
    required this.completed,
    required this.total,
    required this.completionRate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey[200]!,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Genel İlerleme',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                '$completed / $total',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: total > 0 ? completionRate / 100 : 0,
              minHeight: 8,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.green[500]!,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            completionRate > 0
                ? '%${completionRate.toStringAsFixed(1)} tamamlandı'
                : 'Henüz başlanmadı',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
        ],
      ),
    );
  }
}
