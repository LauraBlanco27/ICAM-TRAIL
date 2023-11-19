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
                                'ima/Reservorio2.png',
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
                              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'a) La forma correcta de colocar el plástico de invernadero \n',
                                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                                  ),
                                  Text(
                                    'b) Los beneficios a la medida\n',
                                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                                  ),
                                  Text(
                                    'c) El manejo de plagas dentro del invernadero',
                                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
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
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'a) Filtros de sedimentos',
                                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                                  ),
                                  Text(
                                    'b) Válvula de salida del reservorio',
                                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                                  ),
                                  Text(
                                    'b) Tubos de PVC para rebalse',
                                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
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
                                    child: Image.asset('ima/Reservorio4.png'),
                                  ),
                                  const SizedBox(width: 2),
                                  const Flexible(
                                    child: Text(
                                      '\nb) Introducción a la medida(10 min)',
                                      style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
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
                                          color: Color(0xff2F3B69),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '¿Qué sabe el grupo de los reservorios de agua?',
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
                                color: const Color(0xff3E829A),
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
                                          color: Color(0xffFFFFFF),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Los reservorios ayudan a:\n',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    '* Almacenar agua para épocas secas.\n'
                                    '* Aumentar la productividad\n'
                                    '* Aumentar la humedad relativa de los alrededores',

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
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50.0),
                                    child: Image.asset('ima/Reservorio5.png'),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '\nExcavación de un reservorio y la zanja que sujeta la geomembrana',
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
                            const SizedBox(height: 10),
                            const Row(
                              children: [
                                SizedBox(width: 2),
                                Flexible(
                                  child: Text(
                                    'a) Principales elementos (20 min)',
                                    style: TextStyle(
                                        color: Color(0xffFFFFFF),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    textAlign:
                                    TextAlign.center, // Alinea el texto al centro
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
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 100.0),
                                    child: Text(
                                      'Actividad didáctica\n',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff2F3B69),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Muestra los principales elementos del reservorio para que funcione correctamente',
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
                                color: const Color(0xff3E829A),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 50.0),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '* Los reservorios deben tener una capa impermeable. Esto se logra con geomembrana, cemento o arcilla compactada.\n'
                                        '* El fondo se construye con una leve pendiente para que el agua fluya a los tubos de salida.\n'
                                        '* Antes del tubo o canal de entrada se construye un sistema simple de filtrado o sedimentación.\n'
                                        '* La salida cuenta con dos tubos, uno para limpieza y otro para distribución.\n'
                                        '* En la parte superior del reservorio se coloca un tubo o canal de rebalse que conduce el excedente de agua a un drenaje.\n',
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
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50.0),
                                    child: Image.asset('ima/Reservorio6.png'),
                                  ),
                                  const Text(
                                    '\nReservorio con la geomembrana instalada. La zanja se rellena para sujetar la membrana una vez lleno el reservorio',
                                    textAlign: TextAlign.center,
                                    style:
                                    TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 5),
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 50.0),
                                  ),
                                  Row(
                                    children: [
                                      const Expanded(
                                        child: Text(
                                          'Las salidas de agua tienen un tubo para la limpieza o desagüe y el tubo de distribución con el filtro para proteger el sistema de riego',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      SizedBox(
                                        width: 170,
                                        height: 170,
                                        child: Image.asset('ima/Reservorio7.png'),
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
                                    width: 35,
                                    height: 35,
                                    child: Image.asset('ima/Reservorio8.png'),
                                  ),
                                  const SizedBox(width: 2),
                                  const Flexible(
                                    child: Text(
                                      '\nb) Sistema de distribución (10 min)',
                                      style: TextStyle(
                                          color: Color(0xffFFFFFF),
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
                                color: Colors.white,
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
                                          color: Color(0xff2F3B69),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Muestra el sistema de distribución y los elementos que garantizan agua de buena calidad para riego.\n\n\n'
                                        '* Los sedimentadores se instalan para evitar que hojas, ramas, piedras u otros objetos grandes entren al reservorio, lo que podría dañar la geomembrana o afectar la calidad del agua.\n\n'
                                        '* Para que el agua del reservorio sea apta para riego eficiente es necesario instalar filtros que mejoren su calidad.\n\n'
                                        '* El reservorio se sitúa en las partes altas para que el agua fluya por gravedad en el sistema de distribución.\n\n'
                                        '* El sistema debe contar con una forma de vaciar el agua para poder limpiar o desenzolvar el reservorio.',
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
                                Padding(
                                  padding: const EdgeInsets.only(top: 50.0),
                                  child: Image.asset('ima/Reservorio9.png'),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'En lugares donde es difícil excavar se pueden construir reservorios superficiales con una estructura metálica y geomembrana.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
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
                                  SizedBox(
                                    width: 35,
                                    height: 35,
                                    child: Image.asset('ima/Reservorio10.png'),
                                  ),
                                  const SizedBox(width: 2),
                                  const Flexible(
                                    child: Text(
                                      '\nc) Explicación de la medida (10 min)',
                                      style: TextStyle(
                                          color: Color(0xffFFFFFF),
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
                                color: Colors.white,
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
                                          color: Color(0xff2F3B69),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Muestra en qué parte del sistema se sitúa cada uno de los puntos críticos para que funcione adecuadamente.\n\n\n'
                                        'PUNTO CRÍTICO 1: La capacidad del reservorio se calcula con base en las necesidades de riego, cultivos o ganado del sitio para dotar agua a los sistemas productivos durante toda la época seca.\n\n'
                                        'PUNTO CRÍTICO 2: Para evitar la evaporación del agua almacenada se sugiere instalar una tapa de geomembrana o una malla-sombra tipo Raschel del 80%.\n\n'
                                        'PUNTO CRÍTICO 3: El reservorio se construye en terrenos de poca productividad o terrenos inclinados, pero con pendientes menores a 30°.',
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
                                SizedBox(
                                  width: 200, // Ancho deseado
                                  height: 170, // Alto deseado
                                  child: Image.asset('ima/Reservorio11.png'),
                                ),
                                const SizedBox(height: 0.1),
                                const Text(
                                  'Reservorio superficial finalizado. La  fuente de agua debe quedar por encima del punto más alto del reservorio.',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  color: const Color(0xffFFFFFF),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 70,
                                        height: 70,
                                        child: Image.asset('ima/Reservorio12.png'),
                                      ),
                                      const SizedBox(width: 10),
                                      const Expanded(
                                        child: Text(
                                          'El reservorio debe recibir mantenimiento cada 6 meses. El mantenimiento cosiste en vaciar y desazolvar el reservorio, revisar todas las conexiones y limpiar los filtros. Los filtros del sistema de riego deben revisarse y limpiarse cada semana',
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