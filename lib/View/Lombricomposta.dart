import 'package:flutter/material.dart';
import 'PagPrincipal.dart';
import 'Perfil.dart';
import 'Proyectos.dart';

class Lombricomposta extends StatefulWidget {
  const Lombricomposta({super.key});

  @override
  _LombricompostaState createState() =>
      _LombricompostaState();
}

class _LombricompostaState extends State<Lombricomposta> {
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
                      padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    ),
                    child:
                    const Text('Comienza ahora', style: TextStyle(fontSize: 18)),
                  ),
                ),
                Visibility(
                  visible: _mostrarInformacion,
                  child: Column(
                    children: [
                      const Icon(Icons.arrow_downward, size: 30, color: Color(0xff5B4F47)),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset('ima/ObjL.png'),
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
                            Text(
                              'a) Los elementos y actividades para generar lombricomposta\n',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'b) Los elementos y actividades para generar y aplicar fermento superamargo\n',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'c) Los beneficios de los abonos orgánicos',
                              style: TextStyle(fontSize: 18),
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
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'a) Estiércol de vaca como fuente de N (65kg)',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'b) Desechos de cosecha o paja como fuente de C(15kg)',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'c) Lombrices (1Kg)',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'd) Lombricomposta madura (15kg)',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'e) Palas y bieldos',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'f) Contenedor de 200L con trampa de agua',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'g) Ceniza (4kg)',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'h) Leche o suero (2L)',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'i) Melaza (2L)',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
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
                              child: Image.asset('ima/IntroL.png'),
                            ),
                            const SizedBox(width: 2),
                            const Flexible(
                              child: Text(
                                '1. Introducción a la medida (10 min)',
                                style: TextStyle(
                                    color: Color(0xff5B4F47),
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
                                    color: Color(0xff5B4F47),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '¿Qué sabe el grupo de la lombricomposta y sus beneficios?',
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
                          color: const Color(0xffDDC1A7),
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
                                    color: Color(0xff5B4F47),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'El humus de lombricomposta ayuda a:\n',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '* Mejorar los suelos devolviendo sus propiedades de absorción y retención de humedad.\n'
                                  '* Aumentar la productividad al fertilizar suelos y reducir costos al requerir menos insumos químicos.\n'
                                  '* Diversificar ingresos si la producción es para la venta. \n',
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
                              child: Image.asset('ima/Lombricomposta1.png'),
                            ),
                            const Text(
                              '\nLas camas de lombricomposta deben protegerse con un techo y tener forma de colectar los lixiviados. El tamaño de las camas se calcula conforme a la  cantidad de desechos orgánicos que se producen a la semana.',
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
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: 35,
                            height: 35,
                            child: Image.asset('ima/CapLombri.png'),
                          ),
                          const SizedBox(width: 2),
                          const Flexible(
                            child: Text(
                              'a) Siembra de lombrices (20 min)',
                              style: TextStyle(
                                  color: Color(0xff5B4F47),
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
                                'Actividad práctica\n',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff5B4F47),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Con ayuda de los participantes, empieza una mezcla para producir lombricomposta',
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
                          color: const Color(0xffDDC1A7),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 50.0),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '* Los ingredientes para empezar la lombricomposta son fuentes de nitrógeno (excremento o pulpa de café), fuentes de carbono (residuos de cosecha, paja u hojas de árboles) y lombricomposta ya madura. Los ingredientes se utilizan en partes iguales (15 kg en este caso)\n\n'
                                  '* Con ayuda de los participantes, coloca los tres ingredientes en la base de la lombricomposta y mézclalos con palas.\n\n'
                                  '* Por cada 50 kg de mezcla, aproximadamente agrega 1 kg de lombrices. La mezcla se humedece a prueba de puño.\n',
                              style: TextStyle(fontSize: 18),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 50.0),
                            ),
                          ],
                        ),
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
                        padding: const EdgeInsets.only(bottom: 15), // Espacio vertical entre el texto y la línea
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 35,
                              height: 35,
                              child: Image.asset('ima/TrabajadorL.png'), // Asegúrate de que la ruta de la imagen sea correcta
                            ),
                            const SizedBox(width: 2),
                            const Flexible(
                              child: Text(
                                '\nb) Otros abonos: Supermagro (20 min)',
                                style: TextStyle(
                                    color: Color(0xff5B4F47),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                textAlign: TextAlign.center, // Alinea el texto al centro
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
                                    color: Color(0xff5B4F47),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Con ayuda de los participantes, prepara una mezcla de supermagro en un contenedor de 200L\n\n\n'
                                  '* Disuelve 50kg de excretas de vaca y 4kg de ceniza o harina de roca en 100L de agua en el contenedor de 200L\n\n'
                                  '* Agrega 2L de suero o leche y 2L de melaza o  jugo de caña con agua y revuelve la mezcla.\n\n'
                                  '* Cierra herméticamente en contenedor e instala la trampa de gases. En pocos minutos se verán burbujas en la botella.\n\n'
                                  '* Explica que en 20 a 30 días la fermentación estará lista, en lugares fríos puede tardar entre 60 y 90',
                              style: TextStyle(fontSize: 18),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 20.0),
                            ),
                          ],
                        ),
                      ),
                      const Row(
                        children: [
                          SizedBox(width: 10), // Espacio entre la imagen y el texto
                          Expanded(
                            child: Text(
                              'El abono tendrá olor a fermentación y será de color ámbar translucido; si es de color azul violeta y huele a podrido hubo alguna fuga en el sistema hermético. Para aplicar, se diluyen 5 a 10L de fermento en 100L de agua. El biofertilizante debe estar muy bien filtrado antes de mezclar.',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: const Color(0xffDDC1A7), // Aquí estableces el color de fondo deseado
                        padding: const EdgeInsets.all(8), // Opcional, para añadir un poco de espacio alrededor
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'La producción de supermagro es un proceso anaerobio (sin aire). Se debe cerrar el contenedor herméticamente y sellar la trampa de gases con silicón.',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            const SizedBox(width: 16), // Espacio entre el texto y la imagen
                            SizedBox(
                              width: 170, // Ancho deseado
                              height: 170, // Alto deseado
                              child: Image.asset('ima/TanqL.png'), // Reemplaza con la ruta de tu imagen
                            ),
                          ],
                        ),
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
                        padding: const EdgeInsets.only(bottom: 15), // Espacio vertical entre el texto y la línea
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 35,
                              height: 35,
                              child: Image.asset('ima/ExplicaL.png'),                             ),
                            const SizedBox(width: 2),
                            const Flexible(
                              child: Text(
                                '\nc) Explicación de la medida (10 min)',
                                style: TextStyle(
                                    color: Color(0xff5B4F47),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                textAlign: TextAlign.center, // Alinea el texto al centro
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
                                    color: Color(0xff433831),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Muestra en qué parte del sistema se sitúa cada uno de los puntos críticos para que funcione adecuadamente\n\n\n'
                                  'PUNTO CRÍTICO 1: La capacidad de la lombricompostera depende de la cantidad de materia orgánica generada por la finca o la unidad familiar.\n\n'
                                  'PUNTO CRÍTICO 2: El proceso inicia con una pila de mezcla en un extremo de las dos camas de producción. Conforme se incorpora materia orgánica, la pila se va extendiendo a lo largo de la cama. De esta forma la lombricomposta que va madurando queda en el extremo inicial y la lombriz se desplaza al área con mezcla fresca. La composta madura se colecta después de unos 21 días.\n\n'
                                  'PUNTO CRÍTICO 3: Al humedecer la mezcla se generan lixiviados (líquidos que percolan a través de la mezcla). La fosa debe tener una cámara para colectar estos lixiviados, los Cuales pueden diluirse en agua y usarse como  fertilizante orgánico foliar',
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
                            child: Image.asset('ima/ImaL.png'),
                          ),
                          const SizedBox(height: 0.1),
                          const Text(
                            'Las camas se construyen con una leve pendiente para que los lixiviados fluyan al recipiente. Los lixiviados se diluyen en relación 1:20 y se aplican de forma foliar.',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            color: const Color(0xffDDC1A7),
                            padding: const EdgeInsets.all(8.0), // Añade un poco de relleno alrededor
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: Image.asset('ima/TipL.png'),
                                ),
                                const SizedBox(width: 10),
                                const Expanded(
                                  child: Text(
                                    'lombricomposta terminada debe guardarse en un lugar techado para su posterior venta o  aplicación. Se recomienda aplicar la lombricomposta antes de la siembra y durante el período de cultivo. Producir lombircomposta es  mucho más barato que comprarla.Una vez terminado el proceso de fermentación y abierto el contenedor, hay que utilizar el supermagro en pocos días para evitar que se descomponga. Se diluye al 10% y se aplica al suelo durante el periodo de crecimiento del cultivo.',
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