import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../providers/user_provider.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_info_section.dart';
import 'widgets/profile_statistics.dart';
import 'widgets/profile_menu_section.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final statistics = ref.watch(userStatisticsProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header
          SliverAppBar(
            pinned: true,
            elevation: 0,
            title: const Text('Profil'),
            backgroundColor: Theme.of(context).colorScheme.surface,
            foregroundColor: Theme.of(context).colorScheme.onSurface,
          ),
          // Content
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  // Profile Header Card
                  ProfileHeader(user: user),
                  const SizedBox(height: 24),
                  // User Info
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ProfileInfoSection(user: user),
                  ),
                  const SizedBox(height: 24),
                  // Statistics
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: statistics.when(
                      data: (stats) => ProfileStatistics(statistics: stats),
                      loading: () => const CircularProgressIndicator(),
                      error: (e, st) => const SizedBox.shrink(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Menu Sections
                  const ProfileMenuSection(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
