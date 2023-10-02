import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:image_viewer/image_viewer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'PagPrincipal.dart';

class IncidenteReporte {
  String descripcion;
  DateTime fecha;
  double latitud;
  double longitud;

  IncidenteReporte(
      {required this.descripcion,
      required this.fecha,
      required this.latitud,
      required this.longitud});
}

class RecursoBiblioteca {
  final String tipo;
  final String titulo;
  final String descripcion;
  final String urlOrAsset;
  final String categoria;

  RecursoBiblioteca({
    required this.tipo,
    required this.titulo,
    required this.descripcion,
    required this.urlOrAsset,
    required this.categoria,
  });
}

List<RecursoBiblioteca> recursos = [
  RecursoBiblioteca(
      tipo: 'imagen',
      titulo: 'Flora',
      descripcion: 'Descripción de flora',
      urlOrAsset: 'ima/Flora.jpg',
      categoria: 'flora'),
  RecursoBiblioteca(
      tipo: 'imagen',
      titulo: 'Fauna',
      descripcion: 'Descripción de fauna',
      urlOrAsset: 'ima/Fauna.jpg',
      categoria: 'fauna'),
  RecursoBiblioteca(
      tipo: 'imagen',
      titulo: 'Proyectos Educativos',
      descripcion: 'Descripción de proyectos educativos',
      urlOrAsset: 'ima/ProyectosEco.jpg',
      categoria: 'proyectos educativos'),
];

class Servicios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Servicios Ecológicos',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ServiciosScreen(),
    );
  }
}

class ServiciosScreen extends StatefulWidget {
  @override
  _ServiciosScreenState createState() => _ServiciosScreenState();
}

class _ServiciosScreenState extends State<ServiciosScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ValueNotifier<CalendarFormat> _calendarFormat =
      ValueNotifier(CalendarFormat.month);

  Map<DateTime, List> _events = {
    DateTime.now(): ['Evento A', 'Evento B'],
    DateTime.now().add(Duration(days: 3)): ['Evento C'],
  };
  List _selectedEvents = [];

  final ValueNotifier<List> _selectedEventsNotifier = ValueNotifier([]);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.0),
          child: Container(
            height: 91,
            color: Color(0xffd9d9d9),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_new),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => PagPrincipal()),
                        );
                      },
                    ),
                    Text(
                      'Servicios',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 30),
                  ],
                ),
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[600],
                  indicatorColor: Colors.blue[400],
                  indicatorWeight: 5.0,
                  tabs: [
                    Tab(text: 'Biblioteca Ecológica'),
                    Tab(text: 'Eventos'),
                    Tab(text: 'Reportar Incidentes'),
                  ],
                )
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            controller: _tabController,
            children: [
              buildBiblioteca(),
              buildEventosTab(),
              buildReportarIncidentesTab(),
            ],
          ),
        ),
      ),
    );
  }

  void mostrarGaleria(BuildContext context, int initialIndex) {
    final List<String> imageList = recursos.map((e) => e.urlOrAsset).toList();

    ImageViewer.showImageSlider(
      images: imageList,
      startingPosition: initialIndex,
    );
  }

  Widget buildBiblioteca() {
    // Mapa de colores para las categorías
    Map<String, Color> categoriaColores = {
      'flora': Colors.black,
      'fauna': Colors.black,
      'proyectos educativos': Colors.black,
    };

    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Color(0xff0F2940),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Align(
            alignment: Alignment(0, 0.3),
            child: SizedBox(
              height: 400.0,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.7),
                itemCount: recursos.length,
                itemBuilder: (context, index) {
                  var recurso = recursos[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            mostrarGaleria(context, index);
                          },
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            width: 250.0,
                            height: 370.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              image: DecorationImage(
                                image: NetworkImage(recurso.urlOrAsset),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5.0,
                          left: 8.0,
                          child: Text(
                            recurso.titulo,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: categoriaColores[recurso.categoria] ??
                                  Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildEventosTab() {
    return Column(
      children: [
        TableCalendar(
          eventLoader: (day) {
            return _events[day] ?? [];
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedEvents = _events[selectedDay] ?? [];
              _selectedEventsNotifier.value = _selectedEvents;
            });
          },
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(2020, 10, 16),
          lastDay: DateTime.utc(2101, 10, 16),
          calendarFormat: _calendarFormat.value,
          availableCalendarFormats: const {
            CalendarFormat.month: 'Month',
            CalendarFormat.week: 'Week',
          },
          onFormatChanged: (format) {
            if (_calendarFormat.value != format) {
              // Call `setState()` when updating calendar format
              setState(() {
                _calendarFormat.value = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            // No need to call `setState()` here
            _calendarFormat.value = focusedDay as CalendarFormat;
          },
        ),
        Expanded(
          child: ValueListenableBuilder<List>(
              valueListenable: _selectedEventsNotifier,
              builder: (context, value, _) {
                return ListView(
                  children: value
                      .map((event) => ListTile(title: Text(event.toString())))
                      .toList(),
                );
              }),
        ),
      ],
    );
  }

  Widget buildReportarIncidentesTab() {
    final _controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            maxLines: 5,
            decoration: InputDecoration(
                labelText: 'Describe el incidente',
                border: OutlineInputBorder(),
                hintText: 'Escribe aquí...'),
          ),
          SizedBox(height: 20),
          IntrinsicWidth(
            child: ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("Enviar Reporte"),
                  ),
                ],
              ),
              onPressed: () async {
                if (_controller.text.isNotEmpty) {
                  Location location = new Location();
                  bool _serviceEnabled;
                  PermissionStatus _permissionGranted;
                  LocationData _locationData;

                  _serviceEnabled = await location.serviceEnabled();
                  if (!_serviceEnabled) {
                    _serviceEnabled = await location.requestService();
                    if (!_serviceEnabled) {
                      return;
                    }
                  }

                  _permissionGranted = await location.hasPermission();
                  if (_permissionGranted == PermissionStatus.denied) {
                    _permissionGranted = await location.requestPermission();
                    if (_permissionGranted != PermissionStatus.granted) {
                      return;
                    }
                  }

                  _locationData = await location.getLocation();
                  final reporte = IncidenteReporte(
                      descripcion: _controller.text,
                      fecha: DateTime.now(),
                      latitud: _locationData.latitude!,
                      longitud: _locationData.longitude!);

                  // Aquí puedes manejar el envío del reporte a una base de datos o API
                  print(
                      'Descripcion: ${reporte.descripcion}, Latitud: ${reporte.latitud}, Longitud: ${reporte.longitud}');

                  // Limpiar el campo después de enviar
                  _controller.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GaleriaScreen extends StatelessWidget {
  final int initialIndex;

  GaleriaScreen({required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoViewGallery.builder(
        itemCount: recursos.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(recursos[index].urlOrAsset),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        scrollPhysics: BouncingScrollPhysics(),
        backgroundDecoration: BoxDecoration(
          color: Colors.black,
        ),
        pageController: PageController(initialPage: initialIndex),
      ),
    );
  }
}
