import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;
  ApiService({required this.baseUrl});
  Future<String> sendCode(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/send-code'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );
    if (response.statusCode == 200) {
      return 'Verification code sent';
    } else {
      final msg = jsonDecode(response.body)['message'];
      throw Exception(msg);
    }
  }

  Future<String> verifyCode(String email, String code) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/verify-code'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'code': code}),
    );
    if (response.statusCode == 200) {
      return 'Email verified successfully!';
    } else {
      final msg = jsonDecode(response.body)['message'];
      throw Exception(msg);
    }
  }

  Future<String> resendCode(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/resend-code'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );
    if (response.statusCode == 200) {
      return 'New code sent';
    } else {
      final msg = jsonDecode(response.body)['message'];
      throw Exception(msg);
    }
  }
}
