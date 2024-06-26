class UserModel {
  final String? id;
  final String name;
  final String email;
  final String password;
  final String role;
  final String? phone;
  bool isBanned;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.role = 'user',
    this.phone = '',
    this.isBanned = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'phone': phone,
      'isBanned': isBanned,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      id: documentId,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      role: map['role'] ?? 'user',
      phone: map['phone'],
      isBanned: map['isBanned'] ?? false,
    );
  }
}
