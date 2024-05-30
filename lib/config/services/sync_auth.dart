import 'package:http/http.dart' as http;
import 'dart:convert';

class SyncAuth {
  static const String serverUrl = 'http://127.0.0.1:8000/api'; 

  static Future<void> syncUserToMySQL(String name, String email, String password) async {
    //int roleId = role == 'admin' ? 1 : 2;

    try {
      // Sync to MySQL
      final response = await http.post(
        Uri.parse('$serverUrl/register'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          //'role_id': roleId,
        }),
      );

      if (response.statusCode == 201) {
        print('User synced to MySQL successfully');
      } else {
        print('Failed to sync user to MySQL: ${response.statusCode}');
      }
    } catch (e) {
      print('Error syncing user to MySQL: $e');
    }
  }
}
