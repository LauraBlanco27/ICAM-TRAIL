import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'AgregarCampo.dart';
import 'PagPrincipal.dart';
import 'Perfil.dart';
import 'Proyectos.dart';

class Formulario extends StatefulWidget {
  final DocumentSnapshot? proyecto;
  final bool modoSoloLectura;
  const Formulario({Key? key, this.proyecto, this.modoSoloLectura = false})
      : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  TextEditingController tituloController =
      TextEditingController(text: 'TITULO');
  TextEditingController objetivosController = TextEditingController();
  TextEditingController materialesController = TextEditingController();
  TextEditingController rondaController = TextEditingController();
  TextEditingController mensajeController = TextEditingController();
  TextEditingController mensajesController = TextEditingController();
  TextEditingController textoController = TextEditingController();
  TextEditingController aController = TextEditingController();
  TextEditingController bController = TextEditingController();
  TextEditingController cController = TextEditingController();
  TextEditingController practicaController = TextEditingController();
  TextEditingController practica1Controller = TextEditingController();
  TextEditingController practica2Controller = TextEditingController();
  TextEditingController didacticaController = TextEditingController();
  TextEditingController didactica1Controller = TextEditingController();
  TextEditingController didactica2Controller = TextEditingController();
  TextEditingController didactica3Controller = TextEditingController();
  TextEditingController didactica4Controller = TextEditingController();
  TextEditingController didactica5Controller = TextEditingController();
  TextEditingController tipController = TextEditingController();

  bool _mostrarInformacion = false;
  bool _esModoEdicion = false;

  final Map<String, File> _imagenesSeleccionadas = {};

