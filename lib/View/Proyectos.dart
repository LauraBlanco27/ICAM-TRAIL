import 'package:flutter/material.dart';
import 'package:proyecto1/View/PagPrincipal.dart';

import 'AgriculturaConservacion.dart';
import 'HuertoFamiliar.dart';
import 'Invernadero.dart';
import 'Lombricomposta.dart';
import 'ReservorioAgua.dart';
import 'RiegoEficiente.dart';
import 'Silvopastoril.dart';
import 'SistemaSilvoagricola.dart';
import 'TerrazasAgricolas.dart';
import 'ZanjaBordo.dart';

// Aquí van las demás importaciones ...

class Proyectos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> proyectosNombres = [
    'Lombricomposta',
    'Invernadero',
    'Riego Eficiente',
    'Terrazas Agrícolas',
    'Zanja Bordo',
    'Sistema Silvoagricola',
    'Agricultura de Conservación',
    'Huerto Familiar',
    'Silvopastoril',
    'Reservorio de Agua'
  ];

  final List<Widget> paginas = [
    Lombricomposta(),
    Invernadero(),
    RiegoEficiente(),
    TerrazasAgricolas(),
    ZanjaBordo(),
    SistemaSilvoagricola(),
    AgriculturaConservacion(),
    HuertoFamiliar(),
    Silvopastoril(),
    ReservorioAgua(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Column(
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
                      MaterialPageRoute(builder: (_) => PagPrincipal()),
                    );
                  },
                ),
                Text(
                  'Proyectos Educativos',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 30),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30.0,
                mainAxisSpacing: 30.0,
                childAspectRatio: 1.6667,
              ),
              itemCount: proyectosNombres.length,
              itemBuilder: (BuildContext context, int index) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => paginas[index]),
                    );
                  },
                  child: Text(
                    proyectosNombres[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(7, 41, 49, 0.5), // Color de fondo con transparencia
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Colors.blue[300]!, // Borde azul más claro
                        width: 3.0, // Ajusta el ancho del borde a tu preferencia
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
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
        ],
      ),
    );
  }
}
