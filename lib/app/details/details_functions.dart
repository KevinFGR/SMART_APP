import 'package:flutter/material.dart';
import 'package:smart_app/app/components/toaster.dart';
import 'package:smart_app/services/customers_service.dart';
import 'package:smart_app/services/employers_service.dart';

class DetailsFunctions {
  static List<String> ufs(){
    List<String> ufs = [
      'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 
      'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 
      'RR', 'SC', 'SP', 'SE', 'TO'
    ];
    return ufs;
  }

  static List<DropdownMenuItem<String>> segments(){
    return  [
      const DropdownMenuItem<String>( value: "technology", child: Text("TECNOLOGIA") ),
      const DropdownMenuItem<String>( value: "construction", child: Text("CONSTRUÇÃO") ),
    ];
  }
  
  static void navigateToListPage(BuildContext context) {
    Navigator.pop(context);
  }

  static Future<bool> insert(String document, String corporateName, String tradeName, String email, String segment, String store) async {
      
    final Map<String, dynamic> body = {
      'company': '01',
      'branch': '01',
      'personType': 'J',
      'document': document.replaceAll("/","").replaceAll("-","").replaceAll(".","").replaceAll(" ",""),
      'corporateName': corporateName,
      'tradeName': tradeName,
      'email': email,
      'attributesObj': {
        'parameters':{
          'segment': segment
        }
      },
      'store': store,
    };
    var customerService =  CustomerService();
    var res = await customerService.insert(body);
    print(res);
    if(res['data'] != null) { return true; }
    else { return false; }
  }

  static Future<List<String>> getEmployer(String document) async {
    try{

    var  employersService =  EmployersService();
    var res =  await employersService.getEmployer(document);
    if(res['data'].containsKey('code')){
      Toaster.show("CNPJ não encontrado.", "warning");
      
      return ["CNPJ não encontrado."];
    }
    else{
      String corporateName = res['data']['name'] ?? "";
      String tradeName =  res['data']['alias'] ?? corporateName;
      String email = res['data']['email'] ?? "";
      String stateRegistration = res['data']['sintegra']['home_state_registration'] ?? "ISENTO";
      Toaster.show("CNPJ encontrado com sucesso", "");
      return [ corporateName, tradeName, email, stateRegistration ];
    }
    } catch(ex){
      print(ex);
      Toaster.show("Erro ao buscar por CNPJ.", "warning");
      return ["Erro ao buscar por CNPJ."]; 
      }
  }
}