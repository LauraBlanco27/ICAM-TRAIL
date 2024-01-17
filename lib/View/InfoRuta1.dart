import 'package:flutter/material.dart';
import 'InfoSendero1.dart';

class InfoPoint {
  final int id;
  final String title;
  final Offset position;
  final String description;
  final String imagePath;

  InfoPoint({
    required this.id,
    required this.position,
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

List<InfoPoint> infoPoints = [
  InfoPoint(
    id: 1,
    position: const Offset(510, 1200),
    title: "Peidra de la Perserverancia",
    description: "Esta piedra representa la base en la que fue construido el colegio ICAM",
    imagePath: 'ima/1013.png',
  ),
  InfoPoint(
    id: 2,
    position: const Offset(245, 220),
    title: "Título 2",
    description: "Descripción 2",
    imagePath: 'ima/1012.png',
  ),
  InfoPoint(
    id: 3,
    position: const Offset(600, 790),
    title: "Título 3",
    description: "Descripción 3",
    imagePath: 'ima/1016.png',
  ),
  InfoPoint(
    id: 4,
    position: const Offset(400, 720),
    title: "Título 4",
    description: "Descripción 4",
    imagePath: 'ima/1010.png',
  ),
  InfoPoint(
    id: 5,
    position: const Offset(630, 60),
    title: "Invernadero",
    description: "Punto 1",
    imagePath: 'ima/1019.png',
  ),
  InfoPoint(
    id: 6,
    position: const Offset(2800, 350),
    title: "Título ",
    description: "Descripción ",
    imagePath: 'ima/2.jpg',
  ),
  InfoPoint(
    id: 7,
    position: const Offset(430, 980),
    title: "Lombricultivo",
    description: 'El humus de lombricomposta ayuda a:\n\nMejorar los suelos devolviendo sus propiedades de'
    'absorción y retención de humedad.\n\nAumentar la productividad al fertilizar suelos y'
    'reducir costos al requerir menos insumos quimicos.',
    imagePath: 'ima/Lombricomposta.jpg',
  ),
  InfoPoint(
    id: 8,
    position: const Offset(380, 105),
    title: "Título 11",
    description: "Descripción 11",
    imagePath: 'ima/Silvopastoril.jpg',
  ),
  InfoPoint(
    id: 14,
    position: const Offset(450, 110),
    title: "Título 11",
    description: "Descripción 11",
    imagePath: 'ima/1001.png',
  ),
  InfoPoint(
    id: 9,
    position: const Offset(390, 935),
    title: "Título 9",
    description: "Descripción 9",
    imagePath: 'ima/1018.png',
  ),
  InfoPoint(
    id: 10,
    position: const Offset(320, 650),
    title: "Título 15",
    description: "Descripción 15",
    imagePath: 'ima/1007.png',
  ),
  InfoPoint(
    id: 11,
    position: const Offset(500, 930),
    title: "Título inv",
    description: "Descripción inv",
    imagePath: 'ima/Inverndero.jpg',
  ),
  InfoPoint(
    id: 12,
    position: const Offset(415, 1100),
    title: "Título bomba",
    description: "Descripción bomba",
    imagePath: 'ima/Terraza.jpg',
  ),
  InfoPoint(
    id: 13,
    position: const Offset(310, 430),
    title: "Título Api",
    description: "Descripción Api",
    imagePath: 'ima/Apiii.png',
  ),
  InfoPoint(
    id: 15,
    position: const Offset(540, 880),
    title: "Deshidratador Solar",
    description: "Deshidratador Solar",
    imagePath: 'ima/1017.png',
  ),
];

class InteractiveMap extends StatefulWidget {
  const InteractiveMap({super.key});

  @override
  _InteractiveMapState createState() => _InteractiveMapState();
}

class _InteractiveMapState extends State<InteractiveMap>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  get relativeY => null;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double mapWidth = screenSize.width;
    final double mapHeight = screenSize.height * 0.3;

    Widget mapImage = Positioned.fill(
      child: Image.asset(
        'ima/MapSendero1.jpg',
        width: mapWidth,
        height: mapHeight,
        fit: BoxFit.cover,
      ),
    );

    List<Widget> pointWidgets = infoPoints.map((point) {
      final double relativeX = (point.position.dx / 1000) * mapWidth;
      final double relativeY = (point.position.dy / 1000) * mapHeight;

      return Positioned(
        left: relativeX,
        top: relativeY,
        child: GestureDetector(
          onTap: () => _showPointDialog(context, point),
          child: Icon(Icons.location_on, color: Colors.red[900]),
        ),
      );
    }).toList();

    return SizedBox(
      width: mapWidth,
      height: mapHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          mapImage,
          ...pointWidgets,
        ],
      ),
    );
  }
}

