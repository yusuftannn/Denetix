import 'package:flutter/material.dart';
import '../../../../data/models/user.dart';

class ProfileHeader extends StatelessWidget {
  final User user;

  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // Avatar
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: user.avatarUrl != null
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(user.avatarUrl!),
                        radius: 50,
                      )
                    : Center(
                        child: Text(
                          user.name
                              .split(' ')
                              .map((word) => word[0].toUpperCase())
                              .join(),
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimaryContainer,
                              ),
                        ),
                      ),
              ),
              const SizedBox(height: 16),
              // Name
              Text(
                user.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              // Role
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  user.role,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
