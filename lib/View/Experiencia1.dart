import 'package:flutter/material.dart';
import 'InfoSendero1.dart'; // Asegúrate de que esta es la ruta correcta
import 'progress_panel.dart'; // Asegúrate de que esta es la ruta correcta

class ARSendero1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd9d9d9),
        foregroundColor: Colors.black,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Sendero1()),
                );
              },
            ),
          ],
        ),
        title: Text(
          'Experiencia 1',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.timeline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: ProgressPanel(
                      modelosVistos: 0, // Aquí debes proporcionar los valores reales
                      distanciaRecorrida: 0.0, // Por ejemplo, podrían venir de un estado o una base de datos
                      distanciaTotal: 1.0,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Contenido de ARSendero1'),
      ),
    );
  }
}