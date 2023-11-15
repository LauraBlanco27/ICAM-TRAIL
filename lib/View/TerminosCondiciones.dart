import 'package:flutter/material.dart';

class TerminosCondiciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd9d9d9),
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context); // Usa pop en lugar de pushReplacement para volver atrás
          },
        ),
        title: Text( // Coloca el texto del título aquí
          'Terminos y Condiciones ICAM TRAIL',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Términos y Condiciones de Uso para la Aplicación ICAM TRAIL '
              ' del Colegio ICAM\n\n'
              'Bienvenidos a la aplicación ICAM TRAIL\n\n'
              'Estos términos y condiciones rigen el uso de nuestra Aplicación y su contenido. '
              'Al utilizar la Aplicación, usted acepta estos términos en su totalidad.\n\n'
              'Todo el contenido de la Aplicación, incluyendo textos, gráficos, imágenes, software, código fuente, y la tecnología de realidad aumentada, es propiedad del Colegio ICAM o de sus licenciantes y está protegido por las leyes de derechos de autor y propiedad intelectual.'
              '\n\nLa Aplicación está diseñada para proporcionar una experiencia educativa interactiva mediante el uso de senderos ecológicos con realidad aumentada. Está dirigida principalmente a estudiantes y personal educativo del Colegio ICAM.'
              '\n\nNo se permite el uso de la Aplicación para fines comerciales o ilegales.'
              'Está prohibido modificar, distribuir, copiar o crear obras derivadas del contenido de la Aplicación sin el permiso explícito del Colegio ICAM.'
              'El uso de la Aplicación no debe interferir con su rendimiento, corromper la experiencia de otros usuarios o intentar acceder de manera no autorizada a los sistemas y redes del Colegio.'
              '\n\nICAM TRAIL no se hace responsable de los daños directos o indirectos que puedan surgir del uso de la Aplicación, incluyendo, pero no limitado a, daños a dispositivos móviles o perjuicios personales durante la utilización de la realidad aumentada.'
              '\n\nICAM TRAIL se reserva el derecho de modificar estos términos y condiciones en cualquier momento. Los cambios entrarán en vigor inmediatamente después de su publicación en la Aplicación.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}