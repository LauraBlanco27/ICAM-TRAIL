import 'package:flutter/material.dart';

import 'PagPrincipal.dart';
import 'Perfil.dart';
import 'Proyectos.dart';

class Apicultura extends StatefulWidget {
  @override
  _ApiculturaState createState() =>
      _ApiculturaState();
}

class _ApiculturaState extends State<Apicultura> {
  bool _mostrarInformacion = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: Color(0xffd9d9d9),
          toolbarHeight: screenHeight * 0.05,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(color: Colors.black, Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => Proyectos()),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35),
                  child: Text(
                    'APICULTURA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff34571A),

                    ),
                  ),
                ),
                Image.asset('ima/Api60.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _mostrarInformacion = !_mostrarInformacion;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff4C7031),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                      EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    ),
                    child:
                    Text('Comienza ahora', style: TextStyle(fontSize: 18)),
                  ),
                ),
                Visibility(
                  visible: _mostrarInformacion,
                  child: Column(
                    children: [
                      Icon(Icons.arrow_downward, size: 30, color: Color(0xff4C7031)),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xff889F78),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                'ima/ApiLog.png',
                                width: 120,
                                height: 120,
                              ),
                            ),
                            Text(
                              'Objetivos de Aprendizaje',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'a) Armado y partes de una colmena\n',
                                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                                  ),
                                  Text(
                                    'b) Los materiales y equipos necesarios para criar abejas',
                                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset(
                                'ima/ApiMat.png',
                                width: 120,
                                height: 120,
                              ),
                            ),
                            Text(
                              'Materiales',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'a) Colmenas de madera con abejas, una de ellas desarmada',
                                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                                  ),
                                  Text(
                                    'b) Equipo de protección e instrumentos',
                                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Color(0xffDDBC74),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                'ima/ApiIdea.png',
                                width: 100,
                                height: 100,
                              ),
                            ),
                            Text(
                              '1. Introducción a la medida (10 min)',
                              style: TextStyle(
                                  color: Color(0xff347571),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.all(20.0),
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 100.0),
                                    child: Text(
                                      'Ronda participativa de intercambio de conocimiento\n',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff347571),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '¿Qué sabe el grupo acerca de la apicultura y sus beneficios?',
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
                              padding: EdgeInsets.all(20.0),
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Color(0xffDDBC74),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 50.0),
                                    child: Text(
                                      'Mensajes clave a transmitir\n',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff347571),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'La apicultura permite:\n',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    '* Polinizar cultivos y flora silvestre (aumentar productividad).\n'
                                    '* Diversificar ingresos con producción de miel, cera, propóleo, polen y jalea real.',

                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 50.0),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20.0),
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 50.0),
                                    child: Image.asset('ima/ApiCaja.png'),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'La producción apícola se hace en colmenas. Las colmenas deben situarse en lugares abiertos, cerca de agua y zonas de cultivo o con flora silveste.\n',
                                    textAlign: TextAlign.center,
                                    style:
                                    TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 50.0),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Color(0xff889F78),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Center(
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
                                  SizedBox(height: 0.5),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10.0),
                                  ),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset('ima/Panal.png'),
                                ),
                                SizedBox(width: 2),
                                Flexible(
                                  child: Text(
                                    'a) La colmena (20 min)',
                                    style: TextStyle(
                                        color: Color(0xff347571),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    textAlign:
                                    TextAlign.center, // Alinea el texto al centro
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.all(20.0),
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 100.0),
                                    child: Text(
                                      'Actividad práctica\n',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff347571),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Arma una colmena explicando sus componentes y la función de cada uno.',
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
                              padding: EdgeInsets.all(20.0),
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Color(0xffDDBC74),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 50.0),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '* Soporte o catre: eleva del piso las colmenas, evita acumulación de humedad.\n'
                                        '* Tabla de vuelo: base que provee una plataforma para el ingreso o salida de las abejas a la colmena.\n'
                                        '* Cámara de cría o cuerpo: es una cámara que contiene cadres móviles o cuadros en donde las abejas construyen panales para criar más abejas.\n'
                                        '* Cadres: marcos en donde las abejas construyen sus panales para crías o miel.\n'
                                        '* Rejilla excluidora: evita el paso de la abeja reina a la cámara de cría cuando se cultiva jalea real o se reproducen reinas.\n'
                                        '* Cámaras o alzas melarias: cajones de la colmena que contienen cadres para producir miel. Son entre 1y3 cajones por colmena.\n'
                                        '* Entretapa: controla la ventilación y temperatura de la colmena, normalmente tienen un cierre corredizo para regular estos dos factores.\n'
                                        '* Techo: cubre la colmena, impide que el agua de luvia entre a los cajones; es removible.',
                                      style: TextStyle(fontSize: 18),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 50.0),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20.0),
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 50.0),
                                    child: Image.asset('ima/ApiCol.png'),
                                  ),
                                  Text(
                                    '\nLa colmena es desarmable; por ejemplo, se quita la tapa y entretapa rociando humo a la colmena para llegar a la alza melaria y cultivar la miel.',
                                    textAlign: TextAlign.center,
                                    style:
                                    TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 50.0),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade700, // Color de la línea
                                    width: 2.0, // Grosor de la línea
                                  ),
                                ),
                              ),
                              padding: EdgeInsets.only(
                                  bottom:
                                  15), // Espacio vertical entre el texto y la línea
                              child: Text(
                                'b) El equipo (20 min)',
                                style: TextStyle(
                                  color: Color(0xff347571),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20.0),
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: Text(
                                      'Actividad práctica\n',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff347571),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Viste a un voluntario con el equipo protector.\n\n\n'
                                        '* Muestra y explica el equipo: traje (pantalón blanco blusa blanca), y botas, sombrero con red protectora, guantes.\n\n'
                                        '* Presenta el ahumador, explica su uso y ponlo a funcionar.',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 20.0),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 170, // Ancho deseado
                                  height: 170, // Alto deseado
                                  child: Image.asset('ima/Siembra.png'), // Reemplaza con la ruta de tu imagen
                                ),
                                SizedBox(width: 10), // Espacio entre la imagen y el texto
                                Expanded(
                                  child: Text(
                                    'Hay herramientas específicas para la siembra directa, como esta hoyadora en la que la semilla se pone en un lado y el abono en el otro.',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Al cubrir el suelo y no voltearlo se va formando una capa nueva de suelo fértil',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                SizedBox(width: 16), // Espacio entre el texto y la imagen
                                Container(
                                  width: 170, // Ancho deseado
                                  height: 170, // Alto deseado
                                  child: Image.asset('ima/Siembra2.png'), // Reemplaza con la ruta de tu imagen
                                ),
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
                              padding: EdgeInsets.only(
                                  bottom:
                                  15), // Espacio vertical entre el texto y la línea
                              child: Text(
                                'c) Explicación de la medida (10 min)',
                                style: TextStyle(
                                  color: Color(0xff347571),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20.0),
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: Text(
                                      'Actividad didáctica\n',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff347571),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Muestra en qué parte del sistema se sitúa cada uno de los puntos críticos para que funcione correctamente.\n\n\n'
                                        'PUNTO CRÍTICO 1: La cobertura del terreno evita que las lluvias o vientos erisionen el suelo y se pierdan sus nutrientes. La materia orgánica actúa como una esponja que retiene la humedad en el suelo por más tiempo.\n\n'
                                        'PUNTO CRÍTICO 2: Al aplicar la siembra directa, sin voltear el suelo, se evita exponer el suelo al arire. Esto hace que se mantenga la riqueza biológica y química que ayuda al desarrollo de los cultivos. Se evita la erosión, se conservan los nutrientes y se mantiene la vida del suelo.\n\n'
                                        'PUNTO CRÍTICO 3: La rotación de cultivos rompe el ciclo de plagas y malezas. Cuando se rota con abonos verdes o leguminosas se obtiene el beneficio adicional de fijar nitógeno al suelo que después estará disponible para el cultivo. El efecto en el largo plazo de la combinación de estos tres puntos es un suelo más fértil y rico en materia orgánica.',
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
                                Container(
                                  width: 200, // Ancho deseado
                                  height: 170, // Alto deseado
                                  child: Image.asset('ima/imaC.png'),
                                ),
                                SizedBox(height: 0.1),
                                Text(
                                  'Los residuos de cosecha son un excelente arrope. Es importante dejarlos en el suelo y nunca quemarlos.',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  color: Color(0xffE4DDDD),
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 70,
                                        height: 70,
                                        child: Image.asset('ima/Tip.png'),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          'La agricultura de conservación no necesita de gastos adicionales. Al contrario, con menos trabajo y menos insumos químicos se pueden obtener mejores rendimientos. Pero necesita un cambio de mentalidad al pensar en el sistema productivo de forma integral. Los resultados de este sistema se empiezan a notar después de unas cuantas campañas.',
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
          color: Color(0xff072931),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Color(0xffd9d9d9)),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => PagPrincipal()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.search, color: Color(0xffd9d9d9)),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.person, color: Color(0xffd9d9d9)),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Perfil()),
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