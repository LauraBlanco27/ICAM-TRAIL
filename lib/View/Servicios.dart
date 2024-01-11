import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:proyecto1/View/PagPrincipal.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Model/Biblioteca.dart';
import '../Model/Evento.dart';
import '../Model/Reportes.dart';
import 'DetalleReporte.dart';
import 'FaunaScreen.dart';
import 'FloraScreen.dart';
import 'ProyectosEducativosScreen.dart';

List<RecursoBiblioteca> recursos = [
  RecursoBiblioteca(
      tipo: 'imagen',
      titulo: 'Flora',
      descripcion: 'Descripción de flora',
      urlOrAsset: 'ima/Flora.png',
      categoria: 'flora'),
  RecursoBiblioteca(
      tipo: 'imagen',
      titulo: 'Fauna',
      descripcion: 'Descripción de fauna',
      urlOrAsset: 'ima/Fauna.png',
      categoria: 'fauna'),
  RecursoBiblioteca(
      tipo: 'imagen',
      titulo: 'Proyectos Educativos',
      descripcion: 'Descripción de proyectos educativos',
      urlOrAsset: 'ima/ProyectosEco.png',
      categoria: 'proyectos educativos'),
];

List<Evento> _selectedEventos = [];
ValueNotifier<List<Evento>> _selectedEventosNotifier = ValueNotifier([]);
ValueNotifier<CalendarFormat> _calendarFormat =
    ValueNotifier(CalendarFormat.month);

DateTime _selectedDay = DateTime.now();
// ignore: unused_element
DateTime _focusedDay = DateTime.now();
Map<DateTime, List<Evento>> _events = {
  DateTime.utc(2023, 10, 22): [],
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

  const EventoIndicadorVisual({
    Key? key,
    required this.fecha,
    required this.eventos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventosParaDia = eventos
        .where((evento) =>
            DateFormat('yyyy-MM-dd').format(evento.fecha) ==
            DateFormat('yyyy-MM-dd').format(fecha))
        .toList();

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
    loadEventsFromFirebase();
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

    if (mounted) {
      setState(() {
        _updateEvents(eventos);
      });
    }
  }

  Widget _buildEventMarker(DateTime date, List<Evento> eventos) {
    var eventosDelDia =
        eventos.where((evento) => isSameDay(evento.fecha, date)).toList();

    if (eventosDelDia.isNotEmpty) {
      return Positioned(
        right: 1,
        top:
            1, // Cambia 'bottom' a 'top' para que se posicione debajo del número del día.
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green, // Puedes cambiar el color aquí.
          ),
          width: 16, // Tamaño del marcador
          height: 16, // Tamaño del marcador
          child: Center(
            child: Text(
              '${eventosDelDia.length}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12, // Tamaño del texto dentro del marcador
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
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
    setState(() {
      _events = eventosMap;
    });
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
            eventLoader: (day) => _getEventsForDay(day, _eventos),
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: _onDaySelected,
            onFormatChanged: (format) {
              if (_calendarFormat.value != format) {
                _calendarFormat.value = format;
              }
            },
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                return _buildEventMarker(date, events);
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
    'flora': Colors.white,
    'fauna': Colors.white,
    'proyectos educativos': Colors.white,
  };

  void handleButtonPress(BuildContext context, String categoria) {
    switch (categoria) {
      case 'flora':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FloraScreen()),
        );
        break;
      case 'fauna':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FaunaScreen()),
        );
        break;
      case 'proyectos educativos':
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ProyectosEducativosScreen()),
        );
        break;
      default:
    }
  }

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
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () =>
                        handleButtonPress(context, recurso.categoria),
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
                          bottom: 5.0,
                          left: 5.0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: Colors.black
                                  .withOpacity(0.5), // Fondo semi-transparente
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text(
                              recurso.categoria,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: categoriaColores[recurso.categoria] ??
                                    Colors.white,
                                shadows: [
                                  Shadow(
                                    // Sombra para el texto
                                    offset: const Offset(1.0, 1.0),
                                    blurRadius: 3.0,
                                    color: Colors.black.withOpacity(0.75),
                                  ),
                                ],
                              ),
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

//Envio de Reportes

