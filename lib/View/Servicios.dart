import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:proyecto1/View/PagPrincipal.dart';
import 'package:table_calendar/table_calendar.dart';
import 'DetalleReporte.dart';

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

class Evento {
  String id;
  String titulo;
  String descripcion;
  DateTime fecha;
  int hora;

  Evento({
    this.id = '',
    required this.titulo,
    required this.descripcion,
    required this.fecha,
    required this.hora,
  });

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'descripcion': descripcion,
      'fecha': fecha.toUtc().millisecondsSinceEpoch,
      'hora': hora,
    };
  }

  Future<void> saveToFirebase() async {
    final doc = id.isNotEmpty
        ? FirebaseFirestore.instance.collection('eventos').doc(id)
        : FirebaseFirestore.instance.collection('eventos').doc();
    await doc.set(toMap());
    id = doc.id;
  }

  Future<void> deleteFromFirebase() async {
    if (id.isNotEmpty) {
      final doc = FirebaseFirestore.instance.collection('eventos').doc(id);
      await doc.delete();
    }
  }

  Future<void> updateInFirebase() async {
    if (id.isNotEmpty) {
      final doc = FirebaseFirestore.instance.collection('eventos').doc(id);
      await doc.update(toMap());
    }
  }

  static Evento fromMap(Map<String, dynamic> map, String id) {
    if (map['hora'] == null) {
      throw Exception('El campo "hora" es nulo para el evento $id');
    }

    if (map['hora'] is! num) {
      throw Exception(
          'El campo "hora" debe ser un número para el evento $id, pero era ${map['hora']}');
    }

    if (map['titulo'] is! String ||
        map['descripcion'] is! String ||
        map['fecha'] is! int) {
      throw Exception(
          'Los campos "titulo", "descripcion" y "fecha" son obligatorios y deben ser de los tipos correctos');
    }

    return Evento(
      id: id,
      titulo: map['titulo'] as String,
      descripcion: map['descripcion'] as String,
      fecha: DateTime.fromMillisecondsSinceEpoch(map['fecha'] as int),
      hora: (map['hora'] as num).toInt(),
    );
  }
}

List<Evento> _selectedEventos = [];
ValueNotifier<List<Evento>> _selectedEventosNotifier = ValueNotifier([]);
ValueNotifier<CalendarFormat> _calendarFormat =
    ValueNotifier(CalendarFormat.month);

DateTime _selectedDay = DateTime.now();
// ignore: unused_element
DateTime _focusedDay = DateTime.now();
Map<DateTime, List<Evento>> _events = {
  DateTime.utc(2023, 10, 22): [
    Evento(
        titulo: 'Evento 1',
        descripcion: 'Descripción 1',
        fecha: DateTime.utc(2023, 10, 23),
        hora: 12 * 60,
        id: ''),
  ],
};

class Servicios extends StatelessWidget {
  const Servicios({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Servicios Ecológicos',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ServiciosScreen(),
    );
  }
}

class EventoIndicadorVisual extends StatelessWidget {
  final DateTime fecha;
  final List<Evento> eventos;

