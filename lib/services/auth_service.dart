import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_app/app/login/login_view.dart';
import 'package:smart_app/services/token_service.dart';

class AuthService{
final  client = http.Client();
 String API_URL = 'https://labs-api-gtw.smartgd.io/api/v1/server/auth';
  Future auth(Map<String, dynamic> data) async {
    var requestBody = jsonEncode(data);
    final res =  await client.post(Uri.parse(API_URL), body:requestBody, headers: {
      'Content-Type': 'application/json', 
    });
    return jsonDecode(res.body);
  }
  Future mfaAuth(Map<String, dynamic> data) async {
    var requestBody = jsonEncode(data);
    final res =  await client.post(Uri.parse("$API_URL/mfa"), body:requestBody, headers: {
      'Content-Type': 'application/json', 
    });
    return jsonDecode(res.body);
  }

  static void logout(BuildContext context) async {
    await TokenService.setToken("");
      // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()), );
    
  }
}