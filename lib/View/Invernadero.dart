import 'package:flutter/material.dart';
import 'PagPrincipal.dart';
import 'Perfil.dart';
import 'Proyectos.dart';

class Invernadero extends StatefulWidget {
  const Invernadero({super.key});

  @override
  _InvernaderoState createState() =>
      _InvernaderoState();
}

class _InvernaderoState extends State<Invernadero> {
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
                      const Icon(Icons.arrow_downward, size: 30, color: Color(0xff7D9B76)),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xffF6F6E9),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                'ima/Invernadero5.png',
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
                              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'a)  La forma correcta de colocar el plástico de invernadero  \n',
                                    style: TextStyle(color: Color(0xff272727), fontSize: 16),
                                  ),
                                  Text(
                                    'b) Los beneficios a la medida \n',
                                    style: TextStyle(color: Color(0xff272727), fontSize: 16),
                                  ),
                                  Text(
                                    'c) El manejo de plagas dentro del invernadero',
                                    style: TextStyle(color: Color(0xff272727), fontSize: 16),
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
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'a) Plástico de invernadero',
                                    style: TextStyle(color: Color(0xff272727), fontSize: 16),
                                  ),
                                  Text(
                                    'b) Alambre zigzag',
                                    style: TextStyle(color: Color(0xff272727), fontSize: 16),
                                  ),
                                  Text(
                                    'c) Perfil sujetador',
                                    style: TextStyle(color: Color(0xff272727), fontSize: 16),
                                  ),
                                  Text(
                                    'd) Plástico amarillo y azul (1.5 m2 c/u) ',
                                    style: TextStyle(color: Color(0xff272727), fontSize: 16),
                                  ),
                                  Text(
                                    'e) Melaza',
                                    style: TextStyle(color: Color(0xff272727), fontSize: 16),
                                  ),
                                  Text(
                                    'f) Estacas',
                                    style: TextStyle(color: Color(0xff272727), fontSize: 16),
                                  ),
                                  Text(
                                    'g) Brocha ',
                                    style: TextStyle(color: Color(0xff272727), fontSize: 16),
                                  ),
                                  Text(
                                    'h) Clavos',
                                    style: TextStyle(color: Color(0xff272727), fontSize: 16),
                                  ),
                                  Text(
                                    'h) Martillo',
                                    style: TextStyle(color: Color(0xff272727), fontSize: 16),
                                  ),
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
                                    child: Image.asset('ima/Invernadero7.png'),
                                  ),
                                  const SizedBox(width: 2),
                                  const Flexible(
                                    child: Text(
                                      '1. Introducción a la medida (10 min)',
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
                                          color: Color(0xff272727),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '¿Qué sabe el grupo de los invernaderos y sus beneficios?',
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
                                color: const Color(0xff8AA883),
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
                                    'Los invernaderos ayudan a: \n',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    '* Aumentar rendimientos al producir en ambientes controlados.\n\n'
                                        '* Proteger los cultivos de lluvias y vientos fuertes. ',

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
                                    child: Image.asset('ima/Invernadero8.png'),
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
                            Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset('ima/Invernadero9.png'),
                                ),
                                const SizedBox(width: 0),
                                const Flexible(
                                  child: Text(
                                    'a) Colocación y amarre de plástico (20 min)',
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
                                          color: Color(0xff272727),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Con ayuda de los participantes, utiliza perfiles y alambres zigzag para explicar la forma de colocar y amarrar el plástico',
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
                                color: const Color(0xff8AA883),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 50.0),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '* Extender el plástico a lo largo de la estructura del invernadero. Evitar rasgarlo o perforarlo.\n\n'
                                        '* Mostrar el perfil sujetador que ya debe estar instalado en la estructura.\n\n'
                                        '* Introducir el plástico en el perfil sujetador seguido del alambre zigzag. El alambre se introduce moviéndolo de arriba abajo.\n\n'
                                        '* Tensar el plástico evitando que queden burbujas o espacios distendidos.\n\n'
                                        '* Los excedentes de plástico se cortan con una tijera. ',
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
                                    child: Image.asset('ima/Invernadero10.png'),
                                  ),
                                  const Text(
                                    '\nEl perfil sujetador y el alambre zigzag ayudan a tensar el plástico sin perforarlo. Esto alarga la vida del material y lo mantiene en buen funcionamiento ',
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
                                    child: Image.asset('ima/Invernadero11.png'),
                                  ),
                                  const SizedBox(width: 2),
                                  const Flexible(
                                    child: Text(
                                      'b) Explicación de la medida (10 min)',
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
                                          color: Color(0xff272727),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Construye trampas contra plagas comunes con ayuda de los participantes \n\n\n'
                                        '* Las trampas azules se usan para atrapar trips y las trampas amarillas para pulgón, mosca blanca de la fruta, mosca minador y palomillas. Las trampas blancas atraen ácaros.\n\n'
                                        '* Cortar un plástico amarillo y uno azul de aproximadamente 50cm x 40cm \n\n'
                                        '* Fijar el plástico con clavos o chinches en dos estacas de forma a que quede bien extendido y clavar las estacas en el suelo.\n\n'
                                        '* Se pueden hacer hoyos o cortes en plástico para evitar que los vientos fuertes los maltraten. ',
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
                                const SizedBox(height: 10),
                                const Text(
                                  '\n* Impregnar la melaza en el plástico para que quede pegajoso y las plagas queden atrapadas.\n\n'
                                  '* Colocar una trampa amarilla y una azul a un metro de la estructura y por fuera en cada lado del invernadero. ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 130,
                                      height: 130,
                                      child: Image.asset('ima/Invernadero12.png'),
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
                                    child: Image.asset('ima/Invernadero13.png'),
                                  ),
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
                                    'Muestra en qué parte del sistema se sitúa cada uno de los puntos críticos para que funcione adecuadamente.\n\n\n'
                                        'PUNTO CRÍTICO 1: El invernadero normalmente se orienta de norte a sur con respecto a su lado más angosto, donde generalmente se sitúa la entrada. Esto para aprovechar al máximo la luz solar. También se deben tomar en cuenta los vientos dominantes para que no dañe la estructura.\n\n'
                                        'PUNTO CRÍTICO 2: El tensado del plástico o la malla antiáfidos se hace con perfil sujetador y alambre zigzag para evitar perforarlo y que se desgarre con el viento o con el paso del tiempo. Las partes bajas del material cobertor se entierran para evitar cualquier paso de aire o plagas. \n\n'
                                        'PUNTO CRÍTICO 3: El manejo eficiente de agua, suelo, nutrientes y plagas es fundamental para una producción sustentable en invernaderos. El uso de abonos orgánicos, riego eficiente y trampas para plagas ayuda a aumentar la productividad.',
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
                                  child: Image.asset('ima/Invernadero14.png'),
                                ),
                                const SizedBox(height: 0.1),
                                const Text(
                                  '\nEl manejo de agua, suelo, nutrientes y plagas dentro del invernadero es esencial para una producción sustentable .\n',
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
                                        child: Image.asset('ima/Invernadero15.png'),
                                      ),
                                      const SizedBox(width: 10),
                                      const Expanded(
                                        child: Text(
                                          'Se recomienda poner con malla antiáfidos para regular la temperatura del invernadero sin que se exponga el cultivo a plagas. Para controlar las plagas en el invernadero, además de las trampas, se pueden usar plantas repelentes y pesticidas naturales a base de ajo, ají y otras hierbas que repelen insectos.',
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