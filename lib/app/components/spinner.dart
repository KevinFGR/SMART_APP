import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinner {
  static Widget show() {
    return Positioned.fill(
      child: Container(
        color: const Color.fromARGB(190, 0, 57, 103),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              const SpinKitRing(
                color: Colors.white,
                size: 50.0,
              ),
              const SizedBox(height: 15),
              FractionallySizedBox(
                widthFactor: 0.2, 
                child: Image.asset(
                  'assets/logo_white_sm.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 15),
              const Text("Aguarde, carregando ...",
                style: TextStyle(
                  color:Colors.white,
                  fontSize:15,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none
                ),
              )
            ],
          )
        ),
      ),
    );
  }
  static Widget login(){
    return const Center(
      child: Column(
        children: [
          SpinKitRipple(
            color: Colors.white, 
            size: 50.0,
          ),
          Text("Carregando, Aguarde ...",
            style: TextStyle(
              color:Colors.white,
              fontSize:15,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none
            ),
          )
        ]
      )
    );
  }
}