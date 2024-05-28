import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRemoteDataSource {
  Future<void> register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      final data = jsonDecode(response.body);
      print('Registration successful: $data');
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to register user: ${response.body}');
    }
  }
}
