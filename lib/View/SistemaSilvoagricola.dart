import 'package:flutter/material.dart';
import 'PagPrincipal.dart';
import 'Perfil.dart';
import 'Proyectos.dart';

class SistemaSilvoagricola extends StatefulWidget {
  const SistemaSilvoagricola({super.key});

  @override
  _SistemaSilvoagricolaState createState() => _SistemaSilvoagricolaState();
}

class _SistemaSilvoagricolaState extends State<SistemaSilvoagricola> {
  bool _mostrarInformacion = false;

  // Método para construir un elemento de lista con icono y texto.
  Widget _buildItem(IconData icon, String text, {required color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.white70),
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
      leading: Icon(icon, color: Color(0xffd9d9d9)),
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
          Icon(icon, color: Color(0xffd9d9d9), size: 30),
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
                    'SISTEMA SILVOAGRÍCOLA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1D4355),
                    ),
                  ),
                ),
                Image.asset('ima/Sistema1.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _mostrarInformacion = !_mostrarInformacion;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff365B6D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 15),
                    ),
                    child: const Text('Comienza ahora',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ),
                Visibility(
                  visible: _mostrarInformacion,
                  child: Column(
                    children: [
                      const Icon(Icons.arrow_downward,
                          size: 30, color: Color(0xff365B6D)),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xff41C1BA),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                'assets/Gif/ObjGif3.gif',
                                width: 120,
                                height: 120,
                              ),
                            ),
                            const Text(
                              'Objetivos de Aprendizaje',
                              style: TextStyle(
                                  color: Color(0xff365B6D),
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
                                          size: 20, color: Colors.white),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          'Los beneficios de la medida',
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
                                          size: 20, color: Colors.white),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          'Los estrato y sus funciones',
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
                                          size: 20, color: Colors.white),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          'Las actividades de mantenimiento asociadas a cada estrato',
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
                                'ima/Sistema3.png',
                                width: 120,
                                height: 120,
                              ),
                            ),
                            const Text(
                              'Materiales',
                              style: TextStyle(
                                  color: Color(0xff365B6D),
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
                                  _buildItem(Icons.roofing, color: Colors.brown[600], 'Sistema silvoagrícola instalado'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
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
                                color: Color(0xff41C1BA),
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
                                    child: Image.asset('ima/concepto.png'),
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
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
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
                                  SizedBox(height: 30),
                                  Text(
                                    'Ronda participativa de intercambio de conocimiento',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Image.asset(
                                    'assets/Gif/Pregunta9.gif',
                                    width: 120,
                                    height: 120,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '¿Qué sabe el grupo acerca del silvoagrícola y sus beneficios?',
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
                                color: const Color(0xff41C1BA),
                                borderRadius: BorderRadius.circular(12.0),
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
                                    'El sistema silvoagrícola ayuda a:',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  _buildMessageItem(Icons.trending_up, 'Diversificar','ingresos.'),
                                  _buildMessageItem(Icons.storm, 'Prevenir impactos por lluvia', 'o vientos extremos.'),
                                  _buildMessageItem(Icons.eco, 'Conservar la biodiversidad, reciclar ', 'nutrientes y capturar carbono.'),
                                  _buildMessageItem(Icons.add, 'Generar un mejor microclima', 'para los cultivos.'),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
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
                                      'ima/Sistema5.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const Text(
                                    'Los sistemas silvoagricolas reciclan muy bien los nutrientes. Los árboles generan mejores condiciones para los cultivos y el suelo.',
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
                                color: const Color(0xff365B6D),
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
                                              color: Colors.white,
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
                                  const SizedBox(width: 5),
                                  const Expanded(
                                    child: Center(
                                      child: Text(
                                        'a) Elementos del sistema y funciones (20 min)',
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
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.8),
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
                                    'Actividad práctica',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Muestra a los participantes los elementos del sistema.',
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
                                color: const Color(0xff41C1BA),
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
                                  _buildBulletPoint('Arboles sembrados de Este a Oeste, permitiendo el paso de la luz a los estratos bajos.'),
                                  _buildBulletPoint('Diferentes tipos de plantas aprovechando todos los estratos: árboles maderables y frutales, arbustos comestibles, hierbas medicinales y para control de plagas, así como cultivos anuales.'),
                                  _buildBulletPoint('Especies seleccionadas según su adaptabilidad en la zona y que sean complementarias en cuanto a los nutrientes que demandan al suelo.'),
                                  _buildBulletPoint('Prácticas de mantenimiento (podas, abonos orgánicos, control de plagas).'),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
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
                                      'ima/Sistema7.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const Text(
                                    'Los árboles de estratos superiores obtienen nutrientes a profundidades mayores del suelo. Cuando su hojarasca cae o se utiliza en abonos orgánicos se vuelve materia orgánica disponible para cultivos de estratos más bajos.',
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
                                  const SizedBox(width: 5),
                                  const Expanded(
                                    child: Center(
                                      child: Text(
                                        'b) Estratos y cultivos asociados (20 min)',
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
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
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
                                    'Pide a los participantes que identifiquen los estratos en el sistema silvoagrícola, los tipos de plantas que los conforman y las actividades de mantenimiento que necesitan.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Image.asset(
                                      'assets/Gif/6.gif',
                                      width: 120,
                                      height: 120,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  _buildBulletPoints(
                                      'Estrato alto: árboles maderables (caoba, caucho, cedro), frutales (aguacate, mamey) o forrajeros (acacias). El mantenimiento consiste en realizar raleos forestales, (remover árboles para su aprovechamiento maderable) y podas de formación para garantizar que llegue luz a los estratos más bajos (ver ficha de sombra natural).',
                                      Icons.arrow_upward),
                                  _buildBulletPoints(
                                      'Estrato medio: frutales (banano, papaya, cítricos, guayaba), lianas (maracuyá, granadilla). Dependiendo de las necesidades del cultivo, el mantenimiento anual programado consiste en realizar fumigaciones foliares, podas formativas, remover hojas y ramas secas, limpieza de maleza y fertilización orgánica.',
                                      Icons.remove),
                                  _buildBulletPoints(
                                      'Estrato bajo: herbáceas anuales (maíz, arroz, avena); semi-leñosas (tomate, pimiento); tubérculos (papa, yuca, camote,  Maní); hortalizas (lechuga, cebolla, col; cucurbitáceas (pepino, calabaza, sandía); hierbas de olor (mejorana, tomillo, albahaca). El mantenimiento se realiza conforme a un plan de cultivos anual y consiste en realizar rotación de cultivos, asociación benéfica de especies, manejo integrado de plagas y fertilización orgánica.',
                                      Icons.arrow_downward),
                                  const SizedBox(height: 20),
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
                                color: const Color(0xff41C1BA),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    'Actividad didáctica',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    'Muestra en qué parte del sistema silvoagrícola se sitúa cada uno de los puntos críticos para que funcione adecuadamente.',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'Arial'
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  _buildInteractivePoint(
                                    'PUNTO CRÍTICO 1',
                                    'El sistema se diseña para tener producción constante durante todo el año y que con las asociaciones productivas construya resistencia ante plagas y enfermedades.',
                                    Icons.filter_1,
                                  ),
                                  _buildInteractivePoint(
                                    'PUNTO CRÍTICO 2',
                                    'En la siembra de especies maderables o frutales se debe cuidar que el diámetro del tallo sea superior a 1.5 cm para incrementar la tasa de supervivencia.',
                                    Icons.filter_2,
                                  ),
                                  _buildInteractivePoint(
                                    'PUNTO CRÍTICO 3',
                                    'Las podas son sistematizadas y calendarizadas para controlar la sombra y mantener la calidad de la madera y la productividad de los cultivos arbóreos y herbáceos.',
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
                                            'ima/Sistema8.png',
                                            fit: BoxFit.cover),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          'Divisiones de los diferentes estratos de un sistema Silvoagrícola.',
                                          style: TextStyle(fontSize: 18),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 70,
                                            height: 70,
                                            child: Image.asset(
                                                'ima/Sistema9.png'),
                                          ),
                                          const SizedBox(width: 5),
                                          const Expanded(
                                            child: Padding(
                                              padding:
                                              EdgeInsets.only(right: 10),
                                              child: Text(
                                                'Las especies utilizadas también pueden ser leguminosas que se podan y procesan como abono verde para incorporarse al sistema e incrementar su fertilidad. El sistema debe verse como una inversión a mediano y largo plazo (maderables y frutales) pero que también produce anualmente y por temporadas, por lo que un plan de manejo es crucial para su éxito.',
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