Future<void> guardarReporte(String descripcion, BuildContext context) async {
  try {
    // Verificar y solicitar permisos de ubicación
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Sugerir activar servicios de ubicación
      mostrarDialogoServiciosUbicacion(context);
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Informar al usuario sobre la denegación de permisos
        mostrarDialogoPermisoDenegado(context);
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Sugerir ajustes de permisos permanentemente denegados
      mostrarDialogoPermisoDenegadoPermanentemente(context);
      return;
    }

    // Obtener la posición actual
    Position position = await Geolocator.getCurrentPosition();

    // Crear y guardar el reporte
    IncidenteReporte reporte = IncidenteReporte(
      descripcion: descripcion,
      fecha: DateTime.now(),
      latitud: position.latitude,
      longitud: position.longitude,
      id: '',
    );
    await FirebaseFirestore.instance.collection('reportes').add(reporte.toMap());

    // Enviar notificaciones a los administradores
    var adminTokens = await _obtenerAdminTokens();
    for (var token in adminTokens) {
      await _enviarNotificacion(token, descripcion);
    }

  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error al guardar el reporte: $e')),
    );
  }
}

Future<void> verificarYSolicitarPermisosUbicacion(BuildContext context) async {
  bool servicioHabilitado = await Geolocator.isLocationServiceEnabled();
  if (!servicioHabilitado) {
    // Mostrar diálogo sugiriendo activar los servicios de ubicación
    mostrarDialogoServiciosUbicacion(context);
    return;
  }

  LocationPermission permiso = await Geolocator.checkPermission();
  if (permiso == LocationPermission.denied) {
    permiso = await Geolocator.requestPermission();
    if (permiso == LocationPermission.denied) {
      // Mostrar diálogo informando que los permisos fueron denegados
      mostrarDialogoPermisoDenegado(context);
      return;
    }
  }

  if (permiso == LocationPermission.deniedForever) {
    // Mostrar diálogo para permisos denegados permanentemente
    mostrarDialogoPermisoDenegadoPermanentemente(context);
    return;
  }

  // Si los permisos están otorgados, proceder a obtener la ubicación
  obtenerYEnviarReporte(context);
}

Future<void> obtenerYEnviarReporte(BuildContext context) async {
  try {
    Position posicion = await Geolocator.getCurrentPosition();
    // Continuar con el envío del reporte...
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error al obtener la ubicación: $e')),
    );
  }
}

