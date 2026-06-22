import 'package:flutter/material.dart';
import '../../../../providers/user_provider.dart';
import 'profile_stat_card.dart';

class ProfileStatistics extends StatelessWidget {
  final UserStatistics statistics;

  const ProfileStatistics({super.key, required this.statistics});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'İstatistikler',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          children: [
            ProfileStatCard(
              label: 'Toplam Denetim',
              value: statistics.totalInspections.toString(),
              icon: Icons.assignment,
              color: Colors.blue,
            ),
            ProfileStatCard(
              label: 'Tamamlanan',
              value: statistics.completedInspections.toString(),
              icon: Icons.check_circle,
              color: Colors.green,
            ),
            ProfileStatCard(
              label: 'Devam Eden',
              value: statistics.inProgressInspections.toString(),
              icon: Icons.pending_actions,
              color: Colors.orange,
            ),
            ProfileStatCard(
              label: 'Raporlar',
              value: statistics.totalReports.toString(),
              icon: Icons.bar_chart,
              color: Colors.purple,
            ),
          ],
        ),
      ],
    );
  }
}
