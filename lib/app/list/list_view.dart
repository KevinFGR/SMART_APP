import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_app/app/list/list_functions.dart';
import 'package:smart_app/services/auth_service.dart';

class ListPage extends StatelessWidget{
  const ListPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: FractionallySizedBox(
          widthFactor: 0.4, 
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                color: Colors.lightBlue[800],
                child: const Text(
                  "Adicionar",
                  style:TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w600)
                  ),
                onPressed: () {
                  ListFunctions.navigateToDetailsPage(context);
                },
                ),
            ),
            const SizedBox(height:30),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                color: Colors.lightBlue[800],
                child: const Text(
                  "Logout",
                  style:TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w600)
                  ),
                onPressed: () {
                  AuthService.logout(context);
                },
                ),
            ),
          ],
        ),
      ),
    );
  }
}