import 'package:flutter/material.dart';
import 'package:smart_app/list/list_view.dart';

class LoginFunctions {
  static void navigateToListPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListPage()),
    );
  }
}