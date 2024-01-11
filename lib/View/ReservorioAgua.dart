import 'package:flutter/material.dart';
import 'PagPrincipal.dart';
import 'Perfil.dart';
import 'Proyectos.dart';

class ReservorioAgua extends StatefulWidget {
  const ReservorioAgua({super.key});

  @override
  _ReservorioAguaState createState() =>
      _ReservorioAguaState();
}

class _ReservorioAguaState extends State<ReservorioAgua> {
  bool _mostrarInformacion = false;

  // Método para construir un elemento de lista con icono y texto.
  Widget _buildItem(IconData icon, String text, {required color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 18, color: Colors.white),
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
                    'RESERVORIO DE AGUA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2F3B69),

                    ),
                  ),
                ),
                Image.asset('ima/Reservorio1.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _mostrarInformacion = !_mostrarInformacion;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffE3DDDC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    ),
                    child:
                    const Text(
                      'Comienza ahora',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff162651),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _mostrarInformacion,
                  child: Column(
                    children: [
                      const Icon(Icons.arrow_downward, size: 30, color: Color(0xff162651)),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xff3E829A),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                'assets/Gif/ReservorioGif.gif',
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
                                          size: 20, color: Colors.green),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          'La forma correcta de colocar el plástico de invernadero',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
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
                                              color: Colors.white),
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
                                              color: Colors.white),
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
                                'ima/Reservorio3.png',
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
                                      Icons.filter_alt,
                                      color: Colors.brown[600],
                                      'Filtros de sedimentos'),
                                  _buildItem(
                                      Icons.water_drop,
                                      color: Colors.brown[200],
                                      'Válvula de salida del reservorio'),
                                  _buildItem(
                                      Icons.tune,
                                      color: Colors.brown,
                                      'Tubos de PVC para rebalse'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: const Color(0xff3E829A),
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
                                    child: Image.asset('assets/Gif/historia.gif'),
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
                                    'assets/Gif/Pregunta11.gif',
                                    width: 120,
                                    height: 120,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '¿Qué sabe el grupo de los reservorios de agua?',
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
                                color: const Color(0xff3E829A),
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
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Los reservorios ayudan a:',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  _buildMessageItem(
                                      Icons.trending_up,
                                      'Almacenar agua para épocas',
                                      'secas.'),
                                  _buildMessageItem(
                                      Icons.trending_up,
                                      'Aumentar la productividad',''),
                                  _buildMessageItem(
                                      Icons.trending_up,
                                      'Aumentar la humedad relativa de',
                                      'los alrededores'),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    12.0),
                              ),
                              child: Column(
                                children: [
                                  Image.asset('ima/Reservorio5.png',
                                      width: 200,
                                      height:
                                      200),
                                  const Text(
                                    'Excavación de un reservorio y la zanja que sujeta la geomembrana',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(
                                            0xff5A5A5A)),
                                  ),
                                  const SizedBox(
                                      height:
                                      20),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xffE3DDDC),
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
                                              color: Color(0xff2F3B69),
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
                            const SizedBox(height: 20),
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
                                            'ima/agua.png',
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Expanded(
                                    child: Center(
                                      child: Text(
                                        'a) Principales elementos (20 min)',
                                        style: TextStyle(
                                          color: Colors.white,
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
                              ),
                              child: const Column(
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    'Actividad didáctica\n',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Muestra los principales elementos del reservorio para que funcione correctamente',
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
                            const SizedBox(height: 15),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xff3E829A),
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
                                      'Los reservorios deben tener una capa impermeable. Esto se logra con geomembrana, cemento o arcilla compactada.'),
                                  _buildBulletPoint(
                                      'El fondo se construye con una leve pendiente para que el agua fluya a los tubos de salida.'),
                                  _buildBulletPoint(
                                      ' Antes del tubo o canal de entrada se construye un sistema simple de filtrado o sedimentación.'),
                                  _buildBulletPoint(
                                      'La salida cuenta con dos tubos, uno para limpieza y otro para distribución.'),
                                  _buildBulletPoint(
                                      'En la parte superior del reservorio se coloca un tubo o canal de rebalse que conduce el excedente de agua a un drenaje.'),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'ima/Reservorio6.png',
                                    width: double.infinity, // Ocupa todo el ancho disponible
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                                    child: Text(
                                      'Reservorio con la geomembrana instalada. La zanja se rellena para sujetar la membrana una vez lleno el reservorio',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 10), // Espacio a la derecha para balancear con la imagen
                                          child: Text(
                                            'Las salidas de agua tienen un tubo para la limpieza o desagüe y el tubo de distribución con el filtro para proteger el sistema de riego',
                                            style: TextStyle(
                                              fontSize: 14, // Tamaño de letra más pequeño
                                              color: Colors.black54,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        'ima/Reservorio7.png',
                                        width: 150, // Ajusta el tamaño de la imagen
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
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
                                            'ima/agua.png',
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 0),
                                  const Expanded(
                                    child: Center(
                                      child: Text(
                                        'b) Sistema de distribución (10 min)',
                                        style: TextStyle(
                                          color: Colors.white,
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
                                    'Muestra el sistema de distribución y los elementos que garantizan agua de buena calidad para riego.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 10),
                                  Center(
                                    child: Image.asset(
                                      'assets/Gif/12.gif',
                                      width: 120,
                                      height: 120,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  _buildBulletPoints(
                                      'Los sedimentadores se instalan para evitar que hojas, ramas, piedras u otros objetos grandes entren al reservorio, lo que podría dañar la geomembrana o afectar la calidad del agua.',
                                      Icons.eco),
                                  _buildBulletPoints(
                                      'Para que el agua del reservorio sea apta para riego eficiente es necesario instalar filtros que mejoren su calidad.',
                                      Icons.eco),
                                  _buildBulletPoints(
                                      'El reservorio se sitúa en las partes altas para que el agua fluya por gravedad en el sistema de distribución.',
                                      Icons.eco),
                                  _buildBulletPoints(
                                      'El sistema debe contar con una forma de vaciar el agua para poder limpiar o desenzolvar el reservorio.',
                                      Icons.eco),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30.0),
                                    child: Image.asset(
                                      'ima/Reservorio9.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const Text(
                                    'En lugares donde es difícil excavar se pueden construir reservorios superficiales con una estructura metálica y geomembrana.',
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
                            const SizedBox(height: 20),
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
                                            'ima/agua.png',
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
                                          color: Colors.white,
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
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    'Actividad didáctica',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff2F3B69),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  const Text(
                                    'Muestra en qué parte del sistema se sitúa cada uno de los puntos críticos para que funcione adecuadamente.',
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
                                    'La capacidad del reservorio se calcula con base en las necesidades de riego, cultivos o ganado del sitio para dotar agua a los sistemas productivos durante toda la época seca.',
                                    Icons.filter_1,
                                  ),
                                  _buildInteractivePoint(
                                    'PUNTO CRÍTICO 2',
                                    'Para evitar la evaporación del agua almacenada se sugiere instalar una tapa de geomembrana o una malla-sombra tipo Raschel del 80%.',
                                    Icons.filter_2,
                                  ),
                                  _buildInteractivePoint(
                                    'PUNTO CRÍTICO 3',
                                    'El reservorio se construye en terrenos de poca productividad o terrenos inclinados, pero con pendientes menores a 30°.',
                                    Icons.filter_3,
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
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
                                        child: Image.asset('ima/Reservorio11.png',
                                            fit: BoxFit.cover),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          'Reservorio superficial finalizado. La  fuente de agua debe quedar por encima del punto más alto del reservorio.',
                                            style: TextStyle(fontSize: 16,
                                              fontWeight: FontWeight.bold),
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
                                            child:
                                            Image.asset('ima/Reservorio12.png'),
                                          ),
                                          const SizedBox(width: 5),
                                          const Expanded(
                                            child: Padding(
                                              padding:
                                              EdgeInsets.only(right: 10),
                                              child: Text(
                                                'El reservorio debe recibir mantenimiento cada 6 meses. El mantenimiento cosiste en vaciar y desazolvar el reservorio, revisar todas las conexiones y limpiar los filtros. Los filtros del sistema de riego deben revisarse y limpiarse cada semana',
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