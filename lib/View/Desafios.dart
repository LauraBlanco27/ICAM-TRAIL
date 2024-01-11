import 'package:flutter/material.dart';
import 'package:proyecto1/View/PagPrincipal.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'ImagenPalabra.dart';
import 'Perfil.dart';
import 'SopaLetras.dart';

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
    required List<String> opciones,
    required this.nombreElemento,
    required this.respuestaCorrecta,
    this.encontrado = false,
  }) : opciones = (opciones..shuffle()) {
    if (!this.opciones.contains(respuestaCorrecta)) {
      this.opciones[0] = respuestaCorrecta;
    }
  }
}

class Usuario {
  int puntos = 0;
  int estrellas = 0;
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
  late BuildContext mainContext;
  late List<ProyectoEducativo> proyectos;
  late List<String> seleccionesUsuario = [];
  late List<Tesoro> tesoros;
  Usuario usuario = Usuario();
  int respuestasCorrectas = 0;

  get correctCount => null;
  get valorDeseado => null;
  get opciones => null;

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

    tesoros = [
      Tesoro(
        pista: "¿Qué lugar está diseñado para cultivar y protejer plantas en un ambiente controlado y cálido?",
        opciones: ["Lombricomposta", "Invernadero", "Huerto Familiar"],
        respuestaCorrecta: "Invernadero",
        nombreElemento: '',
      ),
      Tesoro(
        pista: "¿Cuál es el uso de las trampas de color amarillo y azul en la agricultura?",
        opciones: [
          "Prevenir ataques de plagas como mosca blanca, pulgón, palomilla o trips",
          "Protejer el plástico del invernadero del desgaste por viento o tiempo",
          "Capturar insectos"
        ],
        respuestaCorrecta:
            "Prevenir ataques de plagas como mosca blanca, pulgón, palomilla o trips",
        nombreElemento: '',
      ),
      Tesoro(
        pista:
            "¿Cuál es la función principal de los filtros instalados antes de que el agua llegue al reservorio?",
        opciones: [
          "Mantener el tanque limpio, evitando la acumulación de impurezas",
          "Proporcionar una salida de escape si el agua entrante excede la capacidad de almacenamiento del reservorio",
          "Capturar sedimentos y otras impurezas que trae la lluvia, manteniendo el agua en el reservorio más limpia"
        ],
        respuestaCorrecta:
            "Capturar sedimentos y otras impurezas que trae la lluvia, manteniendo el agua en el reservorio más limpia",
        nombreElemento: '',
      ),
      Tesoro(
        pista: "¿Cuánto tiempo, aproximadamente, tarda en madurar la lombricomposta?",
        opciones: [
          "Alrededor de 21 días",
          "Cerca de 12 días",
          "Aproximadamente 25 días"
        ],
        respuestaCorrecta: "Alrededor de 21 días",
        nombreElemento: '',
      ),
      Tesoro(
        pista: "¿Para qué sirve el muro de piedra en una terraza agrícola?",
        opciones: [
          "Para mantener su estructura equilibrada y proporcionar soporte",
          "Para contener las terrazas y prevenir su derrumbe",
          "Para aumentar la firmeza y estabilidad del terreno"
        ],
        respuestaCorrecta:
            "Para contener las terrazas y prevenir su derrumbe",
        nombreElemento: '',
      ),
      // Agrega más tesoros aquí con sus opciones y respuestas...
    ];

