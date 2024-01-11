import 'package:flutter/material.dart';
import 'PagPrincipal.dart';
import 'Perfil.dart';
import 'Proyectos.dart';

class RiegoEficiente extends StatefulWidget {
  const RiegoEficiente({super.key});

  @override
  _RiegoEficienteState createState() => _RiegoEficienteState();
}

class _RiegoEficienteState extends State<RiegoEficiente> {
  bool _mostrarInformacion = false;

  // Método para construir un elemento de lista con icono y texto.
  Widget _buildItem(IconData icon, String text, {required color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.grey[900]),
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
      leading: Icon(icon, color: Color(0xffCAE8FF)),
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
        backgroundColor: const Color(0xffF4F6FC),
        appBar: AppBar(
          backgroundColor: const Color(0xffd9d9d9),
          toolbarHeight: screenHeight * 0.05,
          elevation: 0.0,
          leading: IconButton(
            icon:
                const Icon(color: Color(0xff050A30), Icons.arrow_back_ios_new),
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
                          'ima/Riego1.png',
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
                          'ima/Riego2.png',
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
                          'ima/Riego3.png',
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
                    'RIEGO EFICIENTE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff050A30),
                    ),
                  ),
                ),
                Image.asset('ima/Riego4.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _mostrarInformacion = !_mostrarInformacion;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff050A30),
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
                          size: 30, color: Color(0xff050A30)),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xffCAE8FF),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                'assets/Gif/ObjGif1.gif',
                                width: 120,
                                height: 120,
                              ),
                            ),
                            const Text(
                              'Objetivos de Aprendizaje',
                              style: TextStyle(
                                  color: Color(0xff050A30),
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
                                          size: 20, color: Colors.green),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          'La importancia del mantenimiento de la medida',
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
                                          'Los componentes de un sistema de riego eficiente',
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
                                'ima/Riego6.png',
                                width: 120,
                                height: 120,
                              ),
                            ),
                            const Text(
                              'Materiales',
                              style: TextStyle(
                                  color: Color(0xff050A30),
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
                                      Icons.extension,
                                      color: Colors.brown[600],
                                      'Componentes del sistema sin instalar'),
                                  _buildItem(
                                      Icons.opacity,
                                      color: Colors.brown[200],
                                      'Sistema de riego eficiente instalado'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: const Color(0xff5CB6F9),
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
                                color: const Color(0xffCAE8FF),
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
                                    child: Image.asset('ima/presentacion.png'),
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
                                color: Colors.white,
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
                                      color: Color(0xff050A30),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Image.asset(
                                    'assets/Gif/Pregunta3.gif',
                                    width: 120,
                                    height: 120,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '¿Qué sabe el grupo acerca del riego eficiente y sus beneficios?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xff5CB6F9),
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
                                    'El riego eficiente ayuda a:  \n',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  _buildMessageItem(
                                      Icons.local_florist,
                                      'Dar agua a las plantas',
                                      'justo donde necesitan.'),
                                  _buildMessageItem(Icons.trending_up,
                                      'Aumentar la', 'productividad.'),
                                  _buildMessageItem(Icons.add_business_outlined,
                                      'Fertilizar con abonos', 'líquidos.'),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xffCAE8FF),
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
                                      'ima/Riego8.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const Text(
                                    'El deposito de agua debe cubrir las necesidades del área a regar. Cuenta con válvulas y filtros para controlar la calidad y cantidad del agua. Luego se conecta el ramal primario del cual salen las líneas de distribución.',
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
                                color: const Color(0xff050A30),
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
                                            'ima/riego (1).png',
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 0),
                                  const Expanded(
                                    child: Center(
                                      child: Text(
                                        'a) Elementos del sistema y función (20 min)',
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
                            const SizedBox(height: 15),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xffCAE8FF),
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
                                    'Sobre una mesa coloca los componentes esenciales de un sistema de riego eficiente en orden aleatorio. Pide a los participantes que te ayuden a poner cada componente en el orden de instalación, explicando su función.',
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
                                color: const Color(0xff5CB6F9),
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
                                      'El depósito de agua es donde empieza el sistema.'),
                                  _buildBulletPoint(
                                      'La válvula de paso hace circular el agua dentro del sistema'),
                                  _buildBulletPoint(
                                      'El filtro retiene las impurezas del agua del tanque que pueden taponear o dañar el sistema de riego.'),
                                  _buildBulletPoint(
                                      'La distribución primaria cubre el ancho del terreno que se quiere regar y va enterrada.'),
                                  _buildBulletPoint(
                                      'La distribución primaria cubre el ancho del terreno que se quiere regar y va enterrada.'),
                                  _buildBulletPoint(
                                    'La distribución secundaria Contiene los dosificadores y se pone a lo largo de cada cama que se quiera irrigar'),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xffCAE8FF),
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
                                      'ima/Riego10.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const Text(
                                    'Los ramales primarios se entierran para protegerlos de daños.',
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
                                            'ima/riego (1).png',
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 0),
                                  const Expanded(
                                    child: Center(
                                      child: Text(
                                        'b) Comparación con sistema instalado (20 min)',
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
                                    'Pide a los participantes que observen el funcionamiento de un sistema eficiente y que lo comparen con un riego por gravedad.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Image.asset(
                                      'assets/Gif/4.gif',
                                      width: 120,
                                      height: 120,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  _buildBulletPoints(
                                      'La cantidad de agua que dispensa el sistema de riego es mucho menor a la de un riego por inundación o aspersión.',
                                      Icons.water_drop_outlined),
                                  _buildBulletPoints(
                                      'Toda el agua es aprovechada y se queda en el terreno.',
                                      Icons.water_drop_outlined),
                                  _buildBulletPoints(
                                      'El agua tiene tiempo suficiente de infiltrarse en el suelo y no se genera encharcamiento, erosión o escorrentía.',
                                      Icons.water_drop_outlined),
                                  _buildBulletPoints(
                                      'El agua pasa por un filtro previo a su ingreso al sistema de distribución. Esto evita daños en los dosificadores (goteros, nebulizadores, microaspersores).',
                                      Icons.water_drop_outlined),
                                  _buildBulletPoints(
                                      'Las válvulas de alivio, instaladas después de las válvulas de paso, permiten que el aire salga del sistema y solo contenga agua.',
                                      Icons.water_drop_outlined),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 380,
                                      height: 250,
                                      child: Image.asset('ima/Riego11.png'),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 50),
                              ],
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
                                        child: Image.asset('ima/riego (1).png',
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
                                  SizedBox(height: 15),
                                  const Text(
                                    'Muestra en qué parte del sistema de riego se sitúa cada uno de los puntos críticos para que funcione adecuadamente.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Center(
                                    child: Image.asset(
                                      'assets/Gif/4.gif',
                                      width: 150,
                                      height: 150,
                                    ),
                                  ),
                                  _buildInteractivePoint(
                                    'PUNTO CRÍTICO 1',
                                    'El mantenimiento del sistema debe hacerse al menos una vez al mes. Consiste en verificar que el agua del tanque esté limpia, los goteros o microaspersores tengan agua fluyendo y verificar las conexiones. Los filtros deben limpiarse por lo menos cada semana.',
                                    Icons.filter_1,
                                  ),
                                  _buildInteractivePoint(
                                    'PUNTO CRÍTICO 2',
                                    'Para evitar el uso de bombas debe haber suficiente diferencia de altura entre el tanque de almacenamiento y la red de distribución. El sistema trabaja con la presión del agua, así que entre mayor sea el metraje de tubería y el número de ramificaciones, mayor la altura requerida.',
                                    Icons.filter_2,
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
                                            'ima/Riego12.png',
                                            fit: BoxFit.cover),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          'Los dosificadores (microaspersores, goteros, nebulizadores) son de bajo volumen y alta frecuencia. Es decir, proveen agua en poca cantidad, pero de forma constate, dando tiempo al suelo para absorber cada gota.',
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
                                  color: const Color(0xff5CB6F9),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 70,
                                            height: 70,
                                            child: Image.asset(
                                                'ima/Riego13.png'),
                                          ),
                                          const SizedBox(width: 5),
                                          const Expanded(
                                            child: Padding(
                                              padding:
                                              EdgeInsets.only(right: 10),
                                              child: Text(
                                                'Se puede realizar la fertirrigación utilizando biol o lixiviado de lombricomposta, siempre y cuando esté bien filtrado para no dañar los goteros.',
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
