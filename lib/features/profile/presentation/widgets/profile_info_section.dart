import 'package:flutter/material.dart';
import '../../../../data/models/user.dart';
import 'profile_info_tile.dart';

class ProfileInfoSection extends StatelessWidget {
  final User user;

  const ProfileInfoSection({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'İletişim Bilgileri',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            ProfileInfoTile(
              icon: Icons.email_outlined,
              label: 'E-posta',
              value: user.email,
            ),
            if (user.phoneNumber != null)
              ProfileInfoTile(
                icon: Icons.phone_outlined,
                label: 'Telefon',
                value: user.phoneNumber!,
              ),
            ProfileInfoTile(
              icon: Icons.calendar_today_outlined,
              label: 'Kayıt Tarihi',
              value: _formatDate(user.createdAt),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
