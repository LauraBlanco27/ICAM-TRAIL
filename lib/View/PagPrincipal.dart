import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'Desafios.dart';
import 'Proyectos.dart';
import 'Senderos.dart';
import 'Servicios.dart';

class PagPrincipal extends StatefulWidget {
  @override
  _PagPrincipalState createState() => _PagPrincipalState();
}

class _PagPrincipalState extends State<PagPrincipal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
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
                icon: Icon(Icons.menu),
                onPressed: () {
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => Proyectos()),
                        );
                      },
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                            color: Color.fromRGBO(7, 41, 49, 0.5)
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                  'ima/proyectos.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Proyectos Educativos',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => Senderos()),
                        );
                      },
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                            color: Color.fromRGBO(7, 41, 49, 0.5)
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                  'ima/ruta.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Senderos Ecológicos',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => Servicios()),
                        );
                      },
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(7, 41, 49, 0.5),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                  'ima/servicio.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Servicios',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => Desafios()),
                        );
                      },
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                            color: Color.fromRGBO(7, 41, 49, 0.5)
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                  'ima/objetivo.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Desafíos',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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

class MyCircularButton extends StatelessWidget {
  final String text;
  final String imageAsset;

  MyCircularButton({required this.text, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(imageAsset),
        ),
        SizedBox(height: 8),
        Text(text),
      ],
    );
  }
}

class MyBottomButton extends StatelessWidget {
  final String text;
  final String imageAsset;

  MyBottomButton({required this.text, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageAsset,
          height: 24,
          width: 24,
        ),
        SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}