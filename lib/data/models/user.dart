class User {
  final String id;
  final String name;
  final String email;
  final String? phoneNumber;
  final String role;
  final String? avatarUrl;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.phoneNumber,
    required this.role,
    this.avatarUrl,
    required this.createdAt,
    this.updatedAt,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? role,
    String? avatarUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      role: role ?? this.role,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
