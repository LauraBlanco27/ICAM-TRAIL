import 'package:flutter/material.dart';
import 'PagPrincipal.dart';
import 'Perfil.dart';
import 'Proyectos.dart';

class Invernadero extends StatefulWidget {
  const Invernadero({super.key});

  @override
  _InvernaderoState createState() => _InvernaderoState();
}

class _InvernaderoState extends State<Invernadero> {
  bool _mostrarInformacion = false;

  // Método para construir un elemento de lista con icono y texto.
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
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  // Método para construir elementos de mensajes.
  Widget _buildMessageItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.yellow),
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
          Icon(icon, size: 20, color: Colors.green),
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
        backgroundColor: const Color(0xffF6F6E9),
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
                          'ima/Invernadero1.png',
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
                          'ima/Invernadero2.png',
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
                          'ima/Invernadero3.png',
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
                    'INVERNADERO',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff272727),
                    ),
                  ),
                ),
                Image.asset('ima/Invernadero4.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _mostrarInformacion = !_mostrarInformacion;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff7D9B76),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 15),
                    ),
                    child: const Text(
                      'Comienza ahora',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _mostrarInformacion,
                  child: Column(
                    children: [
                      const Icon(Icons.arrow_downward,
                          size: 30, color: Color(0xff7D9B76)),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xffF6F6E9),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                'assets/Gif/Gif1.gif',
                                width: 120,
                                height: 120,
                              ),
                            ),
                            const Text(
                              'Objetivos de Aprendizaje',
                              style: TextStyle(
                                  color: Color(0xff272727),
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
                                          size: 20, color: Colors.green),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          'La forma correcta de colocar el plástico de invernadero',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
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
                                          size: 20, color: Colors.green),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          'Los beneficios a la medida',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
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
                                          size: 20, color: Colors.green),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          'El manejo de plagas dentro del invernadero',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
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
                                'ima/Invernadero6.png',
                                width: 120,
                                height: 120,
                              ),
                            ),
                            const Text(
                              'Materiales',
                              style: TextStyle(
                                  color: Color(0xff272727),
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
                                      Icons.roofing,
                                      color: Colors.brown[600],
                                      'Plástico de invernadero'),
                                  _buildItem(
                                      Icons.electrical_services,
                                      color: Colors.brown[200],
                                      'Alambre zigzag'),
                                  _buildItem(
                                      Icons.construction,
                                      color: Colors.brown,
                                      'Perfil sujetador'),
                                  _buildItem(
                                      Icons.layers,
                                      color: Colors.brown,
                                      'Plástico amarillo y azul (1.5 m2 c/u)'),
                                  _buildItem(
                                      Icons.water_drop,
                                      color: Colors.grey[300],
                                      'Melaza'),
                                  _buildItem(
                                      Icons.build_circle,
                                      color: Colors.grey[600],
                                      'Estacas'),
                                  _buildItem(
                                      Icons.brush,
                                      color: Colors.grey,
                                      'Brocha '),
                                  _buildItem(
                                      Icons.hardware,
                                      color: Colors.yellow[50],
                                      'Clavos'),
                                  _buildItem(
                                      Icons.handyman,
                                      color: Colors.brown,
                                      'Martillo'),
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
                                color: const Color(0xffF6F6E9),
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
                                    child: Image.asset('ima/Invernadero7.png'),
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
                                color: const Color(0xffF6F6E9),
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
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Image.asset(
                                    'assets/Gif/Pregunta.gif',
                                    width: 120,
                                    height: 120,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '¿Qué sabe el grupo de los invernaderos y sus beneficios?',
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
                                    'Los invernaderos ayudan a:',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  _buildMessageItem(
                                      Icons.trending_up,
                                      'Aumentar rendimientos al',
                                      'producir en ambientes controlados.'),
                                  _buildMessageItem(
                                      Icons.add_business_outlined,
                                      'Proteger los cultivos de',
                                      'lluvias y vientos fuertes.'),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xffF6F6E9),
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
                                      'ima/Invernadero8.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const Text(
                                    'Para mantener una temperatura óptima para el desarrollo de los cultivos es importante tener buena altura y ventilación en el invernadero.',
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
                                color: const Color(0xff272727),
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
                                            'ima/agricultura.png',
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 0),
                                  const Expanded(
                                    child: Center(
                                      child: Text(
                                        'a) Colocación y amarre de plástico (20 min)',
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
                                color: const Color(0xffF6F6E9),
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
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Con ayuda de los participantes, utiliza perfiles y alambres zigzag para explicar la forma de colocar y amarrar el plástico',
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
                                      'Extender el plástico a lo largo de la estructura del invernadero. Evitar rasgarlo o perforarlo.'),
                                  _buildBulletPoint(
                                      'Mostrar el perfil sujetador que ya debe estar instalado en la estructura.'),
                                  _buildBulletPoint(
                                      'Introducir el plástico en el perfil sujetador seguido del alambre zigzag. El alambre se introduce moviéndolo de arriba abajo.'),
                                  _buildBulletPoint(
                                      'Tensar el plástico evitando que queden burbujas o espacios distendidos.'),
                                  _buildBulletPoint(
                                      'Los excedentes de plástico se cortan con una tijera. '),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xffF6F6E9),
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
                                      'ima/Invernadero10.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const Text(
                                    'El perfil sujetador y el alambre zigzag ayudan a tensar el plástico sin perforarlo. Esto alarga la vida del material y lo mantiene en buen funcionamiento',
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
                                            'ima/agricultura.png',
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 0),
                                  const Expanded(
                                    child: Center(
                                      child: Text(
                                        'b) Explicación de la medida (10 min)',
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
                                color: const Color(0xffF6F6E9),
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
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  const Text(
                                    'Construye trampas contra plagas comunes con ayuda de los participantes',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 10),
                                  Center(
                                    child: Image.asset(
                                      'assets/Gif/2.gif',
                                      width: 120,
                                      height: 120,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  _buildBulletPoints(
                                      'Las trampas azules se usan para atrapar trips y las trampas amarillas para pulgón, mosca blanca de la fruta, mosca minador y palomillas. Las trampas blancas atraen ácaros.',
                                      Icons.bug_report),
                                  _buildBulletPoints(
                                      'Cortar un plástico amarillo y uno azul de aproximadamente 50cm x 40cm.',
                                      Icons.content_cut),
                                  _buildBulletPoints(
                                      'Fijar el plástico con clavos o chinches en dos estacas de forma a que quede bien extendido y clavar las estacas en el suelo.',
                                      Icons.hardware),
                                  _buildBulletPoints(
                                      'Se pueden hacer hoyos o cortes en plástico para evitar que los vientos fuertes los maltraten.',
                                      Icons.flash_on),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xff8AA883),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.8),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: const TextSpan(
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(text: '- '),
                                        TextSpan(
                                            text:
                                                'Impregnar la melaza en el plástico ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text:
                                                'para que quede pegajoso y las plagas queden atrapadas.\n\n'),
                                        TextSpan(text: '- '),
                                        TextSpan(
                                            text:
                                                'Colocar una trampa amarilla y una azul ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text:
                                                'a un metro de la estructura y por fuera en cada lado del invernadero.'),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 130,
                                        height: 130,
                                        child: Image.asset(
                                            'ima/Invernadero12.png'),
                                      ),
                                      const SizedBox(width: 10),
                                      const Expanded(
                                        child: Text(
                                          'Las trampas de colores ayudan a controlar ciertas plagas. Hay que limpiarlas regularmente y volver a aplicar melaza o aceite para que sigan funcionando.',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 50),
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
                                color: const Color(0xffF6F6E9),
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
                                  const SizedBox(height: 15),
                                  _buildInteractivePoint(
                                    'PUNTO CRÍTICO 1',
                                    'El invernadero normalmente se orienta de norte a sur con respecto a su lado más angosto, donde generalmente se sitúa la entrada. Esto para aprovechar al máximo la luz solar. También se deben tomar en cuenta los vientos dominantes para que no dañe la estructura.',
                                    Icons.filter_1,
                                  ),
                                  _buildInteractivePoint(
                                    'PUNTO CRÍTICO 2',
                                    ' El tensado del plástico o la malla antiáfidos se hace con perfil sujetador y alambre zigzag para evitar perforarlo y que se desgarre con el viento o con el paso del tiempo. Las partes bajas del material cobertor se entierran para evitar cualquier paso de aire o plagas.',
                                    Icons.filter_2,
                                  ),
                                  _buildInteractivePoint(
                                    'PUNTO CRÍTICO 3',
                                    ' El manejo eficiente de agua, suelo, nutrientes y plagas es fundamental para una producción sustentable en invernaderos. El uso de abonos orgánicos, riego eficiente y trampas para plagas ayuda a aumentar la productividad.',
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
                                  color: const Color(0xffF6F6E9),
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
                                          'El manejo de agua, suelo, nutrientes y plagas dentro del invernadero es esencial para una producción sustentable.',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  color: const Color(0xffF6F6E9),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 70,
                                            height: 70,
                                            child: Image.asset(
                                                'ima/Invernadero15.png'),
                                          ),
                                          const SizedBox(width: 5),
                                          const Expanded(
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: Text(
                                                'Se recomienda poner con malla antiáfidos para regular la temperatura del invernadero sin que se exponga el cultivo a plagas. Para controlar las plagas en el invernadero, además de las trampas, se pueden usar plantas repelentes y pesticidas naturales a base de ajo, ají y otras hierbas que repelen insectos.',
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
                            )
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
        bottomNavigationBar: Container(
          // Usamos `bottomNavigationBar` para la barra inferior
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
