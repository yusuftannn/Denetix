import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayInspectionCard extends StatelessWidget {
  final List<dynamic> todayInspections;
  final Function(dynamic) onInspectionTap;

  const TodayInspectionCard({
    super.key,
    required this.todayInspections,
    required this.onInspectionTap,
  });

  @override
  Widget build(BuildContext context) {
    if (todayInspections.isEmpty) {
      return SizedBox.fromSize(size: Size.zero);
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue[50]!,
            Colors.blue[100]!,
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.blue[200]!,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  Icons.today,
                  color: Colors.blue[600],
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Bugünün Denetimleri',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(
                    todayInspections.length.toString(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: todayInspections.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: Colors.blue[200],
              indent: 16,
              endIndent: 16,
            ),
            itemBuilder: (context, index) {
              final inspection = todayInspections[index];
              final timeFormat = DateFormat('HH:mm', 'tr_TR');
              final time = timeFormat.format(inspection.createdAt ?? DateTime.now());

              return ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.assignment,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                title: Text(
                  'Denetim #${inspection.id.substring(0, 8).toUpperCase()}',
                  style: TextStyle(color: Colors.blue[900]),
                ),
                subtitle: Text(
                  time,
                  style: TextStyle(color: Colors.blue[700]),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.blue[600],
                ),
                onTap: () => onInspectionTap(inspection),
              );
            },
          ),
        ],
      ),
    );
  }
}
