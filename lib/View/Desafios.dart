import 'package:flutter/material.dart';
import 'package:proyecto1/View/PagPrincipal.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import 'Perfil.dart';

class ProyectoEducativo {
  final String nombre;
  ProyectoEducativo({required this.nombre});
}

class Tesoro {
  final String pista;
  final List<String> opciones;
  final String nombreElemento;
  final String respuestaCorrecta;
  bool encontrado;

  Tesoro({
    required this.pista,
    required this.opciones,
    required this.nombreElemento,
    required this.respuestaCorrecta,
    this.encontrado = false
  });
}

class Usuario {
  int puntos = 0;
}

class Desafios extends StatelessWidget {
  const Desafios({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafíos Sendero Ecológico',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const DesafiosScreen(),
    );
  }
}

class DesafiosScreen extends StatefulWidget {
  const DesafiosScreen({super.key});

  @override
  _DesafiosScreenState createState() => _DesafiosScreenState();
}

class _DesafiosScreenState extends State<DesafiosScreen> {
  late List<ProyectoEducativo> proyectos;
  late List<String> seleccionesUsuario = [];
  late List<Tesoro> tesoros;
  Usuario usuario = Usuario();

  get correctCount => null;
  get valorDeseado => null;

  @override
  void initState() {
    super.initState();
    // Primero inicializa la lista de proyectos
    proyectos = [
      ProyectoEducativo(nombre: "Huerto Familiar"),
      ProyectoEducativo(nombre: "Siembra y Cosecha"),
      ProyectoEducativo(nombre: "Lombricomposta"),
      ProyectoEducativo(nombre: "Conservación Atmosférica"),
      ProyectoEducativo(nombre: "Riego Eficiente"),
    ];
    // Después de inicializarla, puedes mezclarla
    proyectos.shuffle();

    // Inicialización de tesoros
    tesoros = [
      Tesoro(
        pista: "Es un lugar donde las plantas crecen y encerradas en calor y los pajaros cantan",
        opciones: ["Lombricomposta", "Invernadero", "Huerto Familiar"],
        respuestaCorrecta: "Invernadero", nombreElemento: '',
      ),
      Tesoro(
        pista: "",
        opciones: ["Compostaje", "Reciclaje", "Incineración"],
        respuestaCorrecta: "Compostaje", nombreElemento: '',
      ),
      Tesoro(
        pista: "Tercera Pista: Un sistema de cultivo que no utiliza productos químicos",
        opciones: ["Agricultura de conservación", "Agricultura orgánica", "Hidroponía"],
        respuestaCorrecta: "Agricultura orgánica", nombreElemento: '',
      ),
      Tesoro(
        pista: "Cuarta Pista: Un método de riego que reduce la pérdida de agua",
        opciones: ["Riego por aspersión", "Riego por goteo", "Riego por inundación"],
        respuestaCorrecta: "Riego por goteo", nombreElemento: '',
      ),
      Tesoro(
        pista: "Quinta Pista: Un hábitat para muchas especies, cruciales para la biodiversidad",
        opciones: ["Bosque", "Desierto", "Ciudad"],
        respuestaCorrecta: "Bosque", nombreElemento: '',
      ),
      // Agrega más tesoros aquí con sus opciones y respuestas...
    ];
  }

