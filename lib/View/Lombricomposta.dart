import 'package:flutter/material.dart';

import 'Proyectos.dart';

void main() => runApp(Lombricomposta());

class Lombricomposta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InfoScreen(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: Container(
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
                    MaterialPageRoute(builder: (_) => Proyectos()),
                  );
                },
              ),
              Spacer(),
              Text(
                'Lombricomposta',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            sectionTitle('Introducción'),
            contentCard(
              imageUrl: 'ima/Lombricomposta.png',
              description: 'Participa en esta ronda de intercambio de conocimientos. ¿Conoces los increíbles beneficios de la lombricomposta? Gracias al humus de lombricomposta, podemos mejorar la calidad del suelo, potenciar la productividad y diversificar los ingresos.',
              title: '',
            ),
            sectionTitle('Capacitación'),
            contentCard(
              title: 'Actividad práctica',
              description: 'Junto con los participantes, vamos a iniciar la mezcla para producir lombricomposta. Con ingredientes ricos en nitrógeno y carbono, y usando lombricomposta madura, observaremos cómo las lombrices convierten desechos orgánicos en valioso humus.',
              imageUrl: 'ima/Cap1.png',
            ),
            contentCard(
              title: 'Actividad didáctica',
              description: 'Descubre los puntos críticos esenciales para el correcto funcionamiento del sistema:\n\n'
              'PUNTO CRÍTICO 1: La capacidad de la lombricompostera'
              'depende de la cantidad de materia orgánica generada por'
              'la finca o la unidad familiar.\n\n'
              'PUNTO CRÍTICO 2: El proceso inicia con una pila de mezcla'
              'en un extremo de las dos camas de producion. Conforme'
              'se incorpora materia orgánica, la pila se va extendiendo a'
              'lo largo de la cama. De esta forma la lombricomposta que'
              'va madurando queda en el extremo inicial y la lombriz se'
              'desplaza al área con mezcla fresca. La composta madura se'
              'colecta después de unos 21 días.\n\n'
              'PUNTO CRÍTICO 3: Al humedecer la mezcla se generan'
              'lixiviados (liquidos que percolan a través de la mezcla). La'
              'fosa debe tener una cámara para colectar estos lixiviados,'
              'los Cuales pueden diluirse en agua y usarse como'
              'fertilizante orgánico foliar',
              imageUrl: 'ima/Cap3.png',
            ),
            contentCard(
              title: 'Actividad práctica',
              description: '¡Manos a la obra! Junto con los participantes, vamos a preparar una potente mezcla de supermagro. Mezcla 50 kg de excretas de vaca y 4 kg de ceniza en 100 litros de agua. Luego, añade 2 litros de suero y 2 litros de melaza. Cierra bien el contenedor y en tan solo 20 a 30 días, ¡tu fermentación estará lista para usar!',
              imageUrl: 'ima/Cap2.png',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 40,
        color: Color(0xff072931),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Color(0xffd9d9d9)),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search, color: Color(0xffd9d9d9)),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person, color: Color(0xffd9d9d9)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange,
        ),
      ),
    );
  }

  Widget contentCard({required String title, required String description, required String imageUrl}) {
    return Card(
      elevation: 7,
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imageUrl, fit: BoxFit.cover),
              SizedBox(height: 16.0),
              if (title.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
                ),
              descriptionWidget(description),
            ],
          ),
        ),
      ),
    );
  }

  Widget descriptionWidget(String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(description, style: TextStyle(fontSize: 16, color: Colors.black54)),
    );
  }
}