  Future<void> _seleccionarImagen(String identificador) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagenesSeleccionadas[identificador] = File(pickedFile.path);
      });
    }
  }

  bool esAdmin = false;
  final AuthService _authService = AuthService();

  Widget? imagenIntro1Widget;
  Widget? imagenCapacitacionWidget;
  Widget? imagenSiembraWidget;
  Widget? imagenSiembra2Widget;
  Widget? imagenImaCWidget;

  @override
  void initState() {
    super.initState();
    if (widget.proyecto != null) {
      _cargarDatosProyecto();
    }
    verificarRolUsuario();
    _esModoEdicion = !widget.modoSoloLectura;
  }

  String? imageUrlIntro1;
  String? imageUrlCapacitacion;
  String? imageUrlSiembra;
  String? imageUrlSiembra2;
  String? imageUrlimaC;

  Future<void> _cargarDatosProyecto() async {
    if (widget.proyecto != null && widget.proyecto!.data() != null) {
      final proyectoData = widget.proyecto!.data() as Map<String, dynamic>;

      setState(() {
        tituloController.text = proyectoData['titulo'] ?? '';
        objetivosController.text = proyectoData['objetivos'] ?? '';
        materialesController.text = proyectoData['materiales'] ?? '';
        rondaController.text = proyectoData['ronda'] ?? '';
        mensajeController.text = proyectoData['mensaje'] ?? '';
        mensajesController.text = proyectoData['mensajes'] ?? '';
        textoController.text = proyectoData['texto'] ?? '';
        aController.text = proyectoData['a'] ?? '';
        bController.text = proyectoData['b'] ?? '';
        cController.text = proyectoData['c'] ?? '';
        practicaController.text = proyectoData['practica'] ?? '';
        practica1Controller.text = proyectoData['practica1'] ?? '';
        practica2Controller.text = proyectoData['practica2'] ?? '';
        didacticaController.text = proyectoData['didactica'] ?? '';
        didactica1Controller.text = proyectoData['didactica1'] ?? '';
        didactica2Controller.text = proyectoData['didactica2'] ?? '';
        didactica3Controller.text = proyectoData['didactica3'] ?? '';
        didactica4Controller.text = proyectoData['didactica4'] ?? '';
        didactica5Controller.text = proyectoData['didactica5'] ?? '';
        tipController.text = proyectoData['tip'] ?? '';

        // Cargar URLs de imágenes desde Firebase
        _cargarImagenesFirebase();
      });
    }
  }

  Future<void> _cargarImagenesFirebase() async {
    // Este método asume que tienes un documento en Firebase con las URLs de las imágenes
    DocumentSnapshot imagenDoc = await FirebaseFirestore.instance
        .collection('imaProyectos')
        .doc(widget.proyecto!.id)
        .get();
    if (imagenDoc.exists) {
      final imageData = imagenDoc.data() as Map<String, dynamic>;
      setState(() {
        imageUrlIntro1 = imageData['imagenUrlIntro1'];
        imageUrlCapacitacion = imageData['imagenUrlCapacitacion'];
        imageUrlSiembra = imageData['imagenUrlSiembra'];
        imageUrlSiembra2 = imageData['imagenUrlSiembra2'];
        imageUrlimaC = imageData['imagenUrlimaC'];

        _inicializarWidgetsImagen();
      });
    }
  }

  void _inicializarWidgetsImagen() {
    setState(() {
      imagenIntro1Widget =
          _buildImageWidget(imageUrlIntro1, 'Intro1', 'ima/Intro1.png');
      imagenCapacitacionWidget = _buildImageWidget(
          imageUrlCapacitacion, 'Capacitacion', 'ima/Capacitacion.png');
      imagenSiembraWidget =
          _buildImageWidget(imageUrlSiembra, 'Siembra', 'ima/Siembra.png');
      imagenSiembra2Widget =
          _buildImageWidget(imageUrlSiembra2, 'Siembra2', 'ima/Siembra2.png');
      imagenImaCWidget =
          _buildImageWidget(imageUrlimaC, 'imaC', 'ima/imaC.png');
    });
  }

  void verificarRolUsuario() async {
    User? usuario = FirebaseAuth.instance.currentUser;
    if (usuario != null) {
      String rol = await _authService.obtenerRolUsuario();
      if (mounted) {
        setState(() {
          esAdmin = rol == 'Administrador';
        });
      }
    } else {
      setState(() {
        esAdmin = false;
      });
    }
  }

  Widget _buildImageWidget(
      String? firebaseImageUrl, String localImageKey, String defaultImageAsset,
      {double width = 200, double height = 150}) {
    Widget imageWidget;

    // Si la imagen proviene de Firebase y no se ha seleccionado ninguna imagen localmente
    if (firebaseImageUrl != null &&
        _imagenesSeleccionadas[localImageKey] == null) {
      imageWidget = Image.network(
        firebaseImageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          return Text('Error al cargar la imagen: $error');
        },
      );
    }
    // Si se ha seleccionado una imagen localmente
    else if (_imagenesSeleccionadas[localImageKey] != null) {
      imageWidget = Image.file(
        _imagenesSeleccionadas[localImageKey]!,
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    }
    // Si no se ha seleccionado ninguna imagen, se usa una imagen por defecto
    else {
      imageWidget = Image.asset(
        defaultImageAsset,
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    }

    // Envolver en IgnorePointer si el formulario está en modo de solo lectura
    return widget.modoSoloLectura
        ? IgnorePointer(child: imageWidget)
        : imageWidget;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffECF8E5),
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
        floatingActionButton: esAdmin && _esModoEdicion
            ? FloatingActionButton(
                onPressed: _guardarFormulario,
                heroTag: 'uniqueTagForFormulario',
                child: const Icon(Icons.save),
                backgroundColor: Colors.green,
              )
            : null,
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
                          'ima/Udec.png',
                          fit: BoxFit.contain,
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'ima/LogoICAMTrail.png',
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
                          'ima/Onu.png',
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
                          'ima/Meba.png',
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
                          'ima/Log.png',
                          fit: BoxFit.contain,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: TextFormField(
                    controller: tituloController,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2F3B69),
                    ),
                    decoration: const InputDecoration(
                      hintText: "Escribe el titulo aqui...",
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.center,
                    readOnly: !_esModoEdicion,
                    onSaved: (value) {},
                  ),
                ),
                Image.asset('ima/Duracion.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _mostrarInformacion = !_mostrarInformacion;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff5EC57E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 15),
                    ),
                    child: const Text('Comienza ahora',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ),
                Visibility(
                  visible: _mostrarInformacion,
                  child: Column(
                    children: [
                      const Icon(Icons.arrow_downward,
                          size: 30, color: Color(0xff5EC57E)),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Center(
                          // Envuelve tu GIF con un widget Center
                          child: Image.asset(
                            'assets/Gif/Objj.gif',
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ),
                      const Text(
                        'Objetivos de Aprendizajes',
                        style: TextStyle(
                            color: Color(0xff5EC57E),
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffECF8E5),
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: AgregarCampo(
                                  controller: objetivosController,
                                  readOnly: !_esModoEdicion,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Escribe tus objetivos aquí",
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset('ima/Form1.png',
                            width: 150, height: 150),
                      ),
                      Visibility(
                        visible: _mostrarInformacion,
                        child: Column(
                          children: [
                            const Text(
                              'Materiales',
                              style: TextStyle(
                                  color: Color(0xff5EC57E),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: AgregarCampo(
                                controller: materialesController,
                                readOnly: !_esModoEdicion,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  hintText: "Escribe los materiales aquí",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade700,
                              width: 2.0,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.asset('assets/Gif/lib.gif'),
                            ),
                            const SizedBox(width: 0),
                            const Flexible(
                              child: Text(
                                '1. Introducción a la medida (10 min)',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'Arial',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            const Text(
                              'Ronda participativa de intercambio de conocimiento',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff5EC57E),
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                fontFamily: 'Arial',
                              ),
                            ),
                            Image.asset(
                              'assets/Gif/Pregunta12.gif',
                              width: 120,
                              height: 120,
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(1),
                              child: TextFormField(
                                controller: rondaController,
                                readOnly: !_esModoEdicion,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: const InputDecoration(
                                  hintText: "Escribe aquí tu texto...",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: const Color(0xffECF8E5),
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.8),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Mensajes clave a transmitir',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff347571),
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              controller: mensajeController,
                              readOnly: !_esModoEdicion,
                              maxLines: 1,
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black87),
                              decoration: const InputDecoration(
                                hintText: "Escribe el título aquí...",
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 10),
                              ),
                            ),
                            const SizedBox(height: 20),
                            AgregarCampo(
                              controller: mensajesController,
                              readOnly: !_esModoEdicion,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: "Escribe los mensajes aquí",
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: const EdgeInsets.all(12),
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: const Color(0xffF7F7F7),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: widget.modoSoloLectura
                                  ? null
                                  : () => _seleccionarImagen('Intro1'),
                              child: _buildImageWidget(
                                  imageUrlIntro1, 'Intro1', 'ima/Intro1.png',
                                  width: 200, height: 170),
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              controller: textoController,
                              readOnly: !_esModoEdicion,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black87),
                              decoration: const InputDecoration(
                                hintText: "Escribe aquí tu texto...",
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: const Color(0xff366A3F),
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
                                        fontSize: 22),
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
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade700,
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xffF6F6E9),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.green.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey.shade700,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset('ima/proyecto.png',
                                      fit: BoxFit.contain),
                                ),
                              ),
                            ),
                            const SizedBox(width: 0),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: aController,
                                  readOnly: !_esModoEdicion,
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0xff347571),
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: "a) Escribe aquí...",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: const Color(0xffF7F7F7),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 50.0, bottom: 20.0),
                              child: Text(
                                'Actividad práctica',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff347571),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: practicaController,
                              readOnly: !_esModoEdicion,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black87),
                              decoration: const InputDecoration(
                                hintText: "Escribe aquí tu texto...",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: const Color(0xffECF8E5),
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.8),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: practica1Controller,
                              readOnly: !_esModoEdicion,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              style: const TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "* Escribe las actividades aquí",
                                contentPadding: const EdgeInsets.all(12.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: widget.modoSoloLectura
                                  ? null
                                  : () => _seleccionarImagen('Capacitacion'),
                              child: Container(
                                width: 200,
                                height: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: const DecorationImage(
                                    image: AssetImage('ima/Capacitacion.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: practica2Controller,
                              readOnly: !_esModoEdicion,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 18),
                              decoration: const InputDecoration(
                                hintText: "Escribe aquí tu texto...",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade700,
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xffF6F6E9),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.green.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey.shade700,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset('ima/proyecto.png',
                                      fit: BoxFit.contain),
                                ),
                              ),
                            ),
                            const SizedBox(width: 0),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: bController,
                                  readOnly: !_esModoEdicion,
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0xff347571),
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: "b) Escribe aquí...",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Text(
                                'Actividad didáctica',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff347571),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  fontFamily: 'Arial',
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: Image.asset(
                                'assets/Gif/13.gif',
                                width: 120,
                                height: 120,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: didacticaController,
                              readOnly: !_esModoEdicion,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black),
                              decoration: const InputDecoration(
                                hintText: "Escribe aquí tu texto...",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(10),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: widget.modoSoloLectura
                                  ? null
                                  : () => _seleccionarImagen('Siembra'),
                              child: _buildImageWidget(
                                  imageUrlSiembra, 'Siembra', 'ima/Siembra.png',
                                  width: 150, height: 150),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextFormField(
                                controller: didactica1Controller,
                                readOnly: !_esModoEdicion,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(fontSize: 16),
                                decoration: const InputDecoration(
                                  hintText: "Escribe aquí...",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextFormField(
                                controller: didactica2Controller,
                                readOnly: !_esModoEdicion,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(fontSize: 16),
                                decoration: const InputDecoration(
                                  hintText: "Escribe aquí...",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: widget.modoSoloLectura
                                  ? null
                                  : () => _seleccionarImagen('Siembra2'),
                              child: _buildImageWidget(imageUrlSiembra2,
                                  'Siembra2', 'ima/Siembra2.png',
                                  width: 150, height: 150),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade700,
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xffF6F6E9),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.green.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey.shade700,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset('ima/proyecto.png',
                                      fit: BoxFit.contain),
                                ),
                              ),
                            ),
                            const SizedBox(width: 0),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: cController,
                                  readOnly: !_esModoEdicion,
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0xff347571),
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: "c) Escribe aquí...",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Text(
                                'Actividad didáctica',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff347571),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: didactica3Controller,
                              readOnly: !_esModoEdicion,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              decoration: const InputDecoration(
                                hintText: "Escribe aquí...",
                                border: InputBorder.none,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: AgregarCampo(
                                controller: didactica4Controller,
                                readOnly: !_esModoEdicion,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xff347571)),
                                  ),
                                  hintText: "Escribe las actividades aquí",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15.0),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              color: const Color(0xffECF8E5),
                              borderRadius: BorderRadius.circular(12.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.8),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: widget.modoSoloLectura
                                      ? null
                                      : () => _seleccionarImagen('imaC'),
                                  child: Container(
                                    width: 200,
                                    height: 170,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: _buildImageWidget(
                                          imageUrlimaC, 'imaC', 'ima/imaC.png'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: didactica5Controller,
                                    readOnly: !_esModoEdicion,
                                    maxLines: null,
                                    keyboardType: TextInputType.multiline,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 16),
                                    decoration: const InputDecoration(
                                      hintText: "Escribe aquí tu texto...",
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            color: const Color(0xffE4DDDD),
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: Image.asset('ima/Tip.png'),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextFormField(
                                    controller: tipController,
                                    readOnly: !_esModoEdicion,
                                    maxLines: null,
                                    keyboardType: TextInputType.multiline,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(fontSize: 12),
                                    decoration: const InputDecoration(
                                      hintText: "Escribe aquí tu texto...",
                                      border: InputBorder.none,
                                    ),
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
        bottomNavigationBar: Container(
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

  void _guardarFormulario() async {
    try {
      Map<String, dynamic> datosFormulario = {
        'titulo': tituloController.text,
        'objetivos': objetivosController.text,
        'materiales': materialesController.text,
        'ronda': rondaController.text,
        'mensaje': mensajeController.text,
        'mensajes': mensajesController.text,
        'texto': textoController.text,
        'a': aController.text,
        'b': bController.text,
        'c': cController.text,
        'practica': practicaController.text,
        'practica1': practica1Controller.text,
        'practica2': practica2Controller.text,
        'didactica': didacticaController.text,
        'didactica1': didactica1Controller.text,
        'didactica2': didactica2Controller.text,
        'didactica3': didactica3Controller.text,
        'didactica4': didactica4Controller.text,
        'didactica5': didactica5Controller.text,
        'tip': tipController.text,
      };

      String? imageUrlIntro1 =
          await _cargarImagen(_imagenesSeleccionadas['Intro1'], 'intro1');
      String? imageUrlCapacitacion = await _cargarImagen(
          _imagenesSeleccionadas['Capacitacion'], 'capacitacion');
      String? imageUrlSiembra =
          await _cargarImagen(_imagenesSeleccionadas['Siembra'], 'siembra');
      String? imageUrlSiembra2 =
          await _cargarImagen(_imagenesSeleccionadas['Siembra2'], 'siembra2');
      String? imageUrlimaC =
          await _cargarImagen(_imagenesSeleccionadas['imaC'], 'imaC');

      if (widget.proyecto != null) {
        // Actualizar el proyecto existente
        await FirebaseFirestore.instance
            .collection('proyectos')
            .doc(widget.proyecto!.id)
            .update(datosFormulario);
        await FirebaseFirestore.instance
            .collection('imaProyectos')
            .doc(widget.proyecto!.id)
            .set({
          'imagenUrlIntro1': imageUrlIntro1,
          'imagenUrlCapacitacion': imageUrlCapacitacion,
          'imagenUrlSiembra': imageUrlSiembra,
          'imagenUrlSiembra2': imageUrlSiembra2,
          'imagenUrlimaC': imageUrlimaC,
        }, SetOptions(merge: true));
      } else {
        // Crear un nuevo proyecto
        DocumentReference newProjectRef = await FirebaseFirestore.instance
            .collection('proyectos')
            .add(datosFormulario);
        await FirebaseFirestore.instance
            .collection('imaProyectos')
            .doc(newProjectRef.id)
            .set({
          'imagenUrlIntro1': imageUrlIntro1,
          'imagenUrlCapacitacion': imageUrlCapacitacion,
          'imagenUrlSiembra': imageUrlSiembra,
          'imagenUrlSiembra2': imageUrlSiembra2,
          'imagenUrlimaC': imageUrlimaC,
        });
      }

      // Actualizar las URLs de imagen en el estado del widget
      setState(() {
        this.imageUrlIntro1 = imageUrlIntro1 ?? this.imageUrlIntro1;
        this.imageUrlCapacitacion =
            imageUrlCapacitacion ?? this.imageUrlCapacitacion;
        this.imageUrlSiembra = imageUrlSiembra ?? this.imageUrlSiembra;
        this.imageUrlSiembra2 = imageUrlSiembra2 ?? this.imageUrlSiembra2;
        this.imageUrlimaC = imageUrlimaC ?? this.imageUrlimaC;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text(
            'Formulario guardado con éxito',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 3),
        ));

        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Proyectos()),
          );
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al guardar el formulario: $e')));
      }
    }
  }

  Future<String?> _cargarImagen(File? imagen, String nombre) async {
    if (imagen == null) return null;
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      String filePath = 'imagenes/$nombre';
      UploadTask uploadTask = storage.ref().child(filePath).putFile(imagen);
      TaskSnapshot taskSnapshot = await uploadTask;
      if (taskSnapshot.state == TaskState.success) {
        String url = await taskSnapshot.ref.getDownloadURL();
        return url;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
