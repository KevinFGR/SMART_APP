import 'package:flutter/material.dart';
import 'package:smart_app/app/details/details_view.dart';
import 'package:smart_app/app/login/login_view.dart';
import 'package:smart_app/services/token_service.dart';

class ListFunctions {
  static void logout(BuildContext context) async {
    await TokenService.setToken("");
      // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()), );
  }

  static void navigateToDetailsPage(BuildContext context) async {
    Navigator.push( context,MaterialPageRoute(builder: (context) => const DetailsPage()),);
  }

}