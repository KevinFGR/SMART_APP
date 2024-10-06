import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_app/app/components/spinner.dart';
import 'package:smart_app/app/components/toaster.dart';
import 'package:smart_app/app/details/details_functions.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class DetailsPage extends StatefulWidget{
  const DetailsPage({super.key});
  
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>{
  bool loading = false;
  final  _form = GlobalKey<FormState>();
  final MaskedTextController documentController = MaskedTextController( mask: "00.000.000/0000-00" );
  final corporateNameController = TextEditingController();
  final tradeNameController = TextEditingController();
  final emailController = TextEditingController();
  final stateRegistrationController = TextEditingController();
  final storeController = TextEditingController();
  String? selectedSegment;

  @override
  void initState() {
    super.initState();
    storeController.text ="01";
    documentController.addListener(_checkLength);
  }

  @override
  void dispose() {
    documentController.dispose();
    super.dispose();
  }

  Future _checkLength() async {
    if(documentController.text.length > 17) {
      setState(() { loading = true; });
      List<String> res = await DetailsFunctions.getEmployer(documentController.text);
      if(res.length > 1){
        corporateNameController.text = res[0];
        tradeNameController.text = res[1];
        emailController.text = res[2];
        stateRegistrationController.text = res[3];
      }else{ Toaster.show(res[0], "warning"); }
      setState(() { loading = false; });
    }
  }

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [ 
          Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            automaticallyImplyLeading :false,
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
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(27),
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
                        hint: const Text("SELECIONE..."),
                        items: DetailsFunctions.segments(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedSegment = newValue;
                          });
                        },
                      ),
                    ),
                    
                    // Inscrição Estadual
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Inscrição Estadual',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    CupertinoTextField(
                      padding: const EdgeInsets.all(10),
                      controller: stateRegistrationController,
                      keyboardType: TextInputType.number,
                      placeholder: "DIGITE AQUI...",
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
                    Row(
                      children: [
                        Expanded(
                          // width: double.tryParse(source),
                          child: CupertinoButton(
                            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), 
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                            color: Colors.blue[50],
                            child: const Text(
                              "Cancelar",
                              style:TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w600)
                              ),
                            onPressed: () { DetailsFunctions.navigateToListPage(context); },
                          ),
                        ),

                        const SizedBox(width: 20),
                  
                        Expanded(
                          // width: double.infinity,
                          child: CupertinoButton(
                            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), 
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                            color: Colors.lightBlue[800],
                            child: const Text(
                              "Salvar",
                              style:TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)
                              ),
                            onPressed: () async {
                              setState(() { loading = true; });
                              String? res = await DetailsFunctions.insert(
                                documentController.text,
                                tradeNameController.text,
                                corporateNameController.text,
                                emailController.text,
                                selectedSegment ?? "",
                                storeController.text
                               );
                               if(res != null){ Toaster.show(res, "warning"); }
                               // ignore: use_build_context_synchronously
                               else{ 
                                DetailsFunctions.navigateToListPage(context);
                                Toaster.show("Cliente criado com sucesso.", "success"); 
                                }
                              setState(() { loading = false; });
                            },
                          ),
                    ),
                      
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if(loading) ...{Spinner.show()}
      ]
      )
    );
  }
}