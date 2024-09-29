import 'package:flutter/material.dart';
import 'package:smart_app/app/list/list_view.dart';
import 'package:smart_app/services/auth_service.dart';
import 'package:smart_app/services/token_service.dart';

class LoginFunctions {
  static void navigateToListPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ListPage()),
    );
  }

  static Future<bool> auth(String email, String pass) async {
    final Map<String, dynamic> body = {
      'email': email,
      'password': pass,
    };
    var authService =  AuthService();
    var res = await authService.auth(body);
    print(res);
    if(res['data'] != null) { return true; }
    else { return false; }
  }

  static Future<bool> mfaAuth(String email, String pass, mfa1, String mfa2, String mfa3, String mfa4, String mfa5, String mfa6) async {
    String mfa = mfa1 + mfa2 + mfa3 + mfa4 + mfa5 + mfa6;
    final Map<String, dynamic> body = {
      'email': email,
      'password': pass,
      'mfa': mfa,
    };
    var authService =  AuthService();
    var res = await authService.mfaAuth(body);
    if(res['data'] != null){
      var token = res["data"]["token"];
      await TokenService.setToken(token);
      return true;
    }else{ return false; }
  }
}