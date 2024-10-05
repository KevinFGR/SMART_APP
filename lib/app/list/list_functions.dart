import 'package:flutter/material.dart';
import 'package:smart_app/app/details/details_view.dart';

class ListFunctions {
  static void navigateToDetailsPage(BuildContext context) async {
    Navigator.push( context,MaterialPageRoute(builder: (context) => const DetailsPage()),);
  }

}