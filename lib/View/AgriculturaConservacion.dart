import 'package:flutter/material.dart';

import 'PagPrincipal.dart';
import 'Perfil.dart';
import 'Proyectos.dart';

class AgriculturaConservacion extends StatefulWidget {
  @override
  _AgriculturaConservacionState createState() =>
      _AgriculturaConservacionState();
}

class _AgriculturaConservacionState extends State<AgriculturaConservacion> {
  bool _mostrarInformacion = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffECF8E5),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35),
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
                      primary: Color(0xff5EC57E),
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
                      Icon(Icons.arrow_downward, size: 30, color: Color(0xff5EC57E)),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset('ima/Obj1.png'),
                      ),
                      Text(
                        'Objetivos de Aprendizaje',
                        style: TextStyle(
                            color: Color(0xff5EC57E),
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'a) Los elementos de agricultura de conservación\n',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'b) Los beneficios para el suelo y el agua',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset('ima/Mat1.png'),
                      ),
                      Text(
                        'Materiales',
                        style: TextStyle(
                            color: Color(0xff5EC57E),
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'a) Semillas u plántulas de abonos verdes y hortalizas',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'b) Abono organico',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'c) pacas para arrope',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'd) Herramientas',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'e) Manguera para riego',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset('ima/Idea1.png'),
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
                              '¿Qué sabe el grupo acerca de agricultura de conservación y sus beneficios?',
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
                          color: Color(0xffECF8E5),
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
                              'La agricultura de conservación\n',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '* Consiste en cubrir el suelo, no voltearlo y rotar cultivos\n'
                                  '* Evita pérdida de suelo y nutrientes\n'
                                  '* Mantiene la humedad del suelo\n'
                                  '* Es de bajo costo y aumenta la productividad con menos trabajo',
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
                              child: Image.asset('ima/Intro1.png'),
                            ),
                            Text(
                              '\nEl suelo se cubre con arrope para que haya mas materia orgánica y se mantenga la humedad del suelo.',
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
                          color: Color(0xff366A3F),
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
                            width: 35,
                            height: 35,
                            child: Image.asset('ima/Señor.png'),
                          ),
                          SizedBox(width: 2),
                          Flexible(
                            child: Text(
                              'a) Preparación del terreno y siembra (20 min)',
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
                              'Prepara el suelo y siembra con ayuda de los participantes mientras explicas los pasos de agricultura de conservación.',
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
                          color: Color(0xffECF8E5),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 50.0),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '* El terreno no se voltea; de ser necesario se puede descompostar los primeros centímetros haciendo surcos con ayuda de picos o arado de cincel.\n'
                                  '* El abono orgánico se aplica sobre el terreno.\n'
                                  '* Cubrir el 100% de la superficie del suelo con 5 a 10 cm de paja como arrope. También se pueden usar residuos de cosecha o abonos cerdes.\n'
                                  '* Aplicar la siembra directa de semillas o plántulas en hileras. Se pueden usar herramientas para siembra directa.\n'
                                  '* Regar las semillas o plántulas y el área de arrope cercana',
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
                              child: Image.asset('ima/Capacitacion.png'),
                            ),
                            Text(
                              '\nEl suelo no se voltea. Para descompostarlo se puede usar con arado de cincel.',
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
                          'b) Los abonos verdes y la rotación de cultivos (20 min)',
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
                              'Explica la rotación de cultivos mientras muestras una semilla o planta de abono verde.\n\n\n'
                                  '* La rotación de cultivos sirve para romper el ciclo de plagas y restaurar la fertilidad del suelo.\n\n'
                                  '* Los abonos verdes son plantas de ciclo corto (2 a 4 meses) que se siembran entre campa{as, se cortan y se dejan en el suelo como arrope.\n\n'
                                  '* Aumentan la fertilidad de terreno y lo protegen de la erosión.\n\n'
                                  '* También se pueden usar estos cultivos para la rotación, que no pidan los mismos nutrientes al suelo.',
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
                            padding: EdgeInsets.all(8.0), // Añade un poco de relleno alrededor
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
                      )

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

