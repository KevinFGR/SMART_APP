import 'dart:convert';
import 'package:smart_app/services/auth_service.dart';
import 'package:smart_app/services/token_service.dart';

import 'package:http/http.dart' as http;

class CustomerService{
  final client = http.Client();
 String API_URL = 'https://labs-api-gtw.smartgd.io/api/v1/mdt/customers';
  Future get() async {
    return await client.get(Uri.parse(API_URL));
  }
  Future insert(Map<String, dynamic> data) async {
    String? token = await TokenService.getToken();
    var requestBody = jsonEncode(data);
    final res =  await client.post(Uri.parse(API_URL), body:requestBody, headers: {
      'Content-Type': 'application/json', 
      'Authorization': 'Bearer $token',
    });
    if(res.statusCode == 401){ return null; }
    return jsonDecode(res.body);
  }
}