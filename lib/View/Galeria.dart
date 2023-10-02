import 'package:flutter/material.dart';

class Galeria1 extends StatefulWidget {
  @override
  _Galeria1State createState() => _Galeria1State();
}

class _Galeria1State extends State<Galeria1> {
  // Lista ficticia de rutas de imágenes
  List<String> imagenes = [
    'ima/recorrido.jpg',
    'ima/recorrio2.jpeg',
    'ima/img.png',
    'ima/fondoP.jpg',
    'ima/recorrido.jpg',
    'ima/recorrio2.jpeg',
    'ima/img.png',
    'ima/fondoP.jpg',
    'ima/recorrido.jpg',
    'ima/recorrio2.jpeg',
    'ima/img.png',
    'ima/fondoP.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd9d9d9),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Galería recorrido 1',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: imagenes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(imagenes[index], fit: BoxFit.cover);
        },
      ),
    );
  }
}