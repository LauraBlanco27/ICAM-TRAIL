import 'package:flutter/material.dart';
import 'Galeria2.dart';
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
      body: Stack(
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
          Column(
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
                height: 45,
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Montañas de los Andes',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                height: 321,
                color: Color(0xfffCED1D7),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      child: Text(
                        'Sendero recorrido 1',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20), // Esto añade un margen a los lados de la línea
                      height: 2,
                      width: 270,
                      color: Colors.black,
                    ),
                    SizedBox(height: 20),
                    Expanded( // Este widget hace que el SingleChildScrollView se expanda al espacio disponible
                      child: SingleChildScrollView( // Cuadro de texto con scroll
                        child: Padding( // Un padding para darle espacio al texto respecto al contenedor
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Descripción extensa del sendero recorrido. Puedes agregar mucho texto aquí y al llegar al final de la capacidad del contenedor, podrás hacer scroll para seguir leyendo. Esta es una forma muy útil para mostrar información que no cabe en el espacio visual disponible en pantalla.',
                            style: TextStyle(
                              color: Color(0xff8a8a8a), // Color gris
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
                            backgroundImage: 'ima/recorrio2.jpeg',
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
                            backgroundImage: 'ima/recorrio2.jpeg',
                            circleImage: 'ima/camaraa.png',
                            onTapAction: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Galeria2()),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 102,
                      width: 156,
                      decoration: BoxDecoration(
                        color: Color(0xff224C55),
                        border: Border.all(color: Colors.black, width: 5),
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
                                  color: Color(0xffd9d9d9), fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 58,
                      color: Color(0xFF072931),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Iniciar Experiencia',
                                style: TextStyle(
                                    color: Color(0xffd9d9d9), fontSize: 16)),
                            SizedBox(width: 10),
                            Image.asset('ima/flechaCuadrada.png',
                                width: 21, height: 21),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
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
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Color(0xFF224C55)),
            child: Center(
              child: Image.asset(circleImage, width: 30, height: 30),
            ),
          ),
        ),
      ),
    );
  }
}
