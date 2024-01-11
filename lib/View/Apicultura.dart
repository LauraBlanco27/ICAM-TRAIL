import 'package:flutter/material.dart';
import 'PagPrincipal.dart';
import 'Perfil.dart';
import 'Proyectos.dart';

class Apicultura extends StatefulWidget {
  const Apicultura({super.key});

  @override
  _ApiculturaState createState() =>
      _ApiculturaState();
}

class _ApiculturaState extends State<Apicultura> {
  bool _mostrarInformacion = false;

  Widget _buildItem(IconData icon, String text, {required color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.green[900]),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 18, color: Color(0xffFFFFFF)),
            ),
          ),
        ],
      ),
    );
  }

  // Método para construir elementos de mensajes.
  Widget _buildMessageItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xffd9d9d9)),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  // Método para construir un punto de bala con texto.
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 18, color: Colors.black)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  // Método para construir un icono con texto.
  Widget _buildBulletPoints(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.white),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Método para construir un punto interactivo con título, descripción e icono.
  Widget _buildInteractivePoint(
      String title, String description, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.green, size: 30),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: const Color(0xffd9d9d9),
          toolbarHeight: screenHeight * 0.05,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(color: Colors.black, Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Proyectos()),
              );
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'ima/Udec.png',
                          fit: BoxFit.contain,
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'ima/LogoICAMTrail.png',
                          fit: BoxFit.contain,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'ima/ApiONU.png',
                          fit: BoxFit.contain,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'ima/ApiMEBA.png',
                          fit: BoxFit.contain,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'ima/Api3.png',
                          fit: BoxFit.contain,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 35),
                  child: Text(
                    'APICULTURA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff34571A),

                    ),
                  ),
                ),
                Image.asset('ima/Api60.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _mostrarInformacion = !_mostrarInformacion;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff4C7031),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    ),
                    child:
                    const Text('Comienza ahora', style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ),
                Visibility(
                  visible: _mostrarInformacion,
                  child: Column(
                    children: [
                      const Icon(Icons.arrow_downward, size: 30, color: Color(0xff4C7031)),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xff889F78),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                'assets/Gif/ObjGif4.gif',
                                width: 120,
                                height: 120,
                              ),
                            ),
                            const Text(
                              'Objetivos de Aprendizaje',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.eco_outlined,
                                          size: 20, color: Colors.orange),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          'Armado y partes de una colmena',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xffFFFFFF)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.eco_outlined,
                                          size: 20, color: Colors.orange),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          'Los materiales y equipos necesarios para criar abejas',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xffFFFFFF)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset(
                                'ima/ApiMat.png',
                                width: 120,
                                height: 120,
                              ),
                            ),
                            const Text(
                              'Materiales',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildItem(
                                      Icons.bug_report,
                                      color: Colors.brown[600],
                                      'Colmenas de madera con abejas, una de ellas desarmada'),
                                  _buildItem(
                                      Icons.security,
                                      color: Colors.brown[200],
                                      'Equipo de protección e instrumentos'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: const Color(0xff8AA883),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade700,
                                    width: 2.0,
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Image.asset('assets/Gif/leer.gif'),
                                  ),
                                  const SizedBox(width: 0),
                                  const Flexible(
                                    child: Text(
                                      '1. Introducción a la medida (10 min)',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        fontFamily: 'Arial',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xffDDBC74),
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.green.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 30),
                                  const Text(
                                    'Ronda participativa de intercambio de conocimiento',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff347571),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Image.asset(
                                    'assets/Gif/Pregunta6.gif',
                                    width: 120,
                                    height: 120,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '¿Qué sabe el grupo acerca de la apicultura y sus beneficios?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xff8AA883),
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.8),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    'Mensajes clave a transmitir',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'La apicultura permite:',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  _buildMessageItem(
                                      Icons.trending_up,
                                      'Polinizar cultivos y flora silvestre',
                                      '(aumentar productividad).'),
                                  _buildMessageItem(
                                      Icons.add_business_outlined,
                                      'Diversificar ingresos con producción de miel,',
                                      'cera, propóleo, polen y jalea '),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xffDDBC74),
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.green.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30.0),
                                    child: Image.asset(
                                      'ima/ApiCaja.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const Text(
                                    'La producción apícola se hace en colmenas. Las colmenas deben situarse en lugares abiertos, cerca de agua y zonas de cultivo o con flora silveste.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black87,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xff4C7031),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(10.0),
                                      child: const Center(
                                        child: Text(
                                          '2. Capacitación',
                                          style: TextStyle(
                                              color: Color(0xffFFFFFF),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 0.5),
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 10.0),
                                  ),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width,
                            ),
                            const SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade700,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color(0xffF6F6E9),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                            Colors.green.withOpacity(0.3),
                                            spreadRadius: 3,
                                            blurRadius: 5,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.grey.shade700,
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                            'ima/Panal.png',
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 0),
                                  const Expanded(
                                    child: Center(
                                      child: Text(
                                        'a) La colmena (20 min)',
                                        style: TextStyle(
                                          color: Color(0xff5B4F47),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          fontStyle: FontStyle.italic,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xffDDBC74),
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.green.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Column(
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    'Actividad práctica\n',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff347571),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Arma una colmena explicando sus componentes y la función de cada uno.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xff8AA883),
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.8),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildBulletPoint(
                                      'Soporte o catre: eleva del piso las colmenas, evita acumulación de humedad.'),
                                  _buildBulletPoint(
                                      'Tabla de vuelo: base que provee una plataforma para el ingreso o salida de las abejas a la colmena.'),
                                  _buildBulletPoint(
                                      'Cámara de cría o cuerpo: es una cámara que contiene cadres móviles o cuadros en donde las abejas construyen panales para criar más abejas.'),
                                  _buildBulletPoint(
                                      'Cadres: marcos en donde las abejas construyen sus panales para crías o miel.'),
                                  _buildBulletPoint(
                                      'Rejilla excluidora: evita el paso de la abeja reina a la cámara de cría cuando se cultiva jalea real o se reproducen reinas.'),
                                  _buildBulletPoint(
                                      'Cámaras o alzas melarias: cajones de la colmena que contienen cadres para producir miel. Son entre 1y3 cajones por colmena.'),
                                  _buildBulletPoint(
                                      'Entretapa: controla la ventilación y temperatura de la colmena, normalmente tienen un cierre corredizo para regular estos dos factores.'),
                                  _buildBulletPoint(
                                      'Techo: cubre la colmena, impide que el agua de luvia entre a los cajones; es removible.'),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xffDDBC74),
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.green.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30.0),
                                    child: Image.asset(
                                      'ima/ApiCol.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const Text(
                                    'La colmena es desarmable; por ejemplo, se quita la tapa y entretapa rociando humo a la colmena para llegar a la alza melaria y cultivar la miel.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black87,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade700,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color(0xffF6F6E9),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                            Colors.green.withOpacity(0.3),
                                            spreadRadius: 3,
                                            blurRadius: 5,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.grey.shade700,
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                            'ima/Panal.png',
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 0),
                                  const Expanded(
                                    child: Center(
                                      child: Text(
                                        'b) El equipo (20 min)',
                                        style: TextStyle(
                                          color: Color(0xff5B4F47),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          fontStyle: FontStyle.italic,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xffDDBC74),
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.green.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Actividad práctica',
                                      style: TextStyle(
                                        color: Color(0xff347571),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  const Text(
                                    'Viste a un voluntario con el equipo protector.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 10),
                                  Center(
                                    child: Image.asset(
                                      'assets/Gif/8.gif',
                                      width: 120,
                                      height: 120,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  _buildBulletPoints(
                                      'Muestra y explica el equipo: traje (pantalón blanco blusa blanca), y botas, sombrero con red protectora, guantes.',
                                      Icons.exit_to_app_rounded),
                                  _buildBulletPoints(
                                      'Presenta el ahumador, explica su uso y ponlo a funcionar.',
                                      Icons.exit_to_app_rounded),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xff8AA883),
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.8),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30.0),
                                    child: Image.asset(
                                      'ima/ahu.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const Text(
                                    'El ahumador es esencial para trabajar con las abejas. el humo las adormece y ahuyenta mientras el productor trabaja en la colmena.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black87,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                            ),
                            const SizedBox(height: 25),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade700,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color(0xffF6F6E9),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                            Colors.green.withOpacity(0.3),
                                            spreadRadius: 3,
                                            blurRadius: 5,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.grey.shade700,
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset('ima/teacher.png',
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 0),
                                  const Expanded(
                                    child: Center(
                                      child: Text(
                                        'c) Explicación de la medida (10 min)',
                                        style: TextStyle(
                                          color: Color(0xff5B4F47),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          fontStyle: FontStyle.italic,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xffDDBC74),
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.green.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    'Actividad didáctica',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff433831),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Muestra en qué parte del sistema se sitúa cada uno de los puntos críticos para que funcione correctamente.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff433831),
                                      fontSize: 18,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  _buildInteractivePoint(
                                    'PUNTO CRÍTICO 1',
                                    'La cobertura del terreno evita que las lluvias o vientos erisionen el suelo y se pierdan sus nutrientes. La materia orgánica actúa como una esponja que retiene la humedad en el suelo por más tiempo.',
                                    Icons.filter_1,
                                  ),
                                  _buildInteractivePoint(
                                    'PUNTO CRÍTICO 2',
                                    'Al aplicar la siembra directa, sin voltear el suelo, se evita exponer el suelo al arire. Esto hace que se mantenga la riqueza biológica y química que ayuda al desarrollo de los cultivos. Se evita la erosión, se conservan los nutrientes y se mantiene la vida del suelo.',
                                    Icons.filter_2,
                                  ),
                                  _buildInteractivePoint(
                                    'PUNTO CRÍTICO 3',
                                    'La rotación de cultivos rompe el ciclo de plagas y malezas. Cuando se rota con abonos verdes o leguminosas se obtiene el beneficio adicional de fijar nitógeno al suelo que después estará disponible para el cultivo. El efecto en el largo plazo de la combinación de estos tres puntos es un suelo más fértil y rico en materia orgánica.',
                                    Icons.filter_3,
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Column(
                              children: [
                                Card(
                                  color: const Color(0xff8AA883),
                                  elevation: 5,
                                  margin: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: 200,
                                        height: 170,
                                        child: Image.asset(
                                            'ima/Invernadero14.png',
                                            fit: BoxFit.cover),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          'Los residuos de cosecha son un excelente arrope. Es importante dejarlos en el suelo y nunca quemarlos.',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  color: const Color(0xffE4DDDD),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 70,
                                            height: 70,
                                            child: Image.asset(
                                                'ima/Tip.png'),
                                          ),
                                          const SizedBox(width: 5),
                                          const Expanded(
                                            child: Padding(
                                              padding:
                                              EdgeInsets.only(right: 10),
                                              child: Text(
                                                'La agricultura de conservación no necesita de gastos adicionales. Al contrario, con menos trabajo y menos insumos químicos se pueden obtener mejores rendimientos. Pero necesita un cambio de mentalidad al pensar en el sistema productivo de forma integral. Los resultados de este sistema se empiezan a notar después de unas cuantas campañas.',
                                                style: TextStyle(fontSize: 12),
                                                textAlign: TextAlign.justify,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(  // Usamos `bottomNavigationBar` para la barra inferior
          height: screenHeight * 0.05,
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
      ),
    );
  }
}