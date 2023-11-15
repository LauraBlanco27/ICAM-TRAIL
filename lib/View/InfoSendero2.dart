import 'package:flutter/material.dart';

import 'Experiencia2.dart';
import 'Galeria2.dart';
import 'InfoRuta2.dart';
import 'Senderos.dart';

class Sendero2 extends StatefulWidget {
  @override
  Sendero2State createState() => Sendero2State();
}

class Sendero2State extends State<Sendero2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SenderosScreen(),
    );
  }
}

class SenderosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(color: Color(0xffd9d9d9)),
                    Container(color: Color(0xE6201F1F)),
                  ],
                ),
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                double topContainerHeight = constraints.maxHeight * 0.05;
                double titleContainerHeight = constraints.maxHeight * 0.06;
                double middleContainerHeight = constraints.maxHeight * 0.478;
                return Column(
                  children: [
                    Container(
                      height: topContainerHeight,
                      color: Color(0xffd9d9d9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios_new),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => Senderos()),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: titleContainerHeight,
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'Montañas de los Alpes',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: middleContainerHeight,
                      color: Color(0xfffCED1D7),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Container(
                            child: Text(
                              'Sendero recorrido 2',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            height: 2,
                            width: 270,
                            color: Colors.black,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  '\nDescripción extensa del sendero recorrido. Puedes agregar mucho texto aquí y al llegar al final de la capacidad del contenedor, podrás hacer scroll para seguir leyendo. \n\nEsta es una forma muy útil para mostrar información que no cabe en el espacio visual disponible en pantalla.\n\n'
                                      'Descripción extensa del sendero recorrido. Puedes agregar mucho texto aquí y al llegar al final de la capacidad del contenedor, podrás hacer scroll para seguir leyendo.\n\nEsta es una forma muy útil para mostrar información que no cabe en el espacio visual disponible en pantalla.',
                                  style: TextStyle(
                                    color: Color(0xff8a8a8a),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: _circleContainer(
                                  backgroundImage: 'ima/recorrido.jpg',
                                  circleImage: 'ima/reproducir.png',
                                  onTapAction: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Galeria2()),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: _circleContainer(
                                  backgroundImage: 'ima/recorrido2.jpg',
                                  circleImage: 'ima/camaraa.png',
                                  onTapAction: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Galeria2()),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => InfoRuta2()),
                              );
                            },
                            child: Container(
                              height: 102,
                              width: 156,
                              decoration: BoxDecoration(
                                color: Color(0xff224C55),
                                border:
                                Border.all(color: Colors.black, width: 5),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('ima/destino.png',
                                        width: 38, height: 34),
                                    Text(
                                      'Información de Ruta',
                                      style: TextStyle(
                                          color: Color(0xffd9d9d9),
                                          fontSize: 16),
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
                                MaterialPageRoute(builder: (_) => ARSendero2()),
                              );
                            },
                            child: Container(
                              height: 58,
                              color: Color(0xFF072931),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Iniciar Experiencia',
                                        style: TextStyle(
                                            color: Color(0xffd9d9d9),
                                            fontSize: 16)),
                                    SizedBox(width: 10),
                                    Image.asset('ima/flechaCuadrada.png',
                                        width: 21, height: 21),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleContainer({
    required String backgroundImage,
    required String circleImage,
    required VoidCallback onTapAction,
  }) {
    return GestureDetector(
      onTap: onTapAction,
      child: Container(
        width: 180,
        height: 138,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 40,
            height: 40,
            decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xFF224C55)),
            child: Center(
              child: Image.asset(circleImage, width: 30, height: 30),
            ),
          ),
        ),
      ),
    );
  }
}
