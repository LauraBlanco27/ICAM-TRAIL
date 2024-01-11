import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import '../Model/ImagenPalabra.dart';
import 'dart:math' as math;

class PantallaDesafioImagenesPalabras extends StatefulWidget {
  const PantallaDesafioImagenesPalabras({super.key});

  @override
  _PantallaDesafioImagenesPalabrasState createState() =>
      _PantallaDesafioImagenesPalabrasState();
}

class _PantallaDesafioImagenesPalabrasState extends State<PantallaDesafioImagenesPalabras> {
  late List<ImagenPalabra> elementos;
  ImagenPalabra? seleccionPrevia;
  bool esperandoVoltear = false;
  int intentos = 30;
  static const int maxIntentos = 30;
  AudioPlayer audioPlayer = AudioPlayer();
  Timer? _timer; // Timer
  int _tiempoRestante = 120;


  void _playSound(String path) async {
    await audioPlayer.play(AssetSource(path));
  }

  @override
  void initState() {
    super.initState();
    elementos = [
      ImagenPalabra(rutaImagen: 'ima/vacaa.jpg', idPar: 1),
      ImagenPalabra(rutaImagen: 'ima/vaca.jpg', idPar: 1),
      ImagenPalabra(rutaImagen: 'ima/llamaa.jpg', idPar: 2),
      ImagenPalabra(rutaImagen: 'ima/llama.jpg', idPar: 2),
      ImagenPalabra(rutaImagen: 'ima/ovejaa.jpg', idPar: 3),
      ImagenPalabra(rutaImagen: 'ima/oveja.jpg', idPar: 3),
      ImagenPalabra(rutaImagen: 'ima/tinguaa.jpg', idPar: 4),
      ImagenPalabra(rutaImagen: 'ima/tingua.jpg', idPar: 4),
      ImagenPalabra(rutaImagen: 'ima/bombaZz.jpg', idPar: 5),
      ImagenPalabra(rutaImagen: 'ima/bombaZ.jpg', idPar: 5),
      ImagenPalabra(rutaImagen: 'ima/bicii.jpg', idPar: 6),
      ImagenPalabra(rutaImagen: 'ima/bici.jpg', idPar: 6),
      ImagenPalabra(rutaImagen: 'ima/estacionn.jpg', idPar: 7),
      ImagenPalabra(rutaImagen: 'ima/estacion.jpg', idPar: 7),
      ImagenPalabra(rutaImagen: 'ima/aranaa.jpg', idPar: 8),
      ImagenPalabra(rutaImagen: 'ima/arana.jpg', idPar: 8),
      ImagenPalabra(rutaImagen: 'ima/solarr.jpg', idPar: 9),
      ImagenPalabra(rutaImagen: 'ima/solar.jpg', idPar: 9),

    ];

    elementos.shuffle();
    _iniciarTemporizador();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancela el Timer al salir del widget
    super.dispose();
  }

