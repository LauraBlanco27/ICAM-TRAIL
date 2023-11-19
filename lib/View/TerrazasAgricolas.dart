import 'package:flutter/material.dart';
import 'PagPrincipal.dart';
import 'Perfil.dart';
import 'Proyectos.dart';

class TerrazasAgricolas extends StatefulWidget {
  const TerrazasAgricolas({super.key});

  @override
  _TerrazasAgricolasState createState() =>
      _TerrazasAgricolasState();
}

class _TerrazasAgricolasState extends State<TerrazasAgricolas> {
  bool _mostrarInformacion = false;

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
                          'ima/Terraza1.png',
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
                          'ima/Terraza2.png',
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
                          'ima/Terraza3.png',
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
                    'TERRAZAS AGRÍCOLAS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff7B3911),

                    ),
                  ),
                ),
                Image.asset('ima/Terraza4.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _mostrarInformacion = !_mostrarInformacion;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffDDB39A),
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
                      const Icon(Icons.arrow_downward, size: 30, color: Color(0xffDDB39A)),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xffFFEDBD),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                'ima/Terraza5.png',
                                width: 120,
                                height: 120,
                              ),
                            ),
                            const Text(
                              'Objetivos de Aprendizaje',
                              style: TextStyle(
                                  color: Color(0xff7B3911),
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
                                    'a)  Los elementos del huerto familiar \n',
                                    style: TextStyle(color: Color(0xff7B3911), fontSize: 16),
                                  ),
                                  Text(
                                    'b) La forma de hacer camas de doble excavación \n',
                                    style: TextStyle(color: Color(0xff7B3911), fontSize: 16),
                                  ),
                                  Text(
                                    'c) Los beneficios para la seguridad alimentaria de la unidad familiar',
                                    style: TextStyle(color: Color(0xff7B3911), fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset(
                                'ima/Terraza6.png',
                                width: 120,
                                height: 120,
                              ),
                            ),
                            const Text(
                              'Materiales',
                              style: TextStyle(
                                  color: Color(0xff7B3911),
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
                                    'a) Semillas de cultivos bajos (Lechuga, zanahoria) ',
                                    style: TextStyle(color: Color(0xff7B3911), fontSize: 16),
                                  ),
                                  Text(
                                    'b) Semillas de cultivos medios (maíz, quinoa, amaranto)',
                                    style: TextStyle(color: Color(0xff7B3911), fontSize: 16),
                                  ),
                                  Text(
                                    'c) Plantines de cultivos altos (árboles o arbustos frutales)',
                                    style: TextStyle(color: Color(0xff7B3911), fontSize: 16),
                                  ),
                                  Text(
                                    'd) Abono orgánico ',
                                    style: TextStyle(color: Color(0xff7B3911), fontSize: 16),
                                  ),
                                  Text(
                                    'e) Herramientas (pala, bieldo)',
                                    style: TextStyle(color: Color(0xff7B3911), fontSize: 16),
                                  ),
                                  Text(
                                    'f) Material para trazado de las camas de doble excavado (estacas, cuerda)',
                                    style: TextStyle(color: Color(0xff7B3911), fontSize: 16),
                                  ),
                                  Text(
                                    'g) Manguera para riego ',
                                    style: TextStyle(color: Color(0xff7B3911), fontSize: 16),
                                  ),
                                  Text(
                                    'h) Pacas para arrope',
                                    style: TextStyle(color: Color(0xff7B3911), fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: const Color(0xffFFEDBD),
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
                                    child: Image.asset('ima/Terraza7.png'),
                                  ),
                                  const SizedBox(width: 2),
                                  const Flexible(
                                    child: Text(
                                      '1. Introducción a la medida (10 min)',
                                      style: TextStyle(
                                          color: Color(0xff7B3911),
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
                                    padding: EdgeInsets.only(top: 100.0),
                                    child: Text(
                                      'Ronda participativa de intercambio de conocimiento\n',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff7B3911),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '¿Qué sabe el grupo acerca las terrazas agrícolas y sus beneficios?',
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
                                color: const Color(0xffFFEDBD),
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
                                          color: Color(0xff7B3911),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Las terrazas ayudan a: \n',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    '* Reducir la erosión por lluvias intensas.\n\n'
                                        '* Absorber y retener la humedad en el suelo.\n\n'
                                        '* Aumentar la productividad de terrenos en pendiente.',

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
                                    child: Image.asset('ima/Terraza8.png'),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '\nLa tierra en el área de cultivo se acomoda por capas: abajo, gravilla y piedras para drenaje; en medio, arena o tierra más fina, y arriba, tierra fértil para cultivo.',
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
                                color: const Color(0xffDDB39A),
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
                                  child: Image.asset('ima/Terraza9.png'),
                                ),
                                const SizedBox(width: 0),
                                const Flexible(
                                  child: Text(
                                    'a) Limpieza y novelado del terreno (20 min)',
                                    style: TextStyle(
                                        color: Color(0xff7B3911),
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
                                color: Colors.white,
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
                                          color: Color(0xff7B3911),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Muestra cómo debe quedar la terraza comparándola con las terrazas aledañas ya terminadas. Pide a los participantes que ayuden a limpiar y nivelar 2m lineales de terraza aproximadamente.',
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
                                color: const Color(0xffFFEDBD),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 50.0),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '* La maleza se remueve con ayuda de picos y azadones.\n\n'
                                        '* El terreno se deja nivelado para que el agua se infiltre en lugar de escurrir.\n\n'
                                        '* El canal de drenaje se excava a unos 50 cm de profundidad, pegado al muro del fondo de cada terraza.',
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
                                    child: Image.asset('ima/Terraza10.png'),
                                  ),
                                  const Text(
                                    '\nPegado al muro se construye un canal de drenaje o desagüe. Con una pendiente de 2%. Los muros se construyen de forma perpendicular a la pendiente del terreno. Se pueden piedras salidas que sirven de escaleras.',
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
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 2),
                                  Flexible(
                                    child: Text(
                                      'b) Construcción del muro de piedra (20 min)',
                                      style: TextStyle(
                                          color: Color(0xff7B3911),
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
                                          color: Color(0xff7B3911),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Muestra cómo son los muros de terrazas aledañas ya terminadas. Pide a los participantes que construyan el muro en los 2m previamente acondicionados.\n\n\n'
                                        '* El muro se construye sobre el canal de drenaje o cimientos apilando piedras. A cada hilada de piedra se agrega tierra húmeda y se compacta. El muro tiene unos 30 a 50 cm de grosor.\n\n'
                                        '* En caso de que el muro mida más de 2 m de alto se refuerza con cemento.\n\n'
                                        '* Las piedras grandes se acomodan primero, buscando superficies planas y poniendo cuidado en que los espacios libres se rellenen con piedras pequeñas y tierra.',
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
                                  child: Image.asset('ima/Terraza11.png'),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  '\nLos cimientos de las terrazas se construyen siguiendo las curvas a nivel. Para trazarlas correctamente se requiere usar un aparato A u otra herramienta de nivel.',
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
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 2),
                                  Flexible(
                                    child: Text(
                                      'c) Explicación de la medida (10 min)',
                                      style: TextStyle(
                                          color: Color(0xff7B3911),
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
                                          color: Color(0xff291B25),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Muestra en qué parte de la terraza se sitúa cada uno de los puntos críticos para que funcione adecuadamente.\n\n\n'
                                        'PUNTO CRÍTICO 1: Las terrazas se construyen siguiendo la curva a nivel del lugar. El trazado se puede realizar con un  aparato A o cualquier otro tipo de herramienta de nivel. El drenaje en la parte posterior de la terraza tiene un desnivel del 2% para evitar la anegación del suelo que sostiene el muro y que éste se derrumbe.\n\n'
                                        'PUNTO CRÍTICO 2: Los muros que sostienen las terrazas superiores deben ser estables, construidos de forma perpendicular a la pendiente para evitar derrumbes. Las piedras se acomodan de mayor a menor tamaño y se cimientan con tierra húmeda compactada.',
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
                                  width: 250, // Ancho deseado
                                  height: 120, // Alto deseado
                                  child: Image.asset('ima/Terraza12.png'),
                                ),
                                const SizedBox(height: 0.1),
                                const Text(
                                  '\nTerrazas agrícolas en Perú.\n',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  color: const Color(0xffF6F6E9),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 70,
                                        height: 70,
                                        child: Image.asset('ima/Terraza13.png'),
                                      ),
                                      const SizedBox(width: 10),
                                      const Expanded(
                                        child: Text(
                                          'Las terrazas requieren gran cantidad de mano de obra; se recomienda construirlas de forma comunitaria.Una actividad alternativa puede ser la de  razar curvas a nivel con ayuda del aparato A.',
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