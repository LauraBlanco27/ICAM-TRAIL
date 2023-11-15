import 'package:flutter/material.dart';

class AcercaDe extends StatelessWidget {
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
          'Acerca de ICAM TRAIL',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Innovación Educativa en la Naturaleza\n\n'
          'La Aplicación de Senderos Ecológicos con Realidad Aumentada del Colegio ICAM es una herramienta educativa pionera diseñada para enriquecer la experiencia de aprendizaje de nuestros estudiantes en el ámbito de la ecología y la conservación ambiental. A través de la integración de tecnología de realidad aumentada, la aplicación transforma la forma en que los estudiantes interactúan y aprenden sobre el medio ambiente y los ecosistemas locales.\n\n'
          'Características Destacadas:\n\n'
          'Realidad Aumentada: Utilizamos la última tecnología de realidad aumentada para superponer información digital interactiva sobre el mundo físico, permitiendo a los estudiantes descubrir y aprender de manera inmersiva.\n'
          'Senderos Interactivos: Los senderos ecológicos del colegio están mapeados en la aplicación, brindando una experiencia de aprendizaje guiada y enriquecida con datos sobre la flora y fauna locales, así como información sobre prácticas sostenibles.\n'
          'Juegos y Actividades: La aplicación incluye una variedad de juegos educativos y actividades interactivas diseñadas para fomentar la exploración y el aprendizaje activo sobre temas ecológicos y ambientales.\n'
          'Diseñada para Educadores y Estudiantes: Mientras que los estudiantes se embarcan en una aventura de aprendizaje, los educadores tienen herramientas para guiar y complementar la experiencia educativa en el campo.\n'
          'Compromiso con la Educación y el Medio Ambiente:'
          'En el Colegio ICAM, estamos comprometidos con la educación integral y la conciencia ambiental. Esta aplicación es un reflejo de nuestro compromiso de integrar la tecnología en la educación, promoviendo al mismo tiempo el respeto y la conservación de nuestro entorno natural.\n\n'
          '¡Descubre, Aprende y Explora!\n\n'
          'Invitamos a nuestros estudiantes y educadores a descargar la aplicación y comenzar una emocionante jornada de descubrimiento y aprendizaje. ¡Explora los senderos ecológicos del Colegio ICAM como nunca antes!',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}