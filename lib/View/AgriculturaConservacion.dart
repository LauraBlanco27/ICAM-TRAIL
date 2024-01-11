import 'package:flutter/material.dart';
import 'PagPrincipal.dart';
import 'Perfil.dart';
import 'Proyectos.dart';

class AgriculturaConservacion extends StatefulWidget {
  const AgriculturaConservacion({super.key});

  @override
  _AgriculturaConservacionState createState() =>
      _AgriculturaConservacionState();
}

class _AgriculturaConservacionState extends State<AgriculturaConservacion> {
  bool _mostrarInformacion = false;

  // Método para construir un elemento de lista con icono y texto.
  Widget _buildItem(IconData icon, String text, {required color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: const Color(0xff5EC57E)),
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
      leading: Icon(icon, color: Colors.green),
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
        backgroundColor: const Color(0xffECF8E5),
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
                          'ima/Onu.png',
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
                          'ima/Meba.png',
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
                          'ima/Log.png',
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
                    'AGRICULTURA DE CONSERVACIÓN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff347571),
                    ),
                  ),
                ),
                Image.asset('ima/Duracion.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _mostrarInformacion = !_mostrarInformacion;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff5EC57E),
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
                          size: 30, color: Color(0xff5EC57E)),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(
                          'assets/Gif/ObjGif5.gif',
                          width: 150,
                          height: 150,
                        ),
                      ),
                      const Text(
                        'Objetivos de Aprendizaje',
                        style: TextStyle(
                            color: Color(0xff5EC57E),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.eco_outlined,
                                    size: 20, color: Colors.green),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Los elementos de agricultura de conservación',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.eco_outlined,
                                    size: 20, color: Colors.green),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Los beneficios para el suelo y el agua',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset('ima/Mat1.png'),
                      ),
                      const Text(
                        'Materiales',
                        style: TextStyle(
                            color: Color(0xff5EC57E),
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
                                Icons.local_florist,
                                color: Colors.brown[600],
                                'Semillas o plántulas de abonos verdes y hortalizas'),
                            _buildItem(
                                Icons.eco,
                                color: Colors.brown[200],
                                'Abono organico'),
                            _buildItem(
                                Icons.layers,
                                color: Colors.brown,
                                'pacas para arrope'),
                            _buildItem(
                                Icons.build,
                                color: Colors.brown,
                                'Herramientas'),
                            _buildItem(
                                Icons.water_drop,
                                color: Colors.grey[300],
                                'Manguera para riego'),
                          ],
                        ),
                      ),
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
                              child: Image.asset('assets/Gif/libro.gif'),
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
                                color: Color(0xff347571),
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                fontFamily: 'Arial',
                              ),
                            ),
                            const SizedBox(height: 10),
                            Image.asset(
                              'assets/Gif/Pregunta5.gif',
                              width: 120,
                              height: 120,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              '¿Qué sabe el grupo acerca de agricultura de conservación y sus beneficios?',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        decoration: BoxDecoration(
                          color: const Color(0xffECF8E5),
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
                              'La agricultura de conservación\n',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                            _buildMessageItem(
                                Icons.sync_alt,
                                'Consiste en cubrir el suelo,',
                                'no voltearlo y rotar cultivos.'),
                            _buildMessageItem(Icons.layers_clear,
                                'Evita pérdida de suelo', 'y nutrientes.'),
                            _buildMessageItem(Icons.water_drop,
                                'Mantiene la humedad', 'del suelo.'),
                            _buildMessageItem(
                                Icons.trending_up,
                                'Es de bajo costo y aumenta la productividad',
                                'con menos trabajo.'),
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
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 30.0),
                              child: Image.asset(
                                'ima/Intro1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Text(
                              'El suelo se cubre con arrope para que haya mas materia orgánica y se mantenga la humedad del suelo.',
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
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: const Color(0xff366A3F),
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
                                      color: Colors.green.withOpacity(0.3),
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
                                  child: Image.asset('ima/agricultorr.png',
                                      fit: BoxFit.contain),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Center(
                                child: Text(
                                  'a) Preparación del terreno y siembra (20 min)',
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
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
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
                              'Prepara el suelo y siembra con ayuda de los participantes mientras explicas los pasos de agricultura de conservación.',
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
                          color: const Color(0xffECF8E5),
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
                                'El terreno no se voltea; de ser necesario se puede descompostar los primeros centímetros haciendo surcos con ayuda de picos o arado de cincel.'),
                            _buildBulletPoint(
                                'El abono orgánico se aplica sobre el terreno.'),
                            _buildBulletPoint(
                                '*Cubrir el 100% de la superficie del suelo con 5 a 10 cm de paja como arrope. También se pueden usar residuos de cosecha o abonos cerdes.'),
                            _buildBulletPoint(
                                '*Aplicar la siembra directa de semillas o plántulas en hileras. Se pueden usar herramientas para siembra directa.'),
                            _buildBulletPoint(
                                'Regar las semillas o plántulas y el área de arrope cercana'),
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
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 30.0),
                              child: Image.asset(
                                'ima/Capacitacion.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Text(
                              'El suelo no se voltea. Para descompostarlo se puede usar con arado de cincel.',
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
                                      color: Colors.green.withOpacity(0.3),
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
                                  child: Image.asset('ima/agricultorr.png',
                                      fit: BoxFit.contain),
                                ),
                              ),
                            ),
                            const SizedBox(width: 0),
                            const Expanded(
                              child: Center(
                                child: Text(
                                  'b) Los abonos verdes y la rotación de cultivos (20 min)',
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
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
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
                                'Actividad didáctica',
                                style: TextStyle(
                                  color: Color(0xff347571),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            const Text(
                              'Explica la rotación de cultivos mientras muestras una semilla o planta de abono verde.',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: Image.asset(
                                'assets/Gif/7.gif',
                                width: 120,
                                height: 120,
                              ),
                            ),
                            const SizedBox(height: 10),
                            _buildBulletPoints(
                                'La rotación de cultivos sirve para romper el ciclo de plagas y restaurar la fertilidad del suelo.',
                                Icons.refresh),
                            _buildBulletPoints(
                                'Los abonos verdes son plantas de ciclo corto (2 a 4 meses) que se siembran entre campa{as, se cortan y se dejan en el suelo como arrope.',
                                Icons.local_florist),
                            _buildBulletPoints(
                                'Aumentan la fertilidad de terreno y lo protegen de la erosión.',
                                Icons.trending_up),
                            _buildBulletPoints(
                                'También se pueden usar estos cultivos para la rotación, que no pidan los mismos nutrientes al suelo.',
                                Icons.refresh),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            width: 170,
                            height: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset('ima/Siembra.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 5), // Margen aplicado al contenedor
                              child: const Text(
                                'Hay herramientas específicas para la siembra directa, como esta hoyadora en la que la semilla se pone en un lado y el abono en el otro.',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          const SizedBox(
                              width:
                                  20), // Espacio adicional en el lado derecho
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20), // Margen aplicado al contenedor
                              child: const Text(
                                'Al cubrir el suelo y no voltearlo se va formando una capa nueva de suelo fértil',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            width: 170,
                            height: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset('ima/Siembra2.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
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
                                      color: Colors.green.withOpacity(0.3),
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
                                  child: Image.asset('ima/agricultorr.png',
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
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
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
                            color: const Color(0xffF6F6E9),
                            elevation: 5,
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 200,
                                  height: 170,
                                  child: Image.asset('ima/imaC.png',
                                      fit: BoxFit.cover),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Los residuos de cosecha son un excelente arrope. Es importante dejarlos en el suelo y nunca quemarlos.',
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
                            color: const Color(0xffE4DDDD),
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 70,
                                      height: 70,
                                      child: Image.asset('ima/Tip.png'),
                                    ),
                                    const SizedBox(width: 5),
                                    const Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10),
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
                      )
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