  const EventoIndicadorVisual(
      {Key? key, required this.fecha, required this.eventos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventosParaDia =
        eventos.where((evento) => isSameDay(evento.fecha, fecha)).toList();

    if (eventosParaDia.isNotEmpty) {
      return Positioned(
        bottom: 1,
        child: Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}

class ServiciosScreen extends StatefulWidget {
  const ServiciosScreen({super.key});

  @override
  _ServiciosScreenState createState() => _ServiciosScreenState();
}

class _ServiciosScreenState extends State<ServiciosScreen>
    with SingleTickerProviderStateMixin {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _verificarRol();
        loadEventsFromFirebase();
      }
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildEventMarker(DateTime date, List<Evento> eventos) {
    if (eventos.isEmpty) {
      return Container();
    }

    return Container(
      width: 16.0,
      height: 16.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      child: Center(
        child: Text(
          '${eventos.length}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TabController _tabController;
  bool esAdministrador = false;

  void _agregarEventoAMapa(
      Evento evento, Map<DateTime, List<Evento>> eventosMap) {
    final fecha =
        DateTime(evento.fecha.year, evento.fecha.month, evento.fecha.day);
    eventosMap[fecha] = (eventosMap[fecha] ?? [])..add(evento);
  }

  final List<Evento> _eventos = [];
  bool _isLoading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _loadData();
  }

  Future<void> _loadData() async {
    _verificarRol();
    try {
      await loadEventsFromFirebase();
      await _verificarRol();
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _verificarRol() async {
    String rol = await obtenerRolUsuario();
    if (mounted) {
      setState(() {
        esAdministrador = (rol == "Administrador");
      });
    }
  }

  void _handleTabSelection() {
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> loadEventsFromFirebase() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('eventos').get();
    final eventos = querySnapshot.docs
        .map((doc) => Evento.fromMap(doc.data(), doc.id))
        .toList();

    setState(() {
      _updateEvents(eventos);
      _verificarRol();
    });
  }

  void _updateEvents(List<Evento> eventos) {
    final Map<DateTime, List<Evento>> eventosMap = {};
    for (var evento in eventos) {
      _agregarEventoAMapa(evento, eventosMap);
    }

    if (mounted) {
      _events = eventosMap;
      _selectedEventos = eventos
          .where((evento) => isSameDay(evento.fecha, _selectedDay))
          .toList();
      _selectedEventosNotifier.value = _selectedEventos;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150.0),
          child: SafeArea(
            child: Container(
              height: 99,
              color: const Color(0xffd9d9d9),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const PagPrincipal()),
                          );
                        },
                      ),
                      const Text(
                        'Servicios',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 30),
                    ],
                  ),
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey[600],
                    indicatorColor: Colors.blue[400],
                    indicatorWeight: 5.0,
                    tabs: const [
                      Tab(text: 'Biblioteca Ecológica'),
                      Tab(text: 'Eventos'),
                      Tab(text: 'Reportar Incidentes'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: esAdministrador
            ? FloatingActionButton(
                onPressed: () {
                  Future.delayed(Duration.zero, () {
                    setState(() {
                      Navigator.of(context)
                          .push(
                        MaterialPageRoute(
                          builder: (context) => AddEventDialog(
                            onAdd: (evento) async {
                              await evento.saveToFirebase();
                              Navigator.of(context)
                                  .pop(); // Asegúrate de cerrar el diálogo después de guardar el evento.
                            },
                          ),
                        ),
                      )
                          .then((_) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted) {
                            setState(() {
                              // Aquí puedes recargar los eventos desde Firebase o tu fuente de datos.
                              // Por ejemplo, si tienes un método llamado loadEvents(), podrías llamarlo aquí.
                              // loadEvents();
                            });
                          }
                        });
                      });
                    });
                  });
                },
                child: const Icon(Icons.add),
              )
            : null,
        body: SafeArea(
          child: TabBarView(
            controller: _tabController,
            children: [
              buildBiblioteca(),
              if (_isLoading)
                const Center(child: CircularProgressIndicator())
              else
                _error.isNotEmpty
                    ? Center(child: Text('Error: $_error'))
                    : buildEventosTab(_eventos),
              buildReportarIncidentesTab(),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> obtenerRolUsuario() async {
    User? usuario = FirebaseAuth.instance.currentUser;

    if (usuario != null) {
      DocumentSnapshot usuarioDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(usuario.uid)
          .get();

      if (usuarioDoc.exists) {
        return usuarioDoc['rol'] ?? 'Usuario';
      } else {
        return 'Usuario';
      }
    } else {
      return 'Invitado';
    }
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  Future<void> mostrarDialogoCrearEditarEvento(
      BuildContext context, Evento evento) async {
    final tituloController = TextEditingController(text: evento.titulo);
    final descripcionController =
        TextEditingController(text: evento.descripcion);
    final int horas = evento.hora ~/ 60;
    final int minutos = evento.hora % 60;
    final TimeOfDay tiempo = TimeOfDay(hour: horas, minute: minutos);

    final horaController = TextEditingController(text: tiempo.format(context));

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(esAdministrador ? 'Editar Evento' : 'Ver Evento'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: tituloController,
                  decoration: const InputDecoration(labelText: 'Título'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa un título';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: descripcionController,
                  decoration: const InputDecoration(labelText: 'Descripción'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa una descripción';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: horaController,
                  decoration: const InputDecoration(labelText: 'Hora'),
                  readOnly: true,
                  onTap: () async {
                    TimeOfDay? selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay(hour: horas, minute: minutos),
                    );

                    if (selectedTime != null) {
                      horaController.text = selectedTime.format(context);
                      evento.hora =
                          selectedTime.hour * 60 + selectedTime.minute;
                    }
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            if (esAdministrador) ...[
              TextButton(
                onPressed: () async {
                  await evento.deleteFromFirebase();
                  await loadEventsFromFirebase();
                  Navigator.of(context).pop();
                },
                child: const Text('Eliminar'),
              ),
              TextButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    evento.titulo = tituloController.text;
                    evento.descripcion = descripcionController.text;
                    await evento.saveToFirebase();
                    await loadEventsFromFirebase();
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Guardar'),
              ),
            ],
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> eliminarEvento(Evento evento) async {
    await evento.deleteFromFirebase();
    setState(() {
      _events[evento.fecha]?.remove(evento);
    });
  }

  Widget buildEventosTab(List<Evento> eventos) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: TableCalendar<Evento>(
            firstDay: DateTime(2000),
            lastDay: DateTime(2100),
            focusedDay: DateTime.now(),
            calendarFormat: _calendarFormat.value,
            eventLoader: (day) => _getEventsForDay(day, eventos),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: _onDaySelected,
            onFormatChanged: (format) {
              if (_calendarFormat.value != format) {
                _calendarFormat.value = format;
              }
            },
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, _) {
                return _buildEventMarker(date, eventos);
              },
              selectedBuilder: (context, date, _) {
                return Container(
                  margin: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueGrey,
                  ),
                  child: Center(
                    child: Text(
                      '${date.day}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                );
              },
            ),
            headerStyle: HeaderStyle(
              formatButtonTextStyle: const TextStyle()
                  .copyWith(color: Colors.white, fontSize: 15.0),
              formatButtonDecoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: ValueListenableBuilder<List<Evento>>(
            valueListenable: _selectedEventosNotifier,
            builder: (context, value, _) {
              return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  final evento = value[index];
                  final hora = evento.hora ~/ 60;
                  final minutos = evento.hora % 60;
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        "${evento.titulo} - ${hora.toString().padLeft(2, '0')}:${minutos.toString().padLeft(2, '0')}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(evento.descripcion),
                      onTap: () {
                        mostrarDialogoCrearEditarEvento(context, evento);
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEventos = _events[selectedDay] ?? [];
        _verificarRol();
        loadEventsFromFirebase();
      });

      _selectedEventosNotifier.value = _selectedEventos;
    }
  }
}

List<Evento> _getEventsForDay(DateTime day, List<Evento> _eventos) {
  return _eventos.where((evento) => isSameDay(evento.fecha, day)).toList();
}

class AddEventDialog extends StatefulWidget {
  final Function(Evento) onAdd;

  const AddEventDialog({super.key, required this.onAdd});

  @override
  _AddEventDialogState createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  TimeOfDay _selectedTime = TimeOfDay.now();
  final _tituloController = TextEditingController();
  final _descripcionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  Future<void> _pickDate(BuildContext newContext) async {
    final date = await showDatePicker(
      context: newContext, // Utiliza el nuevo contexto aquí
      initialDate: _selectedDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (date != null && date != _selectedDate) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: const Text(
        'Añadir Evento',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _tituloController,
              decoration: const InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descripcionController,
              decoration: const InputDecoration(
                labelText: 'Descripción',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              maxLines: 3,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (newContext) {
                    return TextButton.icon(
                      icon: const Icon(Icons.calendar_today),
                      label: Text(
                          'Fecha: ${_selectedDate.toLocal()}'.split(' ')[0]),
                      onPressed: () => _pickDate(newContext),
                    );
                  },
                ),
                TextButton.icon(
                  icon: const Icon(Icons.access_time),
                  label: Text(_selectedTime.format(context)),
                  onPressed: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: _selectedTime,
                    );
                    if (time != null) {
                      setState(() {
                        _selectedTime = time;
                      });
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      actionsPadding: const EdgeInsets.all(8),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child:
              const Text('Cancelar', style: TextStyle(color: Colors.redAccent)),
        ),
        ElevatedButton(
          onPressed: () {
            if (_tituloController.text.isEmpty ||
                _descripcionController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Por favor, rellena todos los campos.')),
              );
              return;
            }
            final minutosDesdeMedianoche =
                _selectedTime.hour * 60 + _selectedTime.minute;
            final evento = Evento(
              titulo: _tituloController.text,
              descripcion: _descripcionController.text,
              fecha: _selectedDate,
              hora: minutosDesdeMedianoche,
            );
            widget.onAdd(evento);
            Navigator.of(context).pop();
          },
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}

Widget buildBiblioteca() {
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
              color: const Color(0xff0F2940),
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
        padding: const EdgeInsets.only(top: 50.0),
        child: Align(
          alignment: const Alignment(0, 0.3),
          child: SizedBox(
            height: 390.0,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.7),
              itemCount: recursos.length,
              itemBuilder: (context, index) {
                var recurso = recursos[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GalleryPage(
                            imageUrls:
                                recursos.map((e) => e.urlOrAsset).toList(),
                            initialIndex: index,
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          width: 250.0,
                          height: 350.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            image: DecorationImage(
                              image: AssetImage(recurso.urlOrAsset),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10.0,
                          left: 8.0,
                          child: Text(
                            recurso.categoria,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: categoriaColores[recurso.categoria] ??
                                  Colors.white, // Color según categoría
                            ),
                          ),
                        ),
                      ],
                    ),
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

Future<bool> esAdministrador() async {
  var usuarioId = FirebaseAuth.instance.currentUser?.uid;
  if (usuarioId == null) return false;

  var docSnapshot = await FirebaseFirestore.instance
      .collection('usuarios')
      .doc(usuarioId)
      .get();

  if (!docSnapshot.exists) return false;

  var userData = docSnapshot.data();
  return userData?['rol'] == 'administrador';
}

Future<void> cargarImagen() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    // Cargar a Firebase Storage y obtener URL
    // Guardar URL en Firestore
  }
}

class CategoriaPage extends StatelessWidget {
  final List<RecursoBiblioteca>
      recursos; // Asegúrate de que esta lista se pase al constructor

  const CategoriaPage({Key? key, required this.recursos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categoría'),
      ),
      body: GridView.builder(
        itemCount: recursos.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print("Imagen tocada: ${recursos[index].urlOrAsset}");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => GalleryPage(
                    imageUrls: recursos.map((e) => e.urlOrAsset).toList(),
                    initialIndex: index,
                  ),
                ),
              );
            },
            child: Image.network(recursos[index].urlOrAsset),
          );
        },
      ),
    );
  }
}

class GalleryPage extends StatelessWidget {
  final List<String> imageUrls;
  final int initialIndex;

  const GalleryPage({super.key, required this.imageUrls, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galería'),
      ),
      body: FutureBuilder<bool>(
        future: esAdministrador(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == true) {
              // User is an administrator
              return Stack(
                children: [
                  buildGalleryForGuests(imageUrls), // Widget for the Gallery
                  Positioned(
                    right: 10.0,
                    bottom: 10.0,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Logic for adding new content
                            cargarImagen();
                          },
                          child: const Text(
                            'Agregar Contenido',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 5,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection('tu_coleccion')
                                .doc('id_del_documento')
                                .delete();
                            FirebaseStorage.instance
                                .ref('path/del/archivo')
                                .delete();
                          },
                          child: const Text(
                            'Eliminar Contenido',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              // User is a guest
              return buildGalleryForGuests(imageUrls);
            }
          } else if (snapshot.hasError) {
            return const Text('Error al cargar datos');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

Widget buildGalleryForGuests(List<String> imageUrls) {
  return GridView.builder(
    itemCount: imageUrls.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    itemBuilder: (context, index) {
      return Image.network(imageUrls[index]); // Mostrar la imagen
    },
  );
}

//Envio de Reportes

class IncidenteReporte {
  String descripcion;
  DateTime fecha;
  double latitud;
  double longitud;

  IncidenteReporte({
    required this.descripcion,
    required this.fecha,
    required this.latitud,
    required this.longitud,
  });

  Map<String, dynamic> toMap() {
    return {
      'descripcion': descripcion,
      'fecha': fecha,
      'latitud': latitud,
      'longitud': longitud,
    };
  }
}

Future<void> guardarReporte(IncidenteReporte reporte) async {
  await FirebaseFirestore.instance.collection('reportes').add(reporte.toMap());
}

Widget buildReportarIncidentesTab() {
  final _controller = TextEditingController();
  const TextStyle labelStyle =
      TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold);
  final OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.blueGrey),
  );

  return FutureBuilder<String>(
    future: obtenerRolUsuario(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        List<Widget> children = [
          if (snapshot.data == 'Administrador')
            Expanded(child: _buildReportList()),
          Card(
            elevation: 4,
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Reportar un Incidente',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _controller,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Describe el incidente',
                      labelStyle: labelStyle,
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                      hintText: 'Escribe aquí...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () async {
                      if (_controller.text.isNotEmpty) {
                        double latitud = 37.7749;
                        double longitud = -122.4194;
                        DateTime fecha = DateTime.now();

                        IncidenteReporte reporte = IncidenteReporte(
                          descripcion: _controller.text,
                          fecha: fecha,
                          latitud: latitud,
                          longitud: longitud,
                        );

                        await guardarReporte(reporte);

                        // Limpia el campo de texto
                        _controller.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Reporte enviado con éxito',
                                  style: TextStyle(color: Colors.green))),
                        );
                      }
                    },
                    icon: const Icon(Icons.send),
                    label: const Text("Enviar Reporte"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xff072931),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: children),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
  );
}

Stream<List<IncidenteReporte>> obtenerReportesStream() {
  return FirebaseFirestore.instance
      .collection('reportes')
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) {
      return IncidenteReporte(
        descripcion: doc['descripcion'],
        fecha: (doc['fecha'] as Timestamp).toDate(),
        latitud: doc['latitud'],
        longitud: doc['longitud'],
      );
    }).toList();
  });
}

Widget _buildReportList() {
  return StreamBuilder<List<IncidenteReporte>>(
    stream: obtenerReportesStream(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return const Center(child: Text('No hay reportes disponibles'));
      }

      List<IncidenteReporte> reportes = snapshot.data!;

      return ListView.builder(
        itemCount: reportes.length,
        itemBuilder: (context, index) {
          IncidenteReporte reporte = reportes[index];
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              title: Text(reporte.descripcion,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Fecha: ${DateFormat('dd/MM/yyyy HH:mm').format(reporte.fecha)}'),
                  Text('Latitud: ${reporte.latitud}'),
                  Text('Longitud: ${reporte.longitud}'),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetalleReporteScreen(reporte: reporte),
                ));
              },
            ),
          );
        },
      );
    },
  );
}

Future<String> obtenerRolUsuario() async {
  User? usuario = FirebaseAuth.instance.currentUser;

  if (usuario != null) {
    DocumentSnapshot usuarioDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(usuario.uid)
        .get();

    if (usuarioDoc.exists) {
      return usuarioDoc['rol'] ?? 'Usuario';
    } else {
      return 'Usuario';
    }
  } else {
    return 'Invitado';
  }
}
