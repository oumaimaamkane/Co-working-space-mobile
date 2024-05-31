class UserModel {
  final String name;
  final String email;
  final String password;
  final String role;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    this.role = 'user',
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'role': role,
    };
  }
}