  void _iniciarTemporizador() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_tiempoRestante > 0) {
        setState(() {
          _tiempoRestante--;
        });
      } else {
        _timer?.cancel();
        _mostrarFinDelJuegoPorTiempo();
      }
    });
  }

  String _formatoTiempo(int segundos) {
    int minutos = segundos ~/ 60;
    int segRestantes = segundos % 60;
    String minStr = minutos.toString().padLeft(2, '0');
    String segStr = segRestantes.toString().padLeft(2, '0');
    return "$minStr:$segStr";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafío Imágenes y Palabras'),
        backgroundColor: const Color(0xffd9d9d9),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _inicializarJuego();
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
              ),
              itemCount: elementos.length,
              itemBuilder: (context, index) {
                final item = elementos[index];
                return TarjetaDesafio(
                  elemento: item,
                  volteada: item.volteada,
                  esCorrecto: item.esImagen == (seleccionPrevia?.esImagen ?? !item.esImagen),
                  onTap: () => _manejarSeleccion(item),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xff072931),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Intentos: $intentos', style: const TextStyle(fontSize: 18, color: Colors.white)),
          Text('Tiempo: ${_formatoTiempo(_tiempoRestante)}', style: const TextStyle(fontSize: 18, color: Colors.white)),
          // Otros elementos como progreso, etc.
        ],
      ),
    );
  }

  void _inicializarJuego() {
    setState(() {
      elementos.shuffle();
      for (var elemento in elementos) {
        elemento.volteada = false;
      }
      seleccionPrevia = null;
      esperandoVoltear = false;
      intentos = maxIntentos;
    });

    _tiempoRestante = 180; // Reinicia el tiempo
    _timer?.cancel(); // Cancela cualquier Timer anterior
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_tiempoRestante > 0) {
        setState(() {
          _tiempoRestante--;
        });
      } else {
        _timer?.cancel();
        _mostrarFinDelJuegoPorTiempo();
      }
    });
  }

  void _mostrarFinDelJuegoPorTiempo() {
    // Muestra un diálogo o realiza una acción cuando se termina el tiempo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Fin del Juego'),
          content: const Text('El tiempo se ha agotado.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                _inicializarJuego();
              },
            ),
          ],
        );
      },
    );
  }

  void _manejarSeleccion(ImagenPalabra seleccionActual) {
    if (esperandoVoltear || intentos == 0 || _tiempoRestante == 0) {
      return;
    }

    setState(() {
      seleccionActual.volteada = true;
    });

    if (seleccionPrevia == null) {
      seleccionPrevia = seleccionActual;
      _playSound('assets/Sonidos/Seleccion.mp3');
    } else {
      if (seleccionPrevia?.idPar == seleccionActual.idPar) {
        _playSound('assets/Sonidos/Correcto.mp3');
        seleccionPrevia = null;
        intentos--;
        _mostrarDialogoFelicitaciones();
      } else {
        _playSound('assets/Sonidos/Error.mp3');
        esperandoVoltear = true;
        intentos--;
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            seleccionActual.volteada = false;
            seleccionPrevia!.volteada = false;
            seleccionPrevia = null;
            esperandoVoltear = false;
          });
        });
      }
      if (intentos == 0 || _tiempoRestante == 0) {
        _mostrarFinDelJuego();
        _timer?.cancel(); // Detiene el Timer cuando el juego termina
      }
    }
  }


  void _mostrarFinDelJuego() {
    // Muestra un diálogo o realiza una acción cuando se terminan los intentos
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Fin del Juego'),
          content: const Text('Se han agotado los intentos.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                _inicializarJuego();
              },
            ),
          ],
        );
      },
    );
  }
  bool _sonTodasLasParejasEncontradas() {
    return elementos.every((elemento) => elemento.volteada);
  }

  void _mostrarDialogoFelicitaciones() {
    if (_sonTodasLasParejasEncontradas()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('¡Felicitaciones!'),
            content: const Text('¡Has encontrado todas las parejas!'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _inicializarJuego();
                },
              ),
            ],
          );
        },
      );
    }
  }

}



class TarjetaDesafio extends StatefulWidget {
  final ImagenPalabra elemento;
  final bool volteada;
  final bool? esCorrecto;
  final VoidCallback onTap;

  const TarjetaDesafio({
    super.key,
    required this.elemento,
    required this.volteada,
    this.esCorrecto,
    required this.onTap,
  });

  @override
  _TarjetaDesafioState createState() => _TarjetaDesafioState();
}

class _TarjetaDesafioState extends State<TarjetaDesafio> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _flipAnimation = Tween<double>(begin: 0.0, end: 3 * math.pi).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    if (widget.volteada) {
      _controller.value = 1.0; // Inicia con la tarjeta volteada si es necesario
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    if (widget.volteada) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedBuilder(
        animation: _flipAnimation,
        builder: (context, child) {
          // Ajustar la rotación aquí
          double flipValue;
          if (_flipAnimation.value <= math.pi) {
            // Frente de la tarjeta
            flipValue = _flipAnimation.value;
          } else {
            // Dorso de la tarjeta
            flipValue = _flipAnimation.value - math.pi;
          }

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateY(flipValue),
            child: child,
          );
        },
        child: TarjetaDesafioContent(
          elemento: widget.elemento,
          volteada: widget.volteada,
          esCorrecto: widget.esCorrecto,
        ),
      ),
    );
  }
}

class TarjetaDesafioContent extends StatelessWidget {
  final ImagenPalabra elemento;
  final bool volteada;
  final bool? esCorrecto;

  const TarjetaDesafioContent({
    super.key,
    required this.elemento,
    required this.volteada,
    this.esCorrecto,
  });

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoracion = BoxDecoration(
      color: volteada ? Colors.white : Colors.grey[300],
      borderRadius: BorderRadius.circular(15),
      gradient: volteada ? null : LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.grey.shade300, Colors.grey.shade500],
      ),
      border: volteada
          ? Border.all(
        color: esCorrecto == null
            ? Colors.transparent
            : esCorrecto == true
            ? Colors.red
            : Colors.green,
        width: 2.0,
      )
          : null,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 10,
          offset: const Offset(2, 4),
        ),
      ],
    );

    return Card(
      elevation: volteada ? 10 : 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: decoracion,
        child: volteada
            ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(elemento.rutaImagen, fit: BoxFit.cover),
        )
            : Container(),
      ),
    );
  }
}
