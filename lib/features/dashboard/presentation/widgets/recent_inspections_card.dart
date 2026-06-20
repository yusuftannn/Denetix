import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecentInspectionsCard extends StatelessWidget {
  final List<dynamic> inspections;
  final Function(dynamic) onInspectionTap;

  const RecentInspectionsCard({
    super.key,
    required this.inspections,
    required this.onInspectionTap,
  });

  @override
  Widget build(BuildContext context) {
    if (inspections.isEmpty) {
      return SizedBox.fromSize(size: Size.zero);
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey[200]!,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Son Denetimler',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: inspections.take(5).length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: Colors.grey[200],
              indent: 16,
              endIndent: 16,
            ),
            itemBuilder: (context, index) {
              final inspection = inspections[index];
              final dateFormat = DateFormat('d MMM yyyy', 'tr_TR');
              final date = dateFormat.format(inspection.createdAt ?? DateTime.now());

              return ListTile(
                title: Text('Denetim #${inspection.id.substring(0, 8).toUpperCase()}'),
                subtitle: Text(date),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey[400],
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
