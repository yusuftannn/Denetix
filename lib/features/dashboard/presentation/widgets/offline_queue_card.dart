import 'package:flutter/material.dart';

class OfflineQueueCard extends StatelessWidget {
  final int pendingItems;
  final VoidCallback? onSyncTap;

  const OfflineQueueCard({
    super.key,
    this.pendingItems = 0,
    this.onSyncTap,
  });

  @override
  Widget build(BuildContext context) {
    if (pendingItems == 0) {
      return const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.amber.withOpacity(0.3),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(
            Icons.cloud_upload_outlined,
            color: Colors.amber[700],
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Çevrimdışı Kuyruğu',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.amber[900],
                      ),
                ),
                Text(
                  '$pendingItems öğe senkronize edilmeyi bekliyor',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.amber[700],
                      ),
                ),
              ],
            ),
          ),
          if (onSyncTap != null)
            TextButton(
              onPressed: onSyncTap,
              child: const Text('Gönder'),
            ),
        ],
      ),
    );
  }
}
