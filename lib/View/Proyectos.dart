import 'package:flutter/material.dart';
import 'package:proyecto1/View/PagPrincipal.dart';
import 'AgriculturaConservacion.dart';
import 'Apicultura.dart';
import 'HuertoFamiliar.dart';
import 'Invernadero.dart';
import 'Lombricomposta.dart';
import 'Perfil.dart';
import 'ReservorioAgua.dart';
import 'RiegoEficiente.dart';
import 'Silvopastoril.dart';
import 'SistemaSilvoagricola.dart';
import 'TerrazasAgricolas.dart';
import 'ZanjaBordo.dart';

class Proyectos extends StatelessWidget {
  const Proyectos({super.key});

  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> proyectosNombres = [
    'Lombricomposta',
    'Invernadero',
    'Riego Eficiente',
    'Terrazas Agrícolas',
    'Sistema Silvoagricola',
    'Agricultura de Conservación',
    'Apicultura',
    'Huerto Familiar',
    'Silvopastoril',
    'Reservorio de Agua'
  ];

  final List<Widget> paginas = [
    Lombricomposta(),
    Invernadero(),
    RiegoEficiente(),
    TerrazasAgricolas(),
    SistemaSilvoagricola(),
    AgriculturaConservacion(),
    Apicultura(),
    HuertoFamiliar(),
    Silvopastoril(),
    ReservorioAgua(),
  ];

  final List<String> proyectosImagenes = [
    'ima/lombriz.png',
    'ima/IconoInver.png',
    'ima/aspersor.png',
    'ima/terraza.png',
    'ima/otono.png',
    'ima/planta.png',
    'ima/abeja.png',
    'ima/regadera.png',
    'ima/vacas.png',
    'ima/deposito-de-agua.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff224C55),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Container(
                  color: const Color(0xffd9d9d9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const PagPrincipal()),
                          );
                        },
                      ),
                      const Text(
                        'Proyectos Educativos',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 30),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: (constraints.maxWidth < 600) ? 2 : 3,
                      crossAxisSpacing: 30.0,
                      mainAxisSpacing: 30.0,
                      childAspectRatio: 1.6667,
                    ),
                    itemCount: proyectosNombres.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => paginas[index]),
                            );
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Ink(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(7, 41, 49, 0.5),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xffecf8e5),
                                  spreadRadius: 0,
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    proyectosImagenes[index], // Usando la imagen correspondiente
                                    width: 50.0, // Ajusta según tus necesidades
                                    height: 50.0,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    proyectosNombres[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: (constraints.maxWidth < 600) ? 16 : 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                  ),
                ),
                Container(
                  color: const Color(0xff072931),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.home, color: Color(0xffd9d9d9)),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const PagPrincipal()),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.person, color: Color(0xffd9d9d9)),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const Perfil()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
