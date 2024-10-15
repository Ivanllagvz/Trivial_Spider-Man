import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trivial_spiderman/main.dart';

class CargaScreen extends StatelessWidget {
  const CargaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Temporizador para navegar a la pantalla principal después de 5 segundos
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SplashScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/imagenes/swing.gif',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
