import 'package:flutter/material.dart';
import 'package:proyecto1/View/PagPrincipal.dart';

class Desafios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafíos Sendero Ecológico',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DesafiosScreen(),
    );
  }
}

class Desafio {
  final String titulo;
  final String descripcion;
  final String imagenUrl;
  final int puntos;

  Desafio({required this.titulo, required this.descripcion, required this.imagenUrl, required this.puntos});
}

class DesafiosScreen extends StatefulWidget {
  @override
  _DesafiosScreenState createState() => _DesafiosScreenState();
}

class _DesafiosScreenState extends State<DesafiosScreen> {
  List<Desafio> desafios = [
    Desafio(titulo: "Identificar Plantas", descripcion: "Identifica 5 plantas en el sendero", imagenUrl: "ima/Flora.jpg", puntos: 10),
    // Añade más desafíos aquí...
  ];

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
                    MaterialPageRoute(builder: (_) => PagPrincipal()),
                  );
                },
              ),
              Spacer(),
              Text(
                'Desafios',
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
              // Agrega otros elementos de la AppBar si es necesario
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: desafios.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(desafios[index].imagenUrl),
              title: Text(desafios[index].titulo),
              subtitle: Text(desafios[index].descripcion),
              trailing: ElevatedButton(
                onPressed: () {
                  // Lógica para aceptar el desafío
                },
                child: Text('Aceptar'),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map, color: Color(0xffd9d9d9)),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star, color: Color(0xffd9d9d9)),
            label: 'Desafíos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xffd9d9d9)),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}