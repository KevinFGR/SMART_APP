import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinner {
  static Widget showSpinner(Color? color) {
    return Center(
      child: SpinKitRipple(
        color: color, 
        size: 50.0,
      ),
    );
  }
  
}