void mostrarDialogoServiciosUbicacion(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Servicios de Ubicación Desactivados'),
        content: const Text('Por favor, activa los servicios de ubicación para continuar.'),
        actions: <Widget>[
          TextButton(
            child: const Text('Aceptar'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}

void mostrarDialogoPermisoDenegado(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Permiso de Ubicación Denegado'),
        content: const Text('El permiso para acceder a la ubicación fue denegado. Por favor, permite el acceso a la ubicación en los ajustes de tu dispositivo para utilizar esta función.'),
        actions: <Widget>[
          TextButton(
            child: const Text('Aceptar'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}

void mostrarDialogoPermisoDenegadoPermanentemente(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Permiso de Ubicación Denegado Permanentemente'),
        content: const Text('El acceso a la ubicación ha sido denegado permanentemente. Por favor, ve a los ajustes de tu dispositivo para cambiar esta configuración.'),
        actions: <Widget>[
          TextButton(
            child: const Text('Aceptar'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}

Future<List<String>> _obtenerAdminTokens() async {
  try {
    var snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('rol', isEqualTo: 'Administrador')
        .get();

    List<String> tokens = [];
    for (var doc in snapshot.docs) {
      var token = doc.data()['token'];
      if (token != null && token.isNotEmpty) {
        tokens.add(token);
        print("Token obtenido: $token");
      }
    }
    if (tokens.isEmpty) {
      print("No se encontraron tokens de administrador");
    }
    return tokens;
  } catch (e) {
    print("Error al obtener tokens de administrador: $e");
    return [];
  }
}

Future<void> _enviarNotificacion(String token, String descripcion) async {
  try {
    var fcmUrl = 'https://fcm.googleapis.com/fcm/send';
    var serverKey = 'AAAANoE2tt4:APA91bHAz9bb5xyKlDEz8VF47T0fs9_ZJ3LUU3-DLddt9KIZfMj0MjlmqSg8N_vI3pvGCaVQR_L2CU6hKuTfHDf7e0ET784UcoP0tNtIekBHsCTHhidjRo1x8fKfefeU4CFPY5FWerw3'; // Reemplaza con tu clave de servidor real

    var header = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    };

    var notificacion = {
      'to': token,
      'notification': {
        'title': 'Nuevo Reporte',
        'body': descripcion,
      },
    };

    var response = await http.post(
      Uri.parse(fcmUrl),
      headers: header,
      body: json.encode(notificacion),
    );

    if (response.statusCode == 200) {
      print("Notificación enviada correctamente a $token");
    } else {
      print("Error al enviar la notificación: Código de estado ${response.statusCode}, Respuesta: ${response.body}");
    }
  } catch (e) {
    print("Excepción al enviar la notificación: $e");
  }
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
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      bool esAdministrador = snapshot.data == 'Administrador';
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (esAdministrador) _buildReportList(context, esAdministrador),
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
                          await verificarYSolicitarPermisosUbicacion(context);
                          Position position =
                              await Geolocator.getCurrentPosition();
                          IncidenteReporte reporte = IncidenteReporte(
                            descripcion: _controller.text,
                            fecha: DateTime.now(),
                            latitud: position.latitude,
                            longitud: position.longitude,
                            id: '',
                          );
                          await guardarReporte(reporte.descripcion, context);
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
          ],
        ),
      );
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
        id: doc.id,
        descripcion: doc['descripcion'],
        fecha: (doc['fecha'] as Timestamp).toDate(),
        latitud: doc['latitud'],
        longitud: doc['longitud'],
      );
    }).toList();
  });
}

Widget _buildReportList(BuildContext context, bool esAdministrador) {
  return Expanded(
    child: StreamBuilder<List<IncidenteReporte>>(
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
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              elevation: 4,
              shadowColor: Colors.blueGrey.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.blueGrey.withOpacity(0.2)),
              ),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                title: Text(
                  reporte.descripcion,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.blueGrey[800],
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Fecha: ${DateFormat('dd/MM/yyyy HH:mm').format(reporte.fecha)}',
                          style: TextStyle(color: Colors.blueGrey[600])),
                      Text('Latitud: ${reporte.latitud.toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.blueGrey[600])),
                      Text('Longitud: ${reporte.longitud.toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.blueGrey[600])),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        DetalleReporteScreen(reporte: reporte),
                  ));
                },
                trailing: esAdministrador && reporte.id != null
                    ? IconButton(
                        icon:
                            Icon(Icons.delete_forever, color: Colors.red[800]),
                        onPressed: () =>
                            _confirmarYEliminarReporte(context, reporte.id!),
                      )
                    : null,
              ),
            );
          },
        );
      },
    ),
  );
}

Widget mostrarBotonEliminar(BuildContext context, String? reporteId) {
  if (reporteId == null) {
    return const SizedBox.shrink();
  }

  return FutureBuilder<String>(
    future: obtenerRolUsuario(),
    builder: (context, snapshot) {
      if (snapshot.data == 'Administrador') {
        return IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            _confirmarYEliminarReporte(context, reporteId);
          },
        );
      }
      return const SizedBox.shrink();
    },
  );
}

Future<void> _confirmarYEliminarReporte(
    BuildContext context, String reporteId) async {
  bool confirmado = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmar Eliminación'),
        content:
            const Text('¿Estás seguro de que deseas eliminar este reporte?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          TextButton(
            child: const Text('Eliminar'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      );
    },
  );

  if (confirmado) {
    await _eliminarReporte(reporteId);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reporte eliminado con éxito')),
    );
  }
}

Future<void> _eliminarReporte(String reporteId) async {
  try {
    await FirebaseFirestore.instance
        .collection('reportes')
        .doc(reporteId)
        .delete();
  } catch (e) {
    ScaffoldMessenger.of(context as BuildContext).showSnackBar(
      SnackBar(content: Text('Error al eliminar reporte: ${e.toString()}')),
    );
  }
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
