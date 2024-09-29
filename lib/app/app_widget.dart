import 'package:flutter/material.dart';
import 'package:smart_app/app/login/login_view.dart';

class AppWidget extends StatelessWidget{
  final String title;

  const AppWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue[800]!),
        useMaterial3: true,
      ),
      home: const LoginPage()
    );
  }
}