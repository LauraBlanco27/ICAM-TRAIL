import 'package:flutter/material.dart';

class Palabra {
  String palabra;
  String descripcion;
  bool encontrada;

  Palabra(
      {required this.palabra,
      required this.descripcion,
      this.encontrada = false});
}

enum SeleccionDireccion { horizontal, vertical, noDeterminada }

class SopaDeLetrasScreen extends StatefulWidget {
  const SopaDeLetrasScreen({Key? key}) : super(key: key);

  @override
  _SopaDeLetrasScreenState createState() => _SopaDeLetrasScreenState();
}

class _SopaDeLetrasScreenState extends State<SopaDeLetrasScreen> {
  int puntos = 0;
  List<Palabra> palabras = [
    Palabra(palabra: "HUERTOFAMILIAR", descripcion: "HUERTOFAMILIAR"),
    Palabra(palabra: "LOMBRICOMPOSTA", descripcion: "LOMBRICOMPOSTA"),
    Palabra(palabra: "APICULTURA", descripcion: "APICULTURA"),
    Palabra(palabra: "RIEGOEFICIENTE", descripcion: "RIEGOEFICIENTE"),
    Palabra(palabra: "RESERVORIOAGUA", descripcion: "RESERVORIOAGUA"),
    Palabra(palabra: "TERRAZAAGRICOLA", descripcion: "TERRAZAAGRICOLA"),
    Palabra(palabra: "AGRICULTURA", descripcion: "AGRICULTURA"),
    Palabra(palabra: "SILVOPASTORIL", descripcion: "SILVOPASTORIL"),
    Palabra(palabra: "INVERNADERO", descripcion: "INVERNADERO"),
    Palabra(palabra: "SILVOAGRICOLA", descripcion: "SILVOAGRICOLA"),
  ];

  Map<int, bool> seleccionado = {};
  List<int> seleccionActual = [];

  SeleccionDireccion direccionSeleccion = SeleccionDireccion.noDeterminada;

  List<List<String>> grid = [
    ['A', 'A', 'G', 'R', 'I', 'C', 'U', 'L', 'T', 'U', 'R', 'A', 'T', 'R', 'H'],
    ['P', 'I', 'G', 'R', 'I', 'X', 'U', 'E', 'E', 'T', 'J', 'I', 'E', 'S', 'U'],
    ['I', 'S', 'I', 'L', 'V', 'O', 'A', 'G', 'R', 'I', 'C', 'O', 'L', 'A', 'E'],
    ['C', 'V', 'T', 'R', 'G', 'B', 'U', 'A', 'R', 'I', 'A', 'G', 'R', 'L', 'R'],
    ['U', 'O', 'G', 'C', 'O', 'R', 'U', 'G', 'A', 'N', 'H', 'O', 'A', 'V', 'T'],
    ['L', 'P', 'F', 'R', 'E', 'K', 'U', 'R', 'Z', 'V', 'A', 'E', 'Z', 'O', 'O'],
    ['T', 'A', 'I', 'N', 'V', 'E', 'R', 'N', 'A', 'D', 'E', 'R', 'O', 'A', 'F'],
    ['U', 'S', 'W', 'R', 'I', 'J', 'F', 'C', 'A', 'R', 'K', 'I', 'A', 'G', 'A'],
    ['R', 'T', 'U', 'R', 'C', 'T', 'I', 'U', 'G', 'N', 'C', 'C', 'G', 'R', 'M'],
    ['A', 'O', 'O', 'R', 'I', 'X', 'C', 'L', 'R', 'A', 'J', 'I', 'R', 'I', 'I'],
    ['R', 'E', 'S', 'E', 'R', 'V', 'O', 'R', 'I', 'O', 'A', 'G', 'U', 'A', 'L'],
    ['R', 'I', 'E', 'G', 'O', 'E', 'F', 'I', 'C', 'I', 'E', 'N', 'T', 'E', 'I'],
    ['S', 'L', 'O', 'M', 'B', 'R', 'I', 'C', 'O', 'M', 'P', 'O', 'S', 'T', 'A'],
    ['T', 'O', 'R', 'A', 'E', 'L', 'C', 'A', 'L', 'O', 'F', 'R', 'L', 'A', 'R'],
    ['A', 'O', 'S', 'I', 'L', 'V', 'O', 'P', 'A', 'S', 'T', 'O', 'R', 'I', 'L'],
  ];

