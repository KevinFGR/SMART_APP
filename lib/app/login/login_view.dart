import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_functions.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage>{
  bool mfaVerification = false;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  
  final mfa1Controller = TextEditingController();
  final mfa2Controller = TextEditingController();
  final mfa3Controller = TextEditingController();
  final mfa4Controller = TextEditingController();
  final mfa5Controller = TextEditingController();
  final mfa6Controller = TextEditingController();



  _textFiedMfa(bool first, bool last, TextEditingController controller){
    return Container(
      height:85,
      child: AspectRatio(
        aspectRatio: 0.5,
        child: TextField(
          controller: controller,
          obscureText: true,
          autofocus: true,
          onChanged: (value) {
            if(value.length == 1 && last == false){
              FocusScope.of(context).nextFocus();
            }
            if(value.length == 1 && first ==false){
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          maxLength: 1,
          decoration: InputDecoration(
            filled:true,
            fillColor:const Color.fromARGB(255, 0, 33, 58),
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide( width: 2, color:Colors.black12),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide( width: 2, color:Colors.blue),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        )

        ),
    );
  }

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

            if(!mfaVerification) ...[
              // Email
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
              
              CupertinoTextField(
                padding: const EdgeInsets.all(10),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                placeholder: "email@email.com",
                placeholderStyle: const TextStyle(color:Colors.white70, fontSize:14),
                style: const TextStyle(color: Colors.white, fontSize: 14),
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
              ),
              const SizedBox(height:8),

              // Senha
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
              CupertinoTextField(
                obscureText: true,
                padding: const EdgeInsets.all(10),
                controller: passController,
                placeholder: "********",
                placeholderStyle: const TextStyle(color:Colors.white70, fontSize:14),
                style: const TextStyle(color: Colors.white, fontSize: 14),
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
              ),
              const SizedBox(height:30),

              // Acessar
              SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                color: Colors.lightBlue[800],
                child: const Text(
                  "Acessar",
                  style:TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)
                  ),
                // onPressed: (){ LoginFunctions.navigateToListPage(context); }
                onPressed: () async  { 
                  var res =  await LoginFunctions.auth( emailController.text, passController.text );
                  setState(() { mfaVerification = res; });
                }
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Esqueceu a senha?", 
              style: TextStyle(
                color: Colors.white60,
                fontSize: 16,
                fontWeight: FontWeight.bold,)
              )
            ],

            // MFA
            if(mfaVerification) ...[
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Informe o código multifator',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  _textFiedMfa(true, false, mfa1Controller),
                  const SizedBox(width: 16),
                  _textFiedMfa(true, false, mfa2Controller),
                  const SizedBox(width: 16),
                  _textFiedMfa(true, false, mfa3Controller),
                  const SizedBox(width: 16),
                  _textFiedMfa(true, false, mfa4Controller),
                  const SizedBox(width: 16),
                  _textFiedMfa(true, false, mfa5Controller),
                  const SizedBox(width: 16),
                  _textFiedMfa(true, true, mfa6Controller)              
                ],
              ),

              // Acessar
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: Colors.lightBlue[800],
                  child: const Text(
                    "Acessar",
                    style:TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)
                    ),
                  onPressed: ()async { 
                    bool res = await LoginFunctions.mfaAuth( 
                      emailController.text, 
                      passController.text,
                      mfa1Controller.text,
                      mfa2Controller.text,
                      mfa3Controller.text,
                      mfa4Controller.text,
                      mfa5Controller.text,
                      mfa6Controller.text,
                    );
                    if(res){
                      print('res = true');
                      // ignore: use_build_context_synchronously
                      LoginFunctions.navigateToListPage(context);
                      }
                    else{}
                  }
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}