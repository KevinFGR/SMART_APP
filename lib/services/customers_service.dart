import 'package:http/http.dart' as http;

class CustomerService{
  final client = http.Client();
 String API_URL = 'https://labs-api-gtw.smartgd.io/api/v1/mdt/customers';
  Future get() async {
    return await client.get(Uri.parse(API_URL));
  }
}