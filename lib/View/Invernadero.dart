import 'package:flutter/material.dart';

import 'Proyectos.dart';

class Invernadero extends StatelessWidget {

  void _showDialog(BuildContext context, String titleText, String contentText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titleText, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          contentPadding: EdgeInsets.all(20),
          content: Container(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Text(
                contentText,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cerrar"),
            )
          ],
        );
      },
    );
  }

  Widget _buildImageCard(BuildContext context, String imagePath, String title, String content) {
    return GestureDetector(
      onTap: () => _showDialog(context, title, content),
      child: Image.asset(
        imagePath,
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: Container(
          height: 40,
          color: Color(0xffd9d9d9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Proyectos()),
                  );
                },
              ),
              Spacer(),
              Text(
                'Invernadero',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              // Agrega otros elementos de la AppBar si es necesario
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 380,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("ima/Invernadero.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            top: 380 - 110,
            bottom: 40,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight, // Alinea el widget en la esquina superior derecha
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.blue[900], // Color de fondo del rectángulo (azul petróleo)
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2), // Color de la sombra
                              spreadRadius: 2, // Radio de expansión de la sombra
                              blurRadius: 4, // Radio de desenfoque de la sombra
                              offset: Offset(0, 2), // Desplazamiento de la sombra
                            ),
                          ],
                        ),
                        child: Text(
                          "Introducción",
                          style: TextStyle(
                            fontSize: 18, // Tamaño del texto del título
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Color del texto
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black, // Color del texto
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Objetivos de aprendizaje:\n\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18, // Tamaño del texto del título
                            ),
                          ),
                          TextSpan(
                            text: 'a) La forma correcta de colocar el plástico de invernadero\n'
                                'b) Los beneficios de la medida\n'
                                'c) El manejo de plagas dentro del invernadero\n\n',
                          ),
                          TextSpan(
                            text: 'Materiales:\n\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18, // Tamaño del texto del título
                            ),
                          ),
                          TextSpan(
                            text: 'a) Plástico de invernadero\n'
                                'b) Alambre zigzag\n'
                                'c) Perfil sujetador\n'
                                'd) Plástico amarillo y azul (1.5 m2 c/u)\n'
                                'e) Melaza\n'
                                'f) Estacas\n'
                                'g) Brocha\n'
                                'h) Clavos\n'
                                'i) Martillo\n\n',
                          ),
                          TextSpan(
                            text: "Ronda participativa de intercambio de conocimiento \n\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18, // Tamaño del texto del título
                            ),
                          ),
                          TextSpan(
                            text: "Qué sabe el grupo acerca de los invernaderos y sus beneficios?\n\n",
                          ),
                          TextSpan(
                            text: "Mensajes clave a transmitir \n\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18, // Tamaño del texto del título
                            ),
                          ),
                          TextSpan(
                            text: "Los invernaderos ayudan a:\n\n"
                                "Aumentar rendimientos al producir en ambientes controlados."
                                "Proteger a los cultivos de lluvias y vientos fuertes.\n\n",
                          ),
                          TextSpan(
                            text: "Capacitación \n\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18, // Tamaño del texto del título
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildImageCard(
                              context,
                              "ima/Cap1.png",
                              "Colocación y amarre del plástico (20 min)",
                              "Actividad Práctica\n\n"
                                  "Con ayuda de los participantes, utiliza perfiles y alambres zigzag para explicar la"
                                  "forma de colocar y amarrar el plástico.\n\n"
                                  "- Extender el plástico a lo largo de la estructura del"
                                  "invernadero. Evitar rasgarlo o perforarlo.\n"
                                  "- Mostrar el perfil sujetador que ya debe estar"
                                  "instalado en la estructura.\n"
                                  "- Introducir el plástico en el perfil sujetador seguido"
                                  "del alambre zigzag. El alambre se introduce"
                                  "moviéndolo de arriba abajo.\n"
                                  "- Tensar el plástico evitando que queden burbujas o"
                                  "espacios distendidos.\n"
                                  "- Los excedentes de plástico se cortan con una tijera."
                          ),
                          SizedBox(width: 12),
                          _buildImageCard(
                              context,
                              "ima/Cap1.png",
                              "Colocación y amarre del plástico (20 min)",
                              "Actividad Práctica\n\n"
                                  "Con ayuda de los participantes, utiliza perfiles y alambres zigzag para explicar la"
                                  "forma de colocar y amarrar el plástico.\n\n"
                                  "- Extender el plástico a lo largo de la estructura del"
                                  "invernadero. Evitar rasgarlo o perforarlo.\n"
                                  "- Mostrar el perfil sujetador que ya debe estar"
                                  "instalado en la estructura.\n"
                                  "- Introducir el plástico en el perfil sujetador seguido"
                                  "del alambre zigzag. El alambre se introduce"
                                  "moviéndolo de arriba abajo.\n"
                                  "- Tensar el plástico evitando que queden burbujas o"
                                  "espacios distendidos.\n"
                                  "- Los excedentes de plástico se cortan con una tijera."
                          ),
                          SizedBox(width: 12),

                          _buildImageCard(
                              context,
                              "ima/Cap2.png",
                                "Manejo de plagas en invernadero (20 min)\n\n","Actividad Práctica"
                                "Construye trampas contra plagas comunes con ayuda de los participantes.\n\n"
                                "- Las trampas azules se usan para atrapar trips y las trampas amarillas para pulgón, mosca blanca, mosca de la fruta, mosca minador y palomillas. Las trampas blancas atraen a los ácaros."
                                "Las trampas de colores ayudan a controlar ciertas plagas. Hay que limpiarlas regularmente y"
                                "volver a aplicar melaza o aceite para que sigan funcionando.\n"
                                "- Cortar un plástico amarillo y uno azul de aproximadamente 50 cm x 40 cm.\n"
                                "- Fijar el plástico con clavos o chinches en dos estacas de forma a que quede bien extendido y clavar las estacas en el suelo.\n"
                                "- Se pueden hacer hoyos o cortes en el plástico para evitar los vientos fuertes lo maltraten\n"
                                "- Impregnar la melaza en el plástico para que quede pegajoso y las plagas queden atrapadas.\n"
                                "- Colocar una trampa amarilla y una azul a un metro de la"
                                "estructura y por afuera en cada lado del invernadero."
                            ),
                          SizedBox(width: 12),

                          _buildImageCard(
                          context,
                          "ima/Cap3.png",
                                "Explicación de la medida (10 min)",
                                "Actividad Didáctica\n\n"
                                "Muestra en qué parte del sistema se sitúa cada"
                                "uno de los puntos críticos para que funcione adecuadamente.\n\n"
                                "PUNTO CRÍTICO 1:El invernadero normalmente se orienta de norte a sur con respecto a su lado más angosto, donde"
                                "generalmente se sitúa la entrada. Esto para aprovechar al máximo la luz solar. También se deben tomar en cuenta los"
                                "vientos dominantes para que no dañen la estructura.\n\n"
                                "PUNTO CRÍTICO 2: El tensado del plástico o la malla antiáfidos se hace con perfil sujetador y alambre zigzag"
                                "para evitar perforarlo y que se desgarre con el vientoo con el paso del tiempo. Las partes bajas del material cobertor"
                                "se entierran para evitar cualquier paso de aire o plagas.\n\n"
                                "PUNTO CRÍTICO 3: El manejo eficiente de agua, suelo, nutrientes y plagas es fundamental para una producción"
                                "sustentable en invernaderos. El uso de abonos orgánicos, riego eficiente y trampas para plagas ayuda a aumentar la productividad."
                            ),
                          SizedBox(width: 12),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                  ],
                ),
                padding: EdgeInsets.only(left: 25, right: 25, top: 37),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Nuevo contenedor en la parte inferior
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 40,
              color: Color(0xff072931),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home, color: Color(0xffd9d9d9)),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Color(0xffd9d9d9)),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.person, color: Color(0xffd9d9d9)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}