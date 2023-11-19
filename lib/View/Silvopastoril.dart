import 'package:flutter/material.dart';
import 'PagPrincipal.dart';
import 'Perfil.dart';
import 'Proyectos.dart';

class Silvopastoril extends StatefulWidget {
  const Silvopastoril({super.key});

  @override
  _SilvopastorilState createState() =>
      _SilvopastorilState();
}

class _SilvopastorilState extends State<Silvopastoril> {
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
                          'ima/Pastoril1.png',
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
                          'ima/Pastoril2.png',
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
                          'ima/Pastoril3.png',
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
                    'SISTEMA SILVOPASTORIL',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff291B25),

                    ),
                  ),
                ),
                Image.asset('ima/Pastoril4.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _mostrarInformacion = !_mostrarInformacion;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff291B25),
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
                      const Icon(Icons.arrow_downward, size: 30, color: Color(0xff291B25)),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xff61A6AB),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                'ima/Pastoril5.png',
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
                                    'a)  Los beneficios de la medida\n',
                                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                                  ),
                                  Text(
                                    'b) Los componentes de un sistema silvopastoril\n',
                                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                                  ),
                                  Text(
                                    'c) Cómo trasplantar plantas de vivero para establecer o mejorar un sistema',
                                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset(
                                'ima/Pastoril6.png',
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
                                    'a) Un sistema silvopastoril instalado ',
                                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                                  ),
                                  Text(
                                    'b) Plantas de vivero aptas para ser usadas en un sistema silvopastoril (maderables, forrajeras o frutales)',
                                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                                  ),
                                  Text(
                                    'c) Herramientas (pala, ahoyadora)',
                                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: const Color(0xff61A6AB),
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
                                    child: Image.asset('ima/Pastoril7.png'),
                                  ),
                                  const SizedBox(width: 2),
                                  const Flexible(
                                    child: Text(
                                      '1. Introducción a la medida (10 min)',
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
                                    padding: EdgeInsets.only(top: 100.0),
                                    child: Text(
                                      'Ronda participativa de intercambio de conocimiento\n',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff2291b25),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '¿Qué sabe el grupo acerca del sistema silvopastoril y sus beneficios?',
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
                                color: const Color(0xff61A6AB),
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
                                    'El sistema silvopastoril ayuda a: \n',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    '* Mejorar la disponibilidad y calidad de alimentos para el ganado.\n'
                                        '* Recuperar suelos erosionados y fortalecer los ciclos locales de agua, conservando la diversidad biológica.\n'
                                        '* Diversificar la producción al obtener madera, leña, forraje y frutas, y con ello aumentar ingresos.\n'
                                        '* Generar un microclima que protege al sistema productivo de eventos climáticos extremos.',

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
                                    child: Image.asset('ima/Pastoril8.png'),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '\nEn el sistema silvopastoril cada elemento aporta al desarrollo del otro: los árboles dan forraje y sombra; los animales dan abono para pastos y árboles.',
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
                                color: const Color(0xff291B25),
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
                                  child: Image.asset('ima/Pastoril9.png'),
                                ),
                                const SizedBox(width: 2),
                                const Flexible(
                                  child: Text(
                                    'a) Elementos del sistema y funciones (20 min)',
                                    style: TextStyle(
                                        color: Color(0xffFFFFFF),
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
                                    'Invita a los participantes a hacer un recorrido por un sistema silvopastoril instalado y pide que te ayuden a explicar la función de cada elemento.',
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
                                color: const Color(0xff61A6AB),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 50.0),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '* Suelo: ofrece nutrientes y humedad para que crezcan árboles y pastos. Hay que cuidar que no se compacte.\n'
                                        '* Pastos: pueden ser naturales o mejorados. Es importante calcular la capacidad de carga del sistema y rotar los potreros para no agotar los pastos y causar erosión por el pisoteo.\n'
                                        '* Arboles: pueden usarse distintos tipos (maderables, frutales, forrajeros). Proveen sombra, alimentan al ganado, mantienen humedad, previenen erosión y regeneran suelo.\n'
                                        '* Ganado: provee nutrientes para las plantas, es el motor económico del sistema.\n'
                                        '* Plan de manejo: al controlar los periodos de pastoreo y descanso evita la degradación de las pasturas y aumenta la cobertura vegetal y materia orgánica en el suelo.\n'
                                        '* Cercas: pueden ser cercas vivas (con árboles) o muertas (con postes) usando alambre de púas o electrificado. Sirven para delimitar los potreros y permitir la regeneración natural de pastos y plantas',
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
                                    child: Image.asset('ima/Pastoril10.png'),
                                  ),
                                  const Text(
                                    '\nLa sombra permite un mayor pastoreo. El ganado puede alimentarse con forrajes en distintas alturas in situ o en establos con alimento producido con podas del sistema. Por ello es importante la  diversidad en los forrajes',
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
                                    width: 35,
                                    height: 35,
                                    child: Image.asset('ima/Pastoril9.png'),
                                  ),
                                  const SizedBox(width: 2),
                                  const Flexible(
                                    child: Text(
                                      'b) Estratos y cultivos asociados (20 min)',
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
                                          color: Color(0xff291B25),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Con ayuda de los participantes realiza el trasplante de plantas de vivero para establecer o mejorar un sistema silvopastoril.\n\n\n'
                                        '* Selecciona plantas sanas de 30 cm de alto o más, que no tengan daños en raíces o tallos y tengan el follaje en buen estado\n\n'
                                        '* La distribución de los árboles depende del tipo de sistema (p.ej. árboles dispersos, cercas vivas, pastura en callejones).\n\n'
                                        '* Limpia al menos 1 m alrededor del área donde irá cada planta.\n\n'
                                        '* Excava hoyos de 15 a 20 centímetros de ancho, un poco más profundos que la altura de la bolsa de la planta.',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 20.0),
                                  ),
                                ],
                              ),
                            ),
                            const Column(
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  '\n\n* Coloca tierra fértil y luego la planta sin bolsa. Asegúrate que quede recta, al centro del hoyo y no demasiado enterrada\n\n'
                                  '* Rellena los espacios vacíos alrededor de la planta, con tierra fértil o humus de composta\n\n'
                                  '* Arropa la planta con paja, rastrojo o cascarilla de arroz\n\n'
                                  '* Si ya hay ganado en el sistema protege las plantas colocando alambre o madera a su alrededor ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 50),
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
                                          color: Color(0xff291B25),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Muestra en qué parte del sistema silvopastoril se sitúa cada uno de los puntos críticos para que funcione adecuadamente.\n\n\n'
                                        'PUNTO CRÍTICO 1: El manejo de sombra es importante para aumentar la eficiencia del sistema. La sombra se maneja con podas y raleo. Dependiendo si el enfoque principal es forestal o ganadero se utilizan más o menos árboles.\n\n'
                                        'PUNTO CRÍTICO 2: La diversificación de los árboles con frutales y otros productos cíclicos ayuda a tener un flujo constante de ingresos en lo que las especies forestales o el ganado crecen.\n\n'
                                        'PUNTO CRÍTICO 3: Para un adecuado manejo se recomienda iniciar el pastoreo con vacunos, cuando los árboles tienen una altura mayor a los 2m. Es importante controlar malezas para facilitar el crecimiento de pastos y árboles ',
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
                                  child: Image.asset('ima/Pastoril12.png'),
                                ),
                                const SizedBox(height: 0.1),
                                const Text(
                                  'Los sistemas silvopastoriles aprovechan de manera eficiente los distintos estratos productivos. Las cercas vivas pueden tener uno o más estratos.',
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
                                        child: Image.asset('ima/Pastoril13.png'),
                                      ),
                                      const SizedBox(width: 10),
                                      const Expanded(
                                        child: Text(
                                          'Las cercas vivas pueden también servir como barreras rompevientos, evitando la erosión del suelo en terrenos con poca cobertura vegetal. Las cercas vivas son una buena forma de motivar el cambio inicial hacia un sistema silvopastoril y una ganadería más sostenible.',
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