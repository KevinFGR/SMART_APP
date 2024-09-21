import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_app/details/details_functions.dart';

class DetailsPage extends StatefulWidget{
  const DetailsPage({super.key});
  
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>{
  final  _form = GlobalKey<FormState>();
  final emailController = TextEditingController();
  String? selectedUf;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Center(
          child: FractionallySizedBox(
          widthFactor: 0.4, 
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
          ),
        ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              children: [
                const SizedBox(height: 90),
                const Text(
                  "Cadastrar Cliente",
                  style: TextStyle(
                    color:Colors.black,
                    fontSize:27,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height:30),
                
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: TextStyle(
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
                  placeholderStyle: const TextStyle(color:Colors.black38, fontSize:14),
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                ),
                const SizedBox(height:8),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'CNPJ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const CupertinoTextField(
                  keyboardType: TextInputType.number,
                  padding: EdgeInsets.all(10),
                  placeholder: "00.000.000/0000-00",
                  placeholderStyle: TextStyle(color:Colors.black38, fontSize:14),
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                ),
                const SizedBox(height:8),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Razão Social',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const CupertinoTextField(
                  padding: EdgeInsets.all(10),
                  placeholder: "DIGITE AQUI...",
                  placeholderStyle: TextStyle(color:Colors.black38, fontSize:14),
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                ),
                const SizedBox(height:8),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Nome Fantasia',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const CupertinoTextField(
                  padding: EdgeInsets.all(10),
                  placeholder: "DIGITE AQUI...",
                  placeholderStyle: TextStyle(color:Colors.black38, fontSize:14),
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                ),
                const SizedBox(height:8),
                
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Nome Fantasia',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const CupertinoTextField(
                  padding: EdgeInsets.all(10),
                  placeholder: "DIGITE AQUI...",
                  placeholderStyle: TextStyle(color:Colors.black38, fontSize:14),
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                ),
                const SizedBox(height:8),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Nome Fantasia',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const CupertinoTextField(
                  padding: EdgeInsets.all(10),
                  placeholder: "DIGITE AQUI...",
                  placeholderStyle: TextStyle(color:Colors.black38, fontSize:14),
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                ),
                const SizedBox(height:8),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'CEP',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const CupertinoTextField(
                  keyboardType: TextInputType.number,
                  padding: EdgeInsets.all(10),
                  placeholder: "DIGITE AQUI...",
                  placeholderStyle: TextStyle(color:Colors.black38, fontSize:14),
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                ),
                const SizedBox(height:8),
                
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Endereço',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const CupertinoTextField(
                  padding: EdgeInsets.all(10),
                  placeholder: "DIGITE AQUI...",
                  placeholderStyle: TextStyle(color:Colors.black38, fontSize:14),
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                ),
                const SizedBox(height:8),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Número',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const CupertinoTextField(
                  keyboardType: TextInputType.number,
                  padding: EdgeInsets.all(10),
                  placeholder: "DIGITE AQUI...",
                  placeholderStyle: TextStyle(color:Colors.black38, fontSize:14),
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                ),
                const SizedBox(height:8),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Número',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const CupertinoTextField(
                  keyboardType: TextInputType.number,
                  padding: EdgeInsets.all(10),
                  placeholder: "DIGITE AQUI...",
                  placeholderStyle: TextStyle(color:Colors.black38, fontSize:14),
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                ),
                const SizedBox(height:8),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'UF',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: selectedUf,
                    hint: const Text("UF"),
                    isExpanded: true,
                    items: DetailsFunctions.ufs().map((String uf) {
                      return DropdownMenuItem<String>(
                        value: uf,
                        child: Text(uf),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedUf = newValue;
                      });
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
                      "Salvar",
                      style:TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)
                      ),
                    onPressed: () {
                      print(emailController.text);
                      print(selectedUf);
                    },
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}