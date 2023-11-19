import 'package:flutter/material.dart';
import 'PagPrincipal.dart';
import 'Perfil.dart';
import 'Proyectos.dart';

class RiegoEficiente extends StatefulWidget {
  const RiegoEficiente({super.key});

  @override
  _RiegoEficienteState createState() =>
      _RiegoEficienteState();
}

class _RiegoEficienteState extends State<RiegoEficiente> {
  bool _mostrarInformacion = false;

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
                      padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    ),
                    child:
                    const Text(
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
                      const Icon(Icons.arrow_downward, size: 30, color: Color(0xff050A30)),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xffCAE8FF),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                'ima/Riego5.png',
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
                              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'a)  Los beneficios de la medida\n',
                                    style: TextStyle(color: Color(0xff272727), fontSize: 16),
                                  ),
                                  Text(
                                    'b) La importancia del mantenimiento de la medida\n',
                                    style: TextStyle(color: Color(0xff272727), fontSize: 16),
                                  ),
                                  Text(
                                    'c) Los componentes de un sistema de riego eficiente',
                                    style: TextStyle(color: Color(0xff272727), fontSize: 16),
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
                                  color: Color(0xff272727),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'a) Componentes del sistema sin instalar',
                                    style: TextStyle(color: Color(0xff272727), fontSize: 16),
                                  ),
                                  Text(
                                    'b) Sistema de riego eficiente instalado',
                                    style: TextStyle(color: Color(0xff272727), fontSize: 16),
                                  ),
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
                                    color: Colors.grey.shade700, // Color de la línea
                                    width: 2.0, // Grosor de la línea
                                  ),
                                ),
                              ),
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Image.asset('ima/introduccion.png'),
                                  ),
                                  const SizedBox(width: 2),
                                  const Flexible(
                                    child: Text(
                                      '1. Introducción a la medida (10 min)',
                                      style: TextStyle(
                                          color: Color(0xff050A30),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Color(0xffCAE8FF),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 100.0),
                                    child: Text(
                                      'Ronda participativa de intercambio de conocimiento\n',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff050A30),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '¿Qué sabe el grupo acerca del riego eficiente y sus beneficios?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 100.0),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xff5CB6F9),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 50.0),
                                    child: Text(
                                      'Mensajes clave a transmitir\n',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff272727),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'El riego eficiente ayuda a:  \n',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    '* Dar agua a las plantas justodonde necesitan\n\n'
                                        '* Aumentar la productividad.\n\n '
                                        '* Fertilizar con abonos líquidos',

                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 50.0),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Color(0xffCAE8FF),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50.0),
                                    child: Image.asset('ima/Riego8.png'),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '\nEl deposito de agua debe cubrir las necesidades del área a regar. Cuenta con válvulas y filtros para controlar la calidad y cantidad del agua. Luego se conecta el ramal primario del cual salen las líneas de distribución.',
                                    textAlign: TextAlign.center,
                                    style:
                                    TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 10),
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 50.0),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 20.0),
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
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset('ima/riego (1).png'),
                                ),
                                const SizedBox(width: 0),
                                const Flexible(
                                  child: Text(
                                    'a) Elementos del sistema y función',
                                    style: TextStyle(
                                        color: Color(0xff272727),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            const SizedBox(height: 15),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Color(0xffCAE8FF),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 100.0),
                                    child: Text(
                                      'Actividad práctica\n',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff272727),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Sobre una mesa coloca los componentes esenciales de un sistema de riego eficiente en orden aleatorio. Pide a los participantes que te ayuden a poner cada componente en el orden de instalación, explicando su función.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 100.0),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xff5CB6F9),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 50.0),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '* El depósito de agua es donde empieza el sistema.\n\n'
                                        '* La válvula de paso hace circular el agua dentro del sistema\n\n'
                                        '* El filtro retiene las impurezas del agua del tanque que pueden taponear o dañar el sistema de riego.\n\n'
                                        '* La distribución primaria cubre el ancho del terreno que se quiere regar y va enterrada.\n\n'
                                        '* Los conectores o válvulas conectan la distribución primaria con la secundaria.\n\n'
                                        '* La distribución secundaria Contiene los dosificadores y se pone a lo largo de cada cama que se quiera irrigar',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 50.0),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Color(0xffCAE8FF),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50.0),
                                    child: Image.asset('ima/Riego10.png'),
                                  ),
                                  const Text(
                                    '\nLos ramales primarios se entierran para protegerlos de daños.',
                                    textAlign: TextAlign.center,
                                    style:
                                    TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 5),
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 50.0),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade700, // Color de la línea
                                    width: 2.0, // Grosor de la línea
                                  ),
                                ),
                              ),
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Image.asset('ima/riego (1).png'),
                                  ),
                                  const SizedBox(width: 2),
                                  const Flexible(
                                    child: Text(
                                      'b) Comparación con sistema instalado (20 min)',
                                      style: TextStyle(
                                          color: Color(0xff272727),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Color(0xffCAE8FF),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: Text(
                                      'Actividad práctica\n',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff272727),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Pide a los participantes que observen el funcionamiento de un sistema eficiente y que lo comparen con un riego por gravedad.\n\n\n'
                                        '* La cantidad de agua que dispensa el sistema de riego es mucho menor a la de un riego por inundación o aspersión.\n\n'
                                        '* Toda el agua es aprovechada y se queda en el terreno.\n\n'
                                        '* El agua tiene tiempo suficiente de infiltrarse en el suelo y no se genera encharcamiento, erosión o escorrentía. \n\n'
                                        '* El agua pasa por un filtro previo a su ingreso al sistema de distribución. Esto evita daños en los dosificadores (goteros, nebulizadores, microaspersores).\n\n'
                                        '* Las válvulas de alivio, instaladas después de las válvulas de paso, permiten que el aire salga del sistema y solo contenga agua.',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 20.0),
                                  ),
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
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade700, // Color de la línea
                                    width: 2.0, // Grosor de la línea
                                  ),
                                ),
                              ),
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 2),
                                  const Flexible(
                                    child: Text(
                                      'c) Explicación de la medida (10 min)',
                                      style: TextStyle(
                                          color: Color(0xff272727),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Color(0xffCAE8FF),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: Text(
                                      'Actividad didáctica\n',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff291B25),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Muestra en qué parte del sistema de riego se sitúa cada uno de los puntos críticos para que funcione adecuadamente.\n\n\n'
                                        'PUNTO CRÍTICO 1: El mantenimiento del sistema debe hacerse al menos una vez al mes. Consiste en verificar que el agua del tanque esté limpia, los goteros o microaspersores tengan agua fluyendo y verificar las conexiones. Los filtros deben limpiarse por lo menos cada semana.\n\n'
                                        'PUNTO CRÍTICO 2: Para evitar el uso de bombas debe haber suficiente diferencia de altura entre el tanque de almacenamiento y la red de distribución. El sistema trabaja con la presión del agua, así que entre mayor sea el metraje de tubería y el número de ramificaciones, mayor la altura requerida.',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 20.0),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Column(
                              children: [
                                SizedBox(
                                  width: 270, // Ancho deseado
                                  height: 140, // Alto deseado
                                  child: Image.asset('ima/Riego12.png'),
                                ),
                                const SizedBox(height: 0.1),
                                const Text(
                                  '\nLos dosificadores (microaspersores, goteros, nebulizadores) son de bajo volumen y alta frecuencia. Es decir, proveen agua en poca cantidad, pero de forma constate, dando tiempo al suelo para absorber cada gota. \n',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  color: const Color(0xff5CB6F9),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 70,
                                        height: 70,
                                        child: Image.asset('ima/Riego13.png'),
                                      ),
                                      const SizedBox(width: 10),
                                      const Expanded(
                                        child: Text(
                                          'Se puede realizar la fertirrigación utilizando biol o lixiviado de lombricomposta, siempre y cuando esté bien filtrado para no dañar los goteros.',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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