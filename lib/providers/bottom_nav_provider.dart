import 'package:flutter_riverpod/flutter_riverpod.dart';

// Hangi sekmede olduğumuzu (0, 1, 2) tutan basit bir değişken
final bottomNavIndexProvider = StateProvider<int>((ref) => 0);