  void verificarSeleccionActual() {
    if (seleccionActual.isEmpty) return;

    seleccionActual.sort();
    int n = grid[0].length;
    int primeraFila = seleccionActual.first ~/ n;
    int primeraColumna = seleccionActual.first % n;
    int ultimaFila = seleccionActual.last ~/ n;
    int ultimaColumna = seleccionActual.last % n;

    String palabraSeleccionada = '';

    // Verificación horizontal y vertical
    if (primeraFila == ultimaFila) {
      for (var i in seleccionActual) {
        if (i ~/ n == primeraFila) palabraSeleccionada += grid[i ~/ n][i % n];
      }
    } else if (primeraColumna == ultimaColumna) {
      for (var i in seleccionActual) {
        if (i % n == primeraColumna) palabraSeleccionada += grid[i ~/ n][i % n];
      }
    } else if (ultimaColumna - primeraColumna == ultimaFila - primeraFila) {
      int filaActual = primeraFila;
      int columnaActual = primeraColumna;

      while (filaActual <= ultimaFila && columnaActual <= ultimaColumna) {
        palabraSeleccionada += grid[filaActual][columnaActual];
        filaActual++;
        columnaActual++;
      }
    }

    if (_esPalabraValida(palabraSeleccionada)) {
      _marcarPalabraComoEncontrada(palabraSeleccionada);
    }

    _limpiarSeleccion();
  }

  void _marcarPalabraComoEncontrada(String palabra) {
    for (var p in palabras) {
      if (p.palabra == palabra) {
        setState(() {
          p.encontrada = true;
          puntos += 10;
          // Marcar las letras de la palabra encontrada
          for (var index in seleccionActual) {
            seleccionado[index] = true;
          }
        });
        mostrarMensaje("¡Felicidades! Palabra correcta: $palabra");
        _verificarSiJuegoTerminado();
        break;
      }
    }
  }

  void _verificarSiJuegoTerminado() {
    if (palabras.every((p) => p.encontrada)) {
      _mostrarDialogoFinal();
    }
  }

