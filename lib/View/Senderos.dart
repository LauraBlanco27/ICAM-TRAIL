import 'package:flutter/material.dart';
import 'InfoSendero2.dart';
import 'InfoSendero1.dart';
import 'PagPrincipal.dart';
import 'Perfil.dart';

class Senderos extends StatefulWidget {
  const Senderos({super.key});

  @override
  SenderosState createState() => SenderosState();
}

class SenderosState extends State<Senderos> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              // Fondo de pantalla
              Positioned.fill(
                child: Image.asset(
                  'ima/fondoP.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const MyScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double buttonWidth = constraints.maxWidth * 0.8;
        double buttonHeight = constraints.maxHeight * 0.2;

        return Column(
          children: [
            Container(
              color: const Color(0xffd9d9d9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const PagPrincipal()),
                      );
                    },
                  ),
                  const Text(
                    'Senderos Ecológicos',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 30), // Asume que el botón tiene aproximadamente 48 píxeles de ancho
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => Sendero1()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(7, 41, 49, 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: buttonHeight * 0.4, horizontal: buttonWidth * 0.2),
                      ),
                      child: const Text(
                        'Recorrido Completo',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.05),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => Sendero2()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(7, 41, 49, 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: buttonHeight * 0.4, horizontal: buttonWidth * 0.2),
                      ),
                      child: const Text(
                        '   Recorrido Corto   ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: const Color(0xff072931),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home, color: Color(0xffd9d9d9)),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const PagPrincipal()),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.person, color: Color(0xffd9d9d9)),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const Perfil()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}