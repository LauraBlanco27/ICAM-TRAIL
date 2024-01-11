import 'package:flutter/material.dart';
import 'PagPrincipal.dart';
import 'Perfil.dart';
import 'Proyectos.dart';

class Lombricomposta extends StatefulWidget {
  const Lombricomposta({super.key});

  @override
  _LombricompostaState createState() => _LombricompostaState();
}

class _LombricompostaState extends State<Lombricomposta> {
  bool _mostrarInformacion = false;

  // Método para construir un elemento de lista con icono y texto.
  Widget _buildItem(IconData icon, String text, {required color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.orange[900]),
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
      leading: Icon(icon, color: const Color(0xff5B4F47)),
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
                    'LOMBRICOMPOSTA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff433831),
                    ),
                  ),
                ),
                Image.asset('ima/Lombri.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _mostrarInformacion = !_mostrarInformacion;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff5B4F47),
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
                          size: 30, color: Color(0xff5B4F47)),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset('assets/Gif/ObjL.gif'),
                      ),
                      const Text(
                        'Objetivos de Aprendizaje',
                        style: TextStyle(
                            color: Color(0xff5B4F47),
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
                                Icon(Icons.eco, size: 20, color: Colors.green),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Los elementos y actividades para generar lombricomposta',
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
                                Icon(Icons.eco, size: 20, color: Colors.green),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Los elementos y actividades para generar y aplicar fermento superamargo',
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
                                Icon(Icons.eco, size: 20, color: Colors.green),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Los beneficios de los abonos orgánicos',
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
                        child: Image.asset('ima/MaterialL.png'),
                      ),
                      const Text(
                        'Materiales',
                        style: TextStyle(
                            color: Color(0xff5B4F47),
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
                                Icons.grass,
                                color: Colors.brown[600],
                                'Estiércol de vaca como fuente de N (65kg)'),
                            _buildItem(
                                Icons.eco,
                                color: Colors.brown[200],
                                'Desechos de cosecha o paja como fuente de C (15kg)'),
                            _buildItem(
                                Icons.bug_report,
                                color: Colors.brown,
                                'Lombrices (1Kg)'),
                            _buildItem(
                                Icons.emoji_nature,
                                color: Colors.brown,
                                'Lombricomposta madura (15kg)'),
                            _buildItem(
                                Icons.construction,
                                color: Colors.grey[300],
                                'Palas y bieldos'),
                            _buildItem(
                                Icons.storage,
                                color: Colors.grey[600],
                                'Contenedor de 200L con trampa de agua'),
                            _buildItem(
                                Icons.fireplace,
                                color: Colors.grey,
                                'Ceniza (4kg)'),
                            _buildItem(
                                Icons.local_drink,
                                color: Colors.yellow[50],
                                'Leche o suero (2L)'),
                            _buildItem(
                                Icons.breakfast_dining,
                                color: Colors.brown,
                                'Melaza (2L)'),
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
                          color: const Color(0xffDDC1A7),
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
                              child: Image.asset('ima/Lombrizz.png'),
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
                                color: Color(0xff5B4F47),
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                fontFamily: 'Arial',
                              ),
                            ),
                            SizedBox(height: 2),
                            Image.asset(
                              'assets/Gif/Pregunta2.gif',
                              width: 120,
                              height: 120,
                            ),
                            SizedBox(height: 10),
                            Text(
                              '¿Qué sabe el grupo de la lombricomposta y sus beneficios?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade600,
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
                          color: const Color(0xffDDC1A7),
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
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
                                color: Color(0xff5B4F47),
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildMessageItem(
                                Icons.nature,
                                'Mejorar los suelos',
                                'Devolviendo sus propiedades de absorción y retención de humedad.'),
                            _buildMessageItem(
                                Icons.trending_up,
                                'Aumentar la productividad',
                                'Al fertilizar suelos y reducir costos con menos insumos químicos.'),
                            _buildMessageItem(
                                Icons.monetization_on,
                                'Diversificar ingresos',
                                'Si la producción es para la venta.'),
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 30.0),
                              child: Image.asset(
                                'ima/Lombricomposta1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Text(
                              'Las camas de lombricomposta deben protegerse con un techo y tener forma de colectar los lixiviados. El tamaño de las camas se calcula conforme a la cantidad de desechos orgánicos que se producen a la semana.',
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
                          color: const Color(0xffBD9479),
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
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green[100],
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
                                  child: Image.asset('ima/TrabajadorL.png',
                                      fit: BoxFit.contain),
                                ),
                              ),
                            ),
                            const SizedBox(width: 0),
                            const Expanded(
                              child: Center(
                                child: Text(
                                  'a) Siembra de lombrices (20 min)',
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
                      const SizedBox(height: 25),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                                color: Color(0xff5B4F47),
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Con ayuda de los participantes, empieza una mezcla para producir lombricomposta',
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
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: const Color(0xffDDC1A7),
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.brown.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildBulletPoint(
                                'Los ingredientes para empezar la lombricomposta son fuentes de nitrógeno (excremento o pulpa de café), fuentes de carbono (residuos de cosecha, paja u hojas de árboles) y lombricomposta ya madura. Los ingredientes se utilizan en partes iguales (15 kg en este caso).'),
                            _buildBulletPoint(
                                'Con ayuda de los participantes, coloca los tres ingredientes en la base de la lombricomposta y mézclalos con palas.'),
                            _buildBulletPoint(
                                'Por cada 50 kg de mezcla, aproximadamente agrega 1 kg de lombrices. La mezcla se humedece a prueba de puño.'),
                            const SizedBox(height: 20),
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
                                  color: Colors.green[100],
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
                                  child: Image.asset('ima/TrabajadorL.png',
                                      fit: BoxFit.contain),
                                ),
                              ),
                            ),
                            const SizedBox(width: 0),
                            const Expanded(
                              child: Center(
                                child: Text(
                                  'b) Otros abonos: Supermagro (20 min)',
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
                                  color: Color(0xff5B4F47),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Con ayuda de los participantes, prepara una mezcla de supermagro en un contenedor de 200L:',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                            Center(
                              child: Image.asset(
                                'assets/Gif/3.gif',
                                width: 170,
                                height: 170,
                              ),
                            ),
                            _buildBulletPoints(
                                'Disuelve 50kg de excretas de vaca y 4kg de ceniza o harina de roca en 100L de agua en el contenedor de 200L.',
                                Icons.nature),
                            _buildBulletPoints(
                                'Agrega 2L de suero o leche y 2L de melaza o jugo de caña con agua y revuelve la mezcla.',
                                Icons.local_drink),
                            _buildBulletPoints(
                                'Cierra herméticamente el contenedor e instala la trampa de gases. En pocos minutos se verán burbujas en la botella.',
                                Icons.science),
                            _buildBulletPoints(
                                'Explica que en 20 a 30 días la fermentación estará lista, en lugares fríos puede tardar entre 60 y 90.',
                                Icons.timer),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Icon(Icons.info_outline,
                                color: Colors.blue, size: 24),
                          ),
                          const SizedBox(width: 3),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text:
                                            'El abono tendrá olor a fermentación y será de color '),
                                    TextSpan(
                                      text: 'ámbar translucido',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.amber),
                                    ),
                                    TextSpan(text: '; si es de color '),
                                    TextSpan(
                                      text: 'azul violeta',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepPurple),
                                    ),
                                    TextSpan(
                                        text:
                                            ' y huele a podrido hubo alguna fuga en el sistema hermético. Para aplicar, se diluyen '),
                                    TextSpan(
                                      text:
                                          '5 a 10L de fermento en 100L de agua.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                    TextSpan(
                                        text:
                                            ' El biofertilizante debe estar muy bien filtrado antes de mezclar.'),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xffDDC1A7).withOpacity(0.95),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.brown.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'La producción de supermagro es un proceso anaerobio (sin aire). Se debe cerrar el contenedor herméticamente y sellar la trampa de gases con silicón.',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 20),
                            SizedBox(
                              width: 150,
                              height: 150,
                              child: Image.asset('ima/TanqL.png',
                                  fit: BoxFit.cover),
                            ),
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
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green[100],
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
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                              'La capacidad de la lombricompostera depende de la cantidad de materia orgánica generada por la finca o la unidad familiar.',
                              Icons.filter_1,
                            ),
                            _buildInteractivePoint(
                              'PUNTO CRÍTICO 2',
                              'El proceso inicia con una pila de mezcla en un extremo de las dos camas de producción. La composta madura se colecta después de unos 21 días.',
                              Icons.filter_2,
                            ),
                            _buildInteractivePoint(
                              'PUNTO CRÍTICO 3',
                              'Al humedecer la mezcla se generan lixiviados. La fosa debe tener una cámara para colectar estos lixiviados, los cuales pueden usarse como fertilizante orgánico foliar.',
                              Icons.filter_3,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Card(
                            elevation: 5,
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 200,
                                  height: 170,
                                  child: Image.asset('ima/ImaL.png',
                                      fit: BoxFit.cover),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Las camas se construyen con una leve pendiente para que los lixiviados fluyan al recipiente. Los lixiviados se diluyen en relación 1:20 y se aplican de forma foliar.',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            color: const Color(0xffDDC1A7),
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 70,
                                      height: 70,
                                      child: Image.asset('ima/TipL.png'),
                                    ),
                                    const SizedBox(width: 5),
                                    const Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text(
                                          'La lombricomposta terminada debe guardarse en un lugar techado para su posterior venta o aplicación. Se recomienda aplicar la lombricomposta antes de la siembra y durante el período de cultivo. Producir lombricomposta es mucho más barato que comprarla. Una vez terminado el proceso de fermentación y abierto el contenedor, hay que utilizar el supermagro en pocos días para evitar que se descomponga. Se diluye al 10% y se aplica al suelo durante el periodo de crecimiento del cultivo.',
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
