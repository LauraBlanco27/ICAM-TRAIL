import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'InfoRecorrido2.dart';
import 'InfoSendero1.dart';
import 'PagPrincipal.dart';

class Senderos extends StatefulWidget {
  @override
  SenderosState createState() => SenderosState();
}

class SenderosState extends State<Senderos> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Fondo de pantalla
            Image.asset(
              'ima/fondoP.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            MyScreen(),
          ],
        ),
      ),
    );
  }
}

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          color: Color(0xffd9d9d9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  // Redireccionar a la pantalla de registro.
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => PagPrincipal()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Acción del botón de búsqueda
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Redireccionar a la pantalla de registro.
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => Sendero1()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(7, 41, 49, 0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 160), // Ajusta el tamaño del botón
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Proyectos Educativos',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Redireccionar a la pantalla de registro.
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => Sendero2()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(7, 41, 49, 0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 160), // Ajusta el tamaño del botón
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Senderos Ecológicos',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 40,
          color: Color(0xff072931),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Color(0xffd9d9d9)),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => PagPrincipal()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.search, color: Color(0xffd9d9d9)),
                onPressed: () {
                },
              ),
              IconButton(
                icon: Icon(Icons.person, color: Color(0xffd9d9d9)),
                onPressed: () {
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}