    for (var tesoro in tesoros) {
      tesoro.opciones.shuffle();
    }
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
    mainContext = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafíos', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xffd9d9d9),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const PagPrincipal()),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'ima/DesafioF.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0), // Agrega un poco de espacio alrededor del texto
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5), // Color negro con opacidad
                    borderRadius: BorderRadius.circular(8), // Bordes redondeados del rectángulo
                  ),
                  child: Text(
                    "DESAFÍOS DISPONIBLES",
                    style: TextStyle(
                      color: Colors.white, // Texto en color blanco
                      fontSize: Theme.of(context).textTheme.titleLarge?.fontSize, // Mantiene el tamaño original
                      fontWeight: FontWeight.bold, // Mantiene el peso de la fuente original
                    ),
                  ),
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
                      'Acierta y Aprende',
                      Icons.psychology,
                      () => mostrarDesafioTesoro(context),
                    ),
                    _buildDesafioCard(
                      context,
                      'Desafío de Sopa de Letras',
                      Icons.games, // Icono representativo
                      () => mostrarDesafioSopaDeLetras(context),
                    ),
                    _buildDesafioCard(
                      context,
                      'Relaciona Imágenes con Palabras',
                      Icons.image, // Icono representativo del desafío
                      () => mostrarDesafioImagenesPalabras(
                          context), // Método para mostrar el desafío
                    ),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildDesafioCard(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.green.shade700.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
            gradient: LinearGradient(
              colors: [
                Color(0xff072931).withOpacity(0.7),
                Color(0xff072931).withOpacity(0.7),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 30, color: Colors.green.shade800),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily:
                        'Arial', // Puedes cambiar esto por tu fuente personalizada
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.green.shade800,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_forward_ios,
                    size: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void mostrarDesafioTesoro(BuildContext context, [int indiceActual = 0]) {
    if (indiceActual == 0) {
      usuario.puntos = 0;
    }

    if (indiceActual < tesoros.length) {
      Tesoro tesoroActual = tesoros[indiceActual];
      String? seleccionUsuario = '';

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Row(
              children: [
                Icon(Icons.search, color: Colors.green.shade800),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Acierta y Aprende',
                    style: TextStyle(color: Colors.green.shade800, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            titlePadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            backgroundColor: Colors.green[50],
            content: StatefulBuilder(
              builder: (innerContext, setStateDialog) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(tesoroActual.pista, style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black87)),
                      Divider(color: Colors.green[300]),
                      ...tesoroActual.opciones.map((opcion) {
                        bool isSelected = seleccionUsuario == opcion;
                        return Card(
                          color: isSelected ? Colors.green[300] : Colors.white,
                          elevation: isSelected ? 4 : 1,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            title: Text(opcion, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
                            trailing: isSelected ? Icon(Icons.check_circle, color: Colors.white) : null,
                            onTap: () => setStateDialog(() => seleccionUsuario = opcion),
                          ),
                        );
                      }),
                    ],
                  ),
                );
              },
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.brown[300],
                ),
                child: Text('Confirmar Selección', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  if (seleccionUsuario == tesoroActual.respuestaCorrecta) {
                    respuestasCorrectas++;
                    incrementarPuntos(puntosGanados: 10);
                    Navigator.of(dialogContext).pop();
                    mostrarMensajeCorrecto(context, tesoroActual.nombreElemento, indiceActual + 1);
                  } else {
                    Navigator.of(dialogContext).pop();
                    if (mounted) {
                      _mostrarMensajeError(context, indiceActual);
                    }
                  }
                },
              ),
              TextButton(
                child: const Text('Terminar desafío'),
                onPressed: () {
                  Navigator.of(dialogContext)
                      .pop(); // Cierra el diálogo actual primero
                  _mostrarMensajeFinal(mainContext,
                      terminadoAnticipadamente: true); // Usa mainContext aquí
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

  void mostrarMensajeCorrecto(
      BuildContext context, String nombreElemento, int siguienteIndice) {
    showDialog(
      context: mainContext,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 320, // Ancho máximo del diálogo
              minHeight: 320, // Altura mínima del diálogo
            ),
            child: Container(
              width: double.infinity,
              height: 320,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('ima/bien.jpg'), // Ruta de tu imagen de fondo
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/Gif/bien.gif', // Ruta de tu GIF
                      fit: BoxFit.contain,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(0.6), // Color de fondo con opacidad
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Bordes redondeados para el botón
                        ),
                      ),
                      child: const Text('Aceptar', style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          Navigator.of(context).pop();
                          mostrarDesafioTesoro(context, siguienteIndice);
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _mostrarMensajeError(BuildContext context, int indiceActual) {
    showDialog(
      context: mainContext, // Usar mainContext aquí
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 400, // Ancho máximo del diálogo
            minHeight: 400, // Altura mínima del diálogo
          ),
          child: Container(
            width: double.infinity,
            height: 320,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('ima/mal.jpg'), // Ruta de tu imagen de fondo
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/Gif/error.gif',
                    fit: BoxFit.contain,
                    width: 150, // Ancho del GIF
                    height: 150, // Altura del GIF
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.6), // Color de fondo con opacidad
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Bordes redondeados para el botón
                      ),
                    ),
                    child: const Text('Aceptar', style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.of(context).pop(); // Cerrar el diálogo
                        mostrarDesafioTesoro(context, indiceActual); // Permanece en la misma pregunta
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _mostrarMensajeFinal(BuildContext context, {bool terminadoAnticipadamente = false}) {
    String mensajeParte1;
    String mensajeParte2;
    String rutaImagen; // Ruta de la imagen de fondo
    String rutaGif; // Ruta del GIF

    // Asigna los mensajes, imágenes y GIFs según el caso
    if (terminadoAnticipadamente) {
      mensajeParte1 = 'Has decidido terminar el desafío anticipadamente.';
      mensajeParte2 = 'Tu puntuación es valiosa: ¡${usuario.puntos} puntos logrados! ';
      rutaImagen = 'ima/Anticipado.jpg';
      rutaGif = 'assets/Gif/anticipado.gif';
    } else {
      double porcentajeCorrecto = (respuestasCorrectas / tesoros.length) * 100;
      if (porcentajeCorrecto >= 80) {
        mensajeParte1 = '¡Desafío completado con éxito! Has ganado .';
        mensajeParte2 = 'Tu puntuación es impresionante: ¡${usuario.puntos} puntos!';
        rutaImagen = 'ima/Terminado.jpg';
        rutaGif = 'assets/Gif/estrella.gif';
      } else {
        mensajeParte1 = 'Desafío completado.';
        mensajeParte2 = 'Puntuación obtenida: ${usuario.puntos}';
        rutaImagen = 'assets/fondos/completado.jpg';
        rutaGif = 'assets/Gif/mal.gif';
      }
    }

    // Mostrar el diálogo
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: double.infinity,
          height: 450,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(rutaImagen),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                mensajeParte1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34, // Tamaño de la letra para la primera parte
                  color: Colors.white.withOpacity(0.1), // Añadiendo opacidad del 80% al color blanco
                  fontWeight: FontWeight.bold, // Estilo de letra en negrita
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 120, // Ancho deseado para el GIF
                height: 120, // Altura deseada para el GIF
                child: Image.asset(
                  rutaGif,
                  fit: BoxFit.contain,
                ),
              ),

              Text(
                mensajeParte2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Maharlika',
                  color: Colors.black,
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.6),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Aceptar', style: TextStyle(color: Colors.white)),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void verificarSeleccionTesoro(BuildContext context) {
    if (correctCount == tesoros.length) {
      incrementarPuntos(puntosGanados: tesoros.length * 10);
      desbloquearContenido(usuario, ganaEstrella: true);
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
    if (mounted) {
      setState(() {
        usuario.puntos += puntosGanados;
      });
    }
  }

  void desbloquearContenido(Usuario usuario, {required bool ganaEstrella}) {
    setState(() {
      if (ganaEstrella) {
        usuario.estrellas += 1; // Incrementar las estrellas del usuario
        // Puedes añadir aquí más lógica si es necesario
      }
    });

    String mensaje = ganaEstrella
        ? '¡Felicidades! Has ganado una estrella.'
        : 'Has desbloqueado contenido exclusivo por completar el desafío.';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¡Felicidades!'),
        content: Text(mensaje),
        actions: <Widget>[
          TextButton(
            child: const Text('Aceptar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void mostrarDesafioSeleccion(BuildContext context) {
    seleccionesUsuario.clear();

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
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.green[50]!, Colors.green[100]!],
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        alignment: Alignment.center,
                        child: Text(
                          "Desafío de Selección de Proyectos",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.green[800],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: controller,
                          itemCount: proyectos.length,
                          itemBuilder: (context, index) {
                            final proyecto = proyectos[index];
                            bool isSelected = seleccionesUsuario.contains(proyecto.nombre);
                            return GestureDetector(
                              onTap: () {
                                setStateModal(() {
                                  if (!isSelected) {
                                    seleccionesUsuario.add(proyecto.nombre);
                                  } else {
                                    seleccionesUsuario.remove(proyecto.nombre);
                                  }
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  color: isSelected ? Colors.green[400] : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: isSelected ? Colors.green[700]! : Colors.grey[300]!,
                                    width: 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: isSelected ? Colors.green[700] : Colors.grey[300],
                                    child: isSelected
                                        ? Icon(Icons.check, color: Colors.white, size: 16) // Ajustar el tamaño del ícono
                                        : Container(),
                                  ),
                                  title: Text(
                                    proyecto.nombre,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: isSelected ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green[800],
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          verificarSeleccion(context);
                        },
                        child: Text('Verificar selecciones', style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  void verificarSeleccion(BuildContext context) {
    int correctCount = seleccionesUsuario
        .where((nombreProyecto) => esProyectoCorrecto(nombreProyecto))
        .length;

    if (seleccionesUsuario.length == 3 && correctCount == 3) {
      // Mensaje de éxito
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Imagen de fondo
                Container(
                  width: double.infinity,
                  height: 320, // Ajusta según tus necesidades
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('ima/Felicidades.jpg'), // Imagen de éxito
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                // Contenido del diálogo
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black.withOpacity(0.6), // Color de fondo con opacidad
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // Bordes redondeados para el botón
                          ),
                        ),
                        child: const Text('Aceptar', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      // Mensaje de error
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Imagen de fondo para el error
                Container(
                  width: double.infinity,
                  height: 320, // Ajusta según tus necesidades
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('ima/Errorr.jpg'), // Imagen de error
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                // Contenido del diálogo
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black.withOpacity(0.6), // Color de fondo con opacidad
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // Bordes redondeados para el botón
                          ),
                        ),
                        child: const Text('Aceptar', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
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
                MaterialPageRoute(builder: (_) => const PagPrincipal()),
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

  void mostrarDesafioSopaDeLetras(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SopaDeLetrasScreen(),
    ));
  }

  void mostrarDesafioImagenesPalabras(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            const PantallaDesafioImagenesPalabras(), // Ahora esta clase existe
      ),
    );
  }
}