  void _mostrarDialogoFinal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          content: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              // Contenedor con la imagen de fondo
              Container(
                width: double.infinity,
                height: 350, // Altura ajustada para acomodar el GIF y el texto
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("ima/logrado.jpg"), // Imagen de fondo
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              // GIF y texto centrados
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      "Logrado",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.1),), // Texto blanco para visibilidad
                    ),
                  ),
                  SizedBox(height: 10),

                  Image.asset(
                    "assets/Gif/ganadorr.gif", // Ruta del GIF
                    height: 120, // Altura del GIF
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      "Has ganado $puntos puntos.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontFamily: 'Maharlika', fontSize: 18), // Texto blanco para visibilidad
                    ),
                  ),
                ],
              ),
              // Botón "Aceptar"
              Positioned(
                right: 13,
                bottom: 10,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Aceptar', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pop();
                    reiniciarJuego();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _limpiarSeleccion() {
    setState(() {
      seleccionActual.clear();
      seleccionado.updateAll((key, value) => false);
    });
  }

  void mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(mensaje)));
  }

  List<String> construirPalabra(List<int> seleccion) {
    if (seleccion.isEmpty) return [];

    seleccion.sort();
    int n = grid[0].length;
    List<String> palabrasConstruidas = [];

    // Construcción de palabras horizontales y verticales
    String palabraHorizontal = '';
    String palabraVertical = '';

    for (int i = 0; i < seleccion.length; i++) {
      int row = seleccion[i] ~/ n;
      int col = seleccion[i] % n;
      palabraHorizontal += grid[row][col];

      // Verifica si la selección es vertical
      if (i < seleccion.length - 1) {
        int nextRow = seleccion[i + 1] ~/ n;
        if (nextRow == row + 1) {
          palabraVertical += grid[row][col];
        }
      }
    }

    if (palabraVertical.isNotEmpty) {
      palabraVertical += grid[seleccion.last ~/ n][seleccion.last % n];
    }

    palabrasConstruidas.add(palabraHorizontal);
    palabrasConstruidas.add(palabraVertical);

    return palabrasConstruidas;
  }

  bool esDiagonal(List<int> seleccion, int n) {
    if (seleccion.length < 2) {
      return false;
    }
    seleccion.sort();

    int baseRowDiff = (seleccion[1] ~/ n) - (seleccion[0] ~/ n);
    int baseColDiff = (seleccion[1] % n) - (seleccion[0] % n);

    if (baseRowDiff.abs() != 1 || baseColDiff.abs() != 1) {
      return false;
    }

    for (int i = 1; i < seleccion.length - 1; i++) {
      int currentRowDiff = (seleccion[i + 1] ~/ n) - (seleccion[i] ~/ n);
      int currentColDiff = (seleccion[i + 1] % n) - (seleccion[i] % n);

      if (currentRowDiff != baseRowDiff || currentColDiff != baseColDiff) {
        return false;
      }
    }

    return true;
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        seleccionado[i * grid[0].length + j] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffd9d9d9),
        title: Text(
          "Sopa de Letras - Puntos: $puntos",
          style: const TextStyle(
            fontSize: 19,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: reiniciarJuego,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff072931), Color(0xff072931)],
          ),
        ),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: _calculateProgress(),
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(1),
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xff072931),
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _buildLetterGrid(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: _buildWordList(),
            ),
          ],
        ),
      ),
    );
  }

  void reiniciarJuego() {
    setState(() {
      puntos = 0;
      for (var palabra in palabras) {
        palabra.encontrada = false;
      }
      for (int i = 0; i < grid.length; i++) {
        for (int j = 0; j < grid[i].length; j++) {
          seleccionado[i * grid[0].length + j] = false;
        }
      }
    });
  }

  double _calculateProgress() {
    int totalWords = palabras.length;
    int foundWords = palabras.where((word) => word.encontrada).length;
    return foundWords / totalWords;
  }

  Widget _buildWordList() {
    return Expanded(
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Bordes redondeados
        ),
        color: Colors.grey[100], // Color de fondo suave
        child: ListView.separated(
          itemCount: palabras.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            var palabra = palabras[index];
            return ListTile(
              title: Text(
                palabra.descripcion,
                style: TextStyle(
                  color: palabra.encontrada ? Colors.green : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                palabra.encontrada
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked, // Íconos más descriptivos
                color: palabra.encontrada ? Colors.green : Colors.grey[700],
              ),
            );
          },
        ),
      ),
    );
  }

  final GlobalKey _gridViewKey = GlobalKey();

  Widget _buildLetterGrid() {
    return Expanded(
      child: GridView.builder(
        key: _gridViewKey,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: grid[0].length,
          childAspectRatio: 1 / 0.98,
        ),
        itemCount: grid.length * grid[0].length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onPanStart: _onDragStart,
            onPanUpdate: _onDragUpdate,
            onPanEnd: _onDragEnd,
            child: _buildGridItem(index),
          );
        },
      ),
    );
  }

  Widget _buildGridItem(int index) {
    bool isSelected = seleccionado[index] ?? false;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: isSelected ? Colors.lightGreen : Colors.white,
        border: Border.all(color: isSelected ? Colors.green : Colors.grey!),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Center(
        child: Text(
          grid[index ~/ grid[0].length][index % grid[0].length],
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.green[800] : Colors.black),
        ),
      ),
    );
  }

  void mostrarPista() {
    setState(() {
      var palabrasNoEncontradas = palabras.where((p) => !p.encontrada).toList();
      if (palabrasNoEncontradas.isNotEmpty) {
        var palabraAleatoria = (palabrasNoEncontradas..shuffle()).first;

        int indiceLetra = encontrarIndiceLetraEnCuadricula(palabraAleatoria);
        if (indiceLetra != -1) {
          seleccionado[indiceLetra] = true;

          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              seleccionado[indiceLetra] = false;
            });
          });
        } else {
          mostrarMensaje(
              "No se encontró la letra de la pista en la cuadrícula.");
        }
      } else {
        mostrarMensaje("Todas las palabras han sido encontradas.");
      }
    });
  }

  int encontrarIndiceLetraEnCuadricula(Palabra palabra) {
    String primeraLetra = palabra.palabra[0];

    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        if (grid[i][j] == primeraLetra) {
          return i * grid[0].length + j;
        }
      }
    }
    return -1;
  }

  void _onDragStart(DragStartDetails details) {
    _clearPreviousSelection();
    int index = _calculateIndexFromGesture(details.globalPosition);
    _updateLetterSelection(index);
    direccionSeleccion = SeleccionDireccion.noDeterminada;
  }

  int _calculateIndexFromGesture(Offset globalPosition) {
    RenderBox gridViewBox =
        _gridViewKey.currentContext!.findRenderObject() as RenderBox;
    Offset gridViewRelativePosition = gridViewBox.globalToLocal(globalPosition);

    double cellWidth = gridViewBox.size.width / grid[0].length;
    double cellHeight = gridViewBox.size.height / grid.length;

    int row = (gridViewRelativePosition.dy / cellHeight)
        .clamp(0, grid.length - 1)
        .floor();
    int col = (gridViewRelativePosition.dx / cellWidth)
        .clamp(0, grid[0].length - 1)
        .floor();

    return row * grid[0].length + col;
  }

  void _onDragEnd(DragEndDetails details) {
    _verifyWordSelection();
  }

  void _clearPreviousSelection() {
    setState(() {
      for (var index in seleccionActual) {
        seleccionado[index] = false;
      }
      seleccionActual.clear();
    });
  }

  void _onDragUpdate(DragUpdateDetails details) {
    int index = _calculateIndexFromGesture(details.globalPosition);

    // No necesitamos verificar si es parte de una palabra encontrada aquí
    if (seleccionActual.isNotEmpty &&
        direccionSeleccion == SeleccionDireccion.noDeterminada) {
      _setInitialDirection(index);
    }

    if (_isSelectionConsistentWithDirection(index)) {
      _updateLetterSelection(index);
    }
  }

  void _setInitialDirection(int index) {
    if (seleccionActual.isEmpty) return;

    int lastIndex = seleccionActual.last;
    int rowDiff = (index ~/ grid[0].length) - (lastIndex ~/ grid[0].length);
    int colDiff = (index % grid[0].length) - (lastIndex % grid[0].length);

    if (rowDiff.abs() == colDiff.abs()) {
      direccionSeleccion = SeleccionDireccion.noDeterminada;
    } else if (rowDiff == 0) {
      direccionSeleccion = SeleccionDireccion.horizontal;
    } else if (colDiff == 0) {
      direccionSeleccion = SeleccionDireccion.vertical;
    }
  }

  bool _isSelectionConsistentWithDirection(int index) {
    if (seleccionActual.isEmpty) return true;

    int row = index ~/ grid[0].length;
    int col = index % grid[0].length;
    int lastRow = seleccionActual.last ~/ grid[0].length;
    int lastCol = seleccionActual.last % grid[0].length;

    switch (direccionSeleccion) {
      case SeleccionDireccion.horizontal:
        return row == lastRow;
      case SeleccionDireccion.vertical:
        return col == lastCol;
      default:
        return true;
    }
  }

  void _updateLetterSelection(int index) {
    setState(() {
      // Añade la letra a la selección actual si no está presente
      if (!seleccionActual.contains(index)) {
        seleccionActual.add(index);
      }
      // Siempre marca la letra como seleccionada, no importa si es parte de una palabra encontrada
      seleccionado[index] = true;
    });
  }

  bool _isLetterPartOfFoundWord(int index) {
    return seleccionado[index] ==
        true; // Retorna true si la letra ya está marcada como encontrada
  }

  void _verifyWordSelection() {
    String palabraSeleccionada = _buildWordFromSelection();
    if (_esPalabraValida(palabraSeleccionada)) {
      _marcarPalabraComoEncontrada(palabraSeleccionada);
      // Mantén las letras de palabras encontradas marcadas
      _clearCurrentSelection(keepFoundLetters: true);
    } else {
      _showMessage('Palabra no válida: $palabraSeleccionada');
      // Deselecciona todas las letras en la selección actual
      _deselectCurrentSelection();
    }
  }

  void _deselectCurrentSelection() {
    setState(() {
      for (var index in seleccionActual) {
        seleccionado[index] = false;
      }
      seleccionActual.clear();
    });
  }

  void _clearCurrentSelection({bool keepFoundLetters = false}) {
    setState(() {
      seleccionActual.forEach((index) {
        if (!keepFoundLetters || !_isLetterPartOfFoundWord(index)) {
          seleccionado[index] = false;
        }
      });
      seleccionActual.clear();
    });
  }

  void _clearInvalidSelection() {
    setState(() {
      seleccionActual.forEach((index) {
        if (!_isLetterPartOfFoundWord(index)) {
          seleccionado[index] = false;
        }
      });
      seleccionActual.clear();
    });
  }

  bool _esPalabraValida(String palabra) {
    String palabraMayuscula = palabra.toUpperCase();
    for (var p in palabras) {
      if (p.palabra.toUpperCase() == palabraMayuscula && !p.encontrada) {
        return true;
      }
    }
    return false;
  }

  String _buildWordFromSelection() {
    seleccionActual.sort();
    return seleccionActual
        .map((index) => grid[index ~/ grid[0].length][index % grid[0].length])
        .join();
  }

  void _clearSelection() {
    setState(() {
      for (var index in seleccionActual) {
        if (!_isLetterPartOfFoundWord(index)) {
          seleccionado[index] = false;
        }
      }
      seleccionActual.clear();
    });
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
