import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_state.dart';

final authControllerProvider =
StateNotifierProvider<AuthController, AuthState>(
      (ref) => AuthController(),
);

class AuthController extends StateNotifier<AuthState> {
  AuthController() : super(AuthState.unknown()) {
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    // 🔒 ileride:
    // - local token var mı
    // - offline user var mı
    // - session süresi dolmuş mu

    await Future.delayed(const Duration(milliseconds: 300));
    state = AuthState.unauthenticated();
  }

  void loginSuccess() {
    state = AuthState.authenticated();
  }

  void logout() {
    state = AuthState.unauthenticated();
  }
}
