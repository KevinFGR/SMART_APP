import 'dart:convert';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_app/services/token_service.dart';

import 'package:http/http.dart' as http;

class CustomerService{
  final client = http.Client();
 String API_URL = 'https://labs-api-gtw.smartgd.io/api/v1/mdt/customers';
  Future get() async {
    return await client.get(Uri.parse(API_URL));
  }
  Future insert(Map<String, dynamic> data) async {
    try{
      String? token = await TokenService.getToken();
      var requestBody = jsonEncode(data);
      final res =  await client.post(Uri.parse(API_URL), body:requestBody, headers: {
        'Content-Type': 'application/json', 
        'Authorization': 'Bearer $token',
      });
      return jsonDecode(res.body);
    }catch(ex){
      return {
        'data': null,
        'message': "não foi possível salvar cliente"
      };
    }
  }
}