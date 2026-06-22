import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/user.dart';

// Mock user data - gerçek uygulamada bu API'den veya local storage'dan gelecek
final mockUser = User(
  id: '1',
  name: 'Ahmet Yılmaz',
  email: 'ahmet.yilmaz@denetix.com',
  phoneNumber: '+90 555 123 4567',
  role: 'Denetçi',
  avatarUrl: null,
  createdAt: DateTime.now().subtract(const Duration(days: 365)),
  updatedAt: DateTime.now().subtract(const Duration(days: 7)),
);

// Current user provider
final currentUserProvider = StateProvider<User>((ref) {
  return mockUser;
});

// User statistics provider
final userStatisticsProvider = FutureProvider<UserStatistics>((ref) async {
  // API call simülasyonu - gerçek uygulamada API'den gelecek
  await Future.delayed(const Duration(milliseconds: 500));
  
  return UserStatistics(
    totalInspections: 124,
    completedInspections: 98,
    inProgressInspections: 15,
    draftInspections: 11,
    totalReports: 45,
  );
});

class UserStatistics {
  final int totalInspections;
  final int completedInspections;
  final int inProgressInspections;
  final int draftInspections;
  final int totalReports;

  UserStatistics({
    required this.totalInspections,
    required this.completedInspections,
    required this.inProgressInspections,
    required this.draftInspections,
    required this.totalReports,
  });
}
