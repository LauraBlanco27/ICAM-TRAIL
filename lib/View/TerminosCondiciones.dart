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
            Navigator.pop(
                context);
          },
        ),
        title: Text(
          'Terminos y Condiciones ICAMTrail',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Color(0xff072931),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'ima/LogoAppI.png',
                  width: 50,
                  height: 50,
                ),
                Expanded(
                  // Envuelve el texto en un widget Expanded
                  child: Text(
                    'Bienvenidos a la aplicación ICAMTrail',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight
                          .bold, // Mueve fontWeight dentro de TextStyle
                    ),
                    textAlign: TextAlign.center, // Alinea el texto al centro
                  ),
                ),
                Image.asset(
                  'assets/Gif/terminosC.gif',
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            SizedBox(height: 20), // Espacio entre la imagen/GIF y el texto
            Text(
              'Estos términos y condiciones rigen el uso de nuestra Aplicación y su contenido. '
              'Al utilizar la Aplicación, usted acepta estos términos en su totalidad.\n\n'
              'Todo el contenido de la Aplicación, incluyendo textos, gráficos, imágenes, software, código fuente, y la tecnología de realidad aumentada, es propiedad de WhiteTeam en colaboración del Colegio ICAM y la UDEC, además está protegido por las leyes de derechos de autor y propiedad intelectual.'
              '\n\nLa Aplicación está diseñada para proporcionar una experiencia educativa interactiva mediante el uso de senderos ecológicos con realidad aumentada. Está dirigida principalmente a estudiantes y persnal educativo del Colegio ICAM.'
              '\n\nNo se permite el uso de la Aplicación para fines comerciales o ilegales.'
              'Está prohibido modificar, distribuir, copiar o crear obras derivadas del contenido de la Aplicación sin el permiso explícito del Colegio ICAM.'
              'El uso de la Aplicación no debe interferir con su rendimiento, corromper la experiencia de otros usuarios o intentar acceder de manera no autorizada a los sistemas y redes del Colegio.'
              '\n\nICAM TRAIL no se hace responsable de los daños directos o indirectos que puedan surgir del uso de la Aplicación, incluyendo, pero no limitado a, daños a dispositivos móviles o perjuicios personales durante la utilización de la realidad aumentada.'
              '\n\nICAM TRAIL se reserva el derecho de modificar estos términos y condiciones en cualquier momento. Los cambios entrarán en vigor inmediatamente después de su publicación en la Aplicación.',
              style: TextStyle(
                fontSize: 16,
                height: 1.2,
                color: Color(0xffd9d9d9), // Cambia el color del texto a blanco
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
