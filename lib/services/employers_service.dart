import 'dart:convert';
import 'package:smart_app/services/token_service.dart';

import 'package:http/http.dart' as http;

class EmployersService{
  final client = http.Client();
 String API_URL = 'https://labs-api-gtw.smartgd.io/api/v1/hub/employer-identification/cnpja/document/';
  Future getEmployer(String document) async {
    document = document.replaceAll("/","").replaceAll("-","").replaceAll(".","").replaceAll(" ","");
    String? token = await TokenService.getToken();
    final res = await client.get(Uri.parse(API_URL+document), headers: {
      'Authorization': 'Bearer $token',
    });
    print(res.statusCode);
    if(res.statusCode == 200 || res.statusCode == 400 || res.statusCode == 401){
      return jsonDecode(res.body);
    }
  }
}