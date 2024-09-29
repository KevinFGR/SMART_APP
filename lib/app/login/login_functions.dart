import 'package:flutter/material.dart';
import 'package:smart_app/app/list/list_view.dart';
import 'package:smart_app/services/auth_service.dart';

class LoginFunctions {
  static void navigateToListPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListPage()),
    );
  }

  static void auth(String email, String pass) async {
    print(email);
    final Map<String, dynamic> body = {
      'email': email,
      'password': pass,
    };
    var authService =  AuthService();
    var res = await authService.post(body);
    print(res);
  }
}