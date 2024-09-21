import 'package:flutter/material.dart';
import 'package:smart_app/list/list_view.dart';

class DetailsFunctions {
  static List<String> ufs(){
    List<String> ufs = [
      'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 
      'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 
      'RR', 'SC', 'SP', 'SE', 'TO'
    ];
    return ufs;
  }
  static void navigateToListPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListPage()),
    );
  }

}