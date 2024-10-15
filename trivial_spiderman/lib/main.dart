import 'package:flutter/material.dart';
import 'Carga.dart';
import 'package:lottie/lottie.dart';
import 'trivial.dart';

void main() {
  runApp(const SpiderManTrivialApp());
}

class SpiderManTrivialApp extends StatelessWidget {
  const SpiderManTrivialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spider-Man Trivial',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home:
          const CargaScreen(), // Cambiamos la pantalla inicial a la pantalla de carga
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo de Manhattan
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/imagenes/manhattan.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Animación de Spider-Man usando Lottie
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/animaciones/spiderman.json', // Animación de Lottie
                  width: 250,
                  height: 250,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 50),
                // Botón para acceder al trivial
                ElevatedButton(
                  onPressed: () {
                    // Navega a la pantalla del Trivial
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const TrivialScreen()), // Aquí usamos TrivialScreen de trivial.dart
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Iniciar Trivial',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
