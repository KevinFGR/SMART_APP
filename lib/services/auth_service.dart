import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService{
final  client = http.Client();
 String API_URL = 'https://labs-api-gtw.smartgd.io/api/v1/server/auth';
  Future post(Map<String, dynamic> data) async {
    var requestBody = jsonEncode(data);
    final res =  await client.post(Uri.parse(API_URL), body:requestBody, headers: {
      'Content-Type': 'application/json', 
    });
    return jsonDecode(res.body);
  }
}