enum AuthStatus {
  unknown,
  unauthenticated,
  authenticated,
}

class AuthState {
  final AuthStatus status;

  const AuthState({required this.status});

  factory AuthState.unknown() =>
      const AuthState(status: AuthStatus.unknown);

  factory AuthState.unauthenticated() =>
      const AuthState(status: AuthStatus.unauthenticated);

  factory AuthState.authenticated() =>
      const AuthState(status: AuthStatus.authenticated);
}
