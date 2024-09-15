import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_functions.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue[900]!, const Color.fromARGB(255, 0, 16, 28)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FractionallySizedBox(
              widthFactor: 0.7, 
              child: Image.asset(
                'assets/logo_login.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Bem Vindo ao SMART",
              style: TextStyle(
                color:Colors.white,
              ),
            ),
            const SizedBox(height:65),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const CupertinoTextField(
              padding: EdgeInsets.all(10),
              placeholder: "email@email.com",
              placeholderStyle: TextStyle(color:Colors.white70, fontSize:14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
            ),
            const SizedBox(height:8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Senha',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const CupertinoTextField(
              padding: EdgeInsets.all(10),
              placeholder: "********",
              placeholderStyle: TextStyle(color:Colors.white70, fontSize:14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
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
                  "Acessar",
                  style:TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w600)
                  ),
                onPressed: (){ LoginFunctions.navigateToListPage(context); }
              ),
            ),
          ],
        ),
      ),
    );
  }
}