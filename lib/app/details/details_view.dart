import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_app/app/details/details_functions.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class DetailsPage extends StatefulWidget{
  const DetailsPage({super.key});
  
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>{
  final  _form = GlobalKey<FormState>();
  final MaskedTextController documentController = MaskedTextController( mask: "00.000.000/0000-00" );
  final corporateNameController = TextEditingController();
  final tradeNameController = TextEditingController();
  final emailController = TextEditingController();
  final storeController = TextEditingController();
  String? selectedSegment;

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
        scrolledUnderElevation : 0,
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

                // CNPJ
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
                CupertinoTextField(
                  keyboardType: TextInputType.number,
                  controller: documentController, 
                  padding: const EdgeInsets.all(10),
                  placeholder: "00.000.000/0000-00",
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

                // Razão Social
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
                CupertinoTextField(
                  padding: const EdgeInsets.all(10),
                  controller: corporateNameController,
                  placeholder: "DIGITE AQUI...",
                  placeholderStyle: const TextStyle(color:Colors.black38, fontSize:14),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                ),
                const SizedBox(height:8),

                // Nome Fantasia
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
                CupertinoTextField(
                  padding: const EdgeInsets.all(10),
                  controller: tradeNameController,
                  placeholder: "DIGITE AQUI...",
                  placeholderStyle: const TextStyle(color:Colors.black38, fontSize:14),
                  inputFormatters: [ LengthLimitingTextInputFormatter(50) ],
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                ),
                const SizedBox(height:8),
                
                // Email
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
                  inputFormatters: [ LengthLimitingTextInputFormatter(100) ],
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                ),
                const SizedBox(height:8),

                // Segmento
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Segmento',
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
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    value: selectedSegment,
                    hint: const Text("Segmento"),
                    items: DetailsFunctions.segments(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedSegment = newValue;
                      });
                    },
                  ),
                ),
                
                // Loja
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Loja',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                CupertinoTextField(
                  padding: const EdgeInsets.all(10),
                  controller: storeController,
                  keyboardType: TextInputType.number,
                  placeholder: "00",
                  placeholderStyle: const TextStyle(color:Colors.black38, fontSize:14),
                  inputFormatters: [ LengthLimitingTextInputFormatter(2) ],
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                ),
                const SizedBox(height:8),
                
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
                      print(documentController.value);
                      print(tradeNameController.text);
                      print(corporateNameController.text);
                      print(emailController.text);
                      print(selectedSegment);
                      print(storeController.text);
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