void _showPointDialog(BuildContext context, InfoPoint point) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      double dialogWidth = 420.0; // Ancho del diálogo
      double dialogHeight = 450.0; // Altura del diálogo

      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: dialogWidth,
          height: dialogHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), // Bordes redondeados
          ),
          child: Stack(
            children: <Widget>[
              // Imagen
              ClipRRect( // ClipRRect para aplicar el borderRadius a la imagen
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  point.imagePath,
                  width: dialogWidth, // Ancho de la imagen igual al del diálogo
                  height: dialogHeight, // Altura de la imagen igual a la del diálogo
                  fit: BoxFit.cover,
                ),
              ),
              // Contenido superpuesto
              Positioned(
                bottom: 0,
                child: Container(
                  width: dialogWidth,
                  color: Colors.black.withOpacity(0),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        point.title,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0),
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        point.title,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Botón de cerrar
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 30, // Ancho del rectángulo
                  height: 30, // Altura del rectángulo
                  margin: EdgeInsets.all(8), // Margen para separar el contenedor de los bordes
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5), // Color de fondo con opacidad
                    borderRadius: BorderRadius.circular(8), // Bordes redondeados
                  ),
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                    padding: EdgeInsets.zero, // Eliminar cualquier padding interno
                    constraints: BoxConstraints(), // Restricciones mínimas para el botón
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class InfoRuta1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd9d9d9),
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Sendero1()),
            );
          },
        ),
        centerTitle: true,
        title: Text(
          'Información del Recorrido',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: screenHeight * 0.06,
            child: Center(
              child: Text(
                'Recorrido Completo',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            height: 370,
            width: screenWidth,
            child: InteractiveMap(),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Perfil del Recorrido',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff224C55),
                      ),
                    ),
                    SizedBox(height: 10),
                    InteractiveImage(
                      imagePath: 'ima/graficoR1.png',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: screenWidth,
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                StatisticCard(
                  iconData: Icons.directions_walk,
                  title: 'Distancia aprox.',
                  value: '1.50 km',
                  unit: 'Caminar al aire libre',
                ),
                StatisticCard(
                  iconData: Icons.timer,
                  title: 'Duración aprox.',
                  value: '1h 30min',
                ),
                StatisticCard(
                  iconData: Icons.local_fire_department,
                  title: 'Calorías aprox',
                  value: '75 kcal',
                ),
                StatisticCard(
                  iconData: Icons.terrain,
                  title: 'Desnivel',
                  value: '300m',
                ),
                StatisticCard(
                  iconData: Icons.filter_hdr,
                  title: 'Altitud Mínima',
                  value: '2556 m s. n. m.',
                ),
                StatisticCard(
                  iconData: Icons.filter_hdr,
                  title: 'Altitud Máxima',
                  value: '2650 m s. n. m.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InteractiveImage extends StatefulWidget {
  final String imagePath;
  InteractiveImage({required this.imagePath});

  @override
  _InteractiveImageState createState() => _InteractiveImageState();
}

class _InteractiveImageState extends State<InteractiveImage> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 1.1;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: Transform.scale(
        scale: _scale,
        child: Image.asset(widget.imagePath),
      ),
    );
  }
}

class StatisticCard extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String value;
  final String? unit;

  const StatisticCard({
    Key? key,
    required this.iconData,
    required this.title,
    required this.value,
    this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(iconData, color: Color(0xff224C55)),
                SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              value,
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            if (unit != null) Text(unit!),
          ],
        ),
      ),
    );
  }
}