  bool esProyectoCorrecto(String nombreProyecto) {
    List<String> nombresCorrectos = [
      "Huerto Familiar",
      "Riego Eficiente",
      "Lombricomposta"
    ];
    return nombresCorrectos.contains(nombreProyecto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafíos', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xffd9d9d9),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => PagPrincipal()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Desafíos disponibles",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                _buildDesafioCard(
                  context,
                  'Selecciona los proyectos que encontraste dentro del sendero ecológico',
                  Icons.nature_people,
                      () => mostrarDesafioSeleccion(context),
                ),
                _buildDesafioCard(
                  context,
                  'Desafío de Búsqueda del Tesoro',
                  Icons.search,
                      () => mostrarDesafioTesoro(context),
                ),
                // Puedes agregar más tarjetas para otros desafíos aquí
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildDesafioCard(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Theme.of(context).primaryColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        onTap: onTap,
      ),
    );
  }

  void mostrarDesafioTesoro(BuildContext context) {
    int indiceActual = tesoros.indexWhere((tesoro) => !tesoro.encontrado);
    if (indiceActual != -1) {
      Tesoro tesoroActual = tesoros[indiceActual];
      String seleccionUsuario = ''; // Variable para guardar la selección del usuario

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Pista del Tesoro'),
            content: StatefulBuilder(
              builder: (context, setStateDialog) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(tesoroActual.pista),
                    ...tesoroActual.opciones.map((opcion) => RadioListTile<String>(
                      title: Text(opcion),
                      value: opcion,
                      groupValue: seleccionUsuario,
                      onChanged: (valor) {
                        setStateDialog(() {
                          seleccionUsuario = valor!;
                        });
                      },
                    )),
                  ],
                );
              },
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Responder'),
                onPressed: () {
                  if (seleccionUsuario == tesoroActual.respuestaCorrecta) {
                    incrementarPuntos(puntosGanados: 10); // Llamada correcta a la función
                    setState(() {
                      tesoros[indiceActual].encontrado = true;
                    });
                    Navigator.of(context).pop();
                    if (indiceActual == tesoros.length - 1) {
                      mostrarDesafioTesoro(context);
                    }
                  } else {
                    _mostrarMensajeFinal(context);
                  }
                },
              ),
            ],
          );
        },
      );
    } else {
      _mostrarMensajeFinal(context);
    }
  }

  void _mostrarMensajeError(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Respuesta incorrecta'),
        content: Text('Intenta de nuevo.'),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void verificarSeleccionTesoro(BuildContext context) {
    if (correctCount == tesoros.length) {
      incrementarPuntos(puntosGanados: tesoros.length * 10);
      desbloquearContenido(Usuario as Usuario);
      showAnimatedDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ClassicGeneralDialogWidget(
            titleText: '¡Felicidades!',
          );
        },
        animationType: DialogTransitionType.size,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(seconds: 1),
      );
    } else {
      // Lógica para manejar selecciones incorrectas...
    }
  }

  void incrementarPuntos({required int puntosGanados}) {
    setState(() {
      usuario.puntos += puntosGanados;
    });
  }

  void desbloquearContenido(Usuario usuario) {
    // Desbloquear contenido exclusivo
  }

  void mostrarDesafioSeleccion(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setStateModal) {
              return DraggableScrollableSheet(
                expand: false,
                builder: (_, controller) {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25.0)),
                    ),
                    child: Column(
                      children: [
                        // Encabezado
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: const Text(
                            "Desafío de Selección de Proyectos",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        // Lista de Proyectos
                        Expanded(
                          child: ListView.builder(
                            key: const PageStorageKey<String>('proyectos-list'),
                            controller: controller,
                            itemCount: proyectos.length,
                            itemBuilder: (context, index) {
                              final proyecto = proyectos[index];
                              final isSelected =
                                  seleccionesUsuario.contains(proyecto.nombre);
                              return Card(
                                elevation: 4,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                child: Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: Colors.green),
                                  child: CheckboxListTile(
                                    activeColor: Colors.green,
                                    checkColor: Colors.white,
                                    dense: true,
                                    title: Text(
                                      proyecto.nombre,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    value: isSelected,
                                    onChanged: (bool? value) {
                                      setStateModal(() {
                                        if (value ?? false) {
                                          if (!isSelected) {
                                            seleccionesUsuario
                                                .add(proyecto.nombre);
                                          }
                                        } else {
                                          seleccionesUsuario.removeWhere(
                                              (nombre) =>
                                                  nombre == proyecto.nombre);
                                        }
                                      });
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        // Botón de Verificación
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green, // foreground
                          ),
                          onPressed: () {
                            Navigator.pop(
                                context); // Cerrar el modal cuando se presiona verificar
                            verificarSeleccion(
                                context); // Llama a la función para verificar la selección
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Text(
                              'Verificar selecciones',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        });
  }

  void verificarSeleccion(BuildContext context) {
    int correctCount = seleccionesUsuario
        .where((nombreProyecto) => esProyectoCorrecto(nombreProyecto))
        .length;
    if (seleccionesUsuario.length == 3 && correctCount == 3) {
      // El usuario seleccionó 3 proyectos y todos son correctos
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('¡Felicidades!'),
          content: const Text('Has seleccionado los tres proyectos correctos.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
            ),
          ],
        ),
      );
    } else {
      // Mostrar un mensaje de error
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Intenta de nuevo'),
          content: const Text(
              'Asegúrate de seleccionar exactamente tres proyectos y que sean los correctos.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
            ),
          ],
        ),
      );
    }
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      color: const Color(0xff072931),
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
            icon: const Icon(Icons.star, color: Color(0xffd9d9d9)),
            onPressed: () {
              // Acción para desafíos
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Color(0xffd9d9d9)),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        const Perfil()), // Asegúrate de que 'Perfil' sea la pantalla correcta a mostrar.
              );
            },
          ),
        ],
      ),
    );
  }
}

class _mostrarMensajeFinal {
  _mostrarMensajeFinal(BuildContext context);
}
