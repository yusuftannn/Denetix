import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'profile_menu_tile.dart';

class ProfileMenuSection extends StatelessWidget {
  const ProfileMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ayarlar',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Column(
              children: [
                ProfileMenuTile(
                  icon: Icons.person_outline,
                  label: 'Profili Düzenle',
                  onTap: () {
                    // TODO: Profil düzenle sayfasına git
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Profil düzenle yakında gelecek')),
                    );
                  },
                ),
                const Divider(height: 1),
                ProfileMenuTile(
                  icon: Icons.notifications_outlined,
                  label: 'Bildirimler',
                  onTap: () {
                    // TODO: Bildirim ayarlarına git
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Bildirim ayarları yakında gelecek')),
                    );
                  },
                ),
                const Divider(height: 1),
                ProfileMenuTile(
                  icon: Icons.security_outlined,
                  label: 'Güvenlik',
                  onTap: () {
                    // TODO: Güvenlik ayarlarına git
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Güvenlik ayarları yakında gelecek')),
                    );
                  },
                ),
                const Divider(height: 1),
                ProfileMenuTile(
                  icon: Icons.info_outline,
                  label: 'Hakkında',
                  onTap: () {
                    _showAboutDialog(context);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Logout Button
          SizedBox(
            width: double.infinity,
            child: FilledButton.tonal(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red.shade50,
                foregroundColor: Colors.red,
              ),
              onPressed: () {
                _showLogoutDialog(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.logout),
                    const SizedBox(width: 8),
                    Text(
                      'Çıkış Yap',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Colors.red,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Çıkış Yap'),
        content: const Text('Uygulamadan çıkmak istediğinize emin misiniz?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Vazgeç'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              Navigator.pop(context, true);
              // TODO: Logout işlemi gerçekleştir
              context.go('/login');
            },
            child: const Text('Çıkış Yap'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Denetix',
      applicationVersion: '1.0.0',
      applicationLegalese: '© 2024 Denetix. Tüm hakları saklıdır.',
      children: [
        const SizedBox(height: 16),
        const Text(
          'Denetix, işyeri denetim ve raporlama uygulamasıdır. Denetim sürecini hızlandırmak ve raporları düzenli bir şekilde oluşturmak için tasarlanmıştır.',
        ),
      ],
    );
  }
}
