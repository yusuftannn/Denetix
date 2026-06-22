import 'package:flutter/material.dart';

class ProfileMenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool showBadge;
  final String? badgeLabel;

  const ProfileMenuTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.showBadge = false,
    this.badgeLabel,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing: showBadge && badgeLabel != null
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                badgeLabel!,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            )
          : const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
