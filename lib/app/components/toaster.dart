import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toaster {
  static show(String message, String status) {
    Color? bg = Colors.green[600];
    if(status == "warning") bg = Colors.amber; // está mostrando a cor muito mais escura. pq????????
    if(status == "info") bg = Colors.blue[600];
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: bg,
      textColor: Colors.white,
      timeInSecForIosWeb: 2,
      fontSize:18
    );      
  }
  
}