import 'package:flutter/material.dart';

class Galeria2 extends StatefulWidget {
  @override
  Galeria2State createState() => Galeria2State();
}

class Galeria2State extends State<Galeria2> {

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
          'Galería recorrido 2',
          style: TextStyle(color: Colors.black),
          // Cambio del color de la letra a azul
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: imagenes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // número de columnas
          mainAxisSpacing: 10.0, // espacio vertical entre tarjetas
          crossAxisSpacing: 10.0, // espacio horizontal entre tarjetas
        ),
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(imagenes[index], fit: BoxFit.cover);
        },
      ),
    );
  }
}
