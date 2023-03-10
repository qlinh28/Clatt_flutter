import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swd_project_clatt/common/constants.dart';

Future<void> loginUser(String username, String password) async {
  final response = await http.post(
    Uri.parse('$BASE_URL/login'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'username': username, 'password': password}),
  );

  if (response.statusCode == 202) {
    // Login successful, do something
    print("login success");
  } else {
    print("fail");
  }
}
