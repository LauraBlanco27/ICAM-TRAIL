import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;

class ARSendero2 extends StatefulWidget {
  @override
  _ARSendero2State createState() => _ARSendero2State();
}

class _ARSendero2State extends State<ARSendero2> {
  ArCoreController? arCoreController;
  bool shouldConfigureSession = false;

  List<Map<String, dynamic>> marcadores = [
    {
      'id': 'marcador1',
      'markerImageUrl': 'ima/Marcador1.jpg',
      'model3DUrl': 'assets/Models/Bee.glb',
      // Agrega aquí más datos si es necesario
    },
    {
      'id': 'marcador2',
      'markerImageUrl': 'url_de_la_imagen_del_marcador_2',
      'model3DUrl': 'url_del_modelo_3d_2',
      // Agrega aquí más datos si es necesario
    },
    // Añade más marcadores según sea necesario
  ];


  @override
  void initState() {
    super.initState();
    _addMarcadoresToFirestore();
  }

  void _configureArCoreSession() {
    if (arCoreController != null && shouldConfigureSession) {
      // Configura el controlador de ARCore aquí si es necesario
      // Puede que no necesites llamar a un método 'configure'
      shouldConfigureSession = false;
    }
  }

  @override
  void dispose() {
    arCoreController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ArCoreView(
      onArCoreViewCreated: _onArCoreViewCreated,
      enableTapRecognizer: true,
      // Puedes configurar más opciones aquí
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    _configureArCoreSession();
    loadMarkersFromFirestore(); // Simplemente llama a la función sin esperar un retorno.
  }

  void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.firstWhereOrNull(
            (hit) => hit.nodeName == "nombre_del_indicador"
    );

    if (hit != null) {
      // El usuario ha tocado el indicador
      _showModelOrInformation("Bee");
    }
  }

  Future<String> uploadFile(File file, String path) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    try {
      await storage.ref(path).putFile(file);
      String downloadURL = await storage.ref(path).getDownloadURL();
      return downloadURL;
    } catch (e) {
      // Manejar error
      print(e);
      return '';
    }
  }

  void loadMarkersFromFirestore() async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    try {
      QuerySnapshot querySnapshot = await db.collection('marcadores').get();

      for (var document in querySnapshot.docs) {
        // Aquí asumimos que 'document' contiene la información necesaria para cargar un marcador y su modelo 3D asociado.
        // Carga el marcador y configura ARCore para detectarlo.
        // Por ejemplo, suponiendo que 'document' tiene una URL de imagen del marcador y una URL del modelo 3D:
        String markerImageUrl = document['markerImageUrl'];
        String model3DUrl = document['model3DUrl'];
        _addArCoreNode(markerImageUrl, model3DUrl);
      }
    } catch (e) {
      // Manejar errores, por ejemplo, mostrar un mensaje al usuario
    }
  }

  void _addArCoreNode(String markerImageUrl, String model3DUrl) async {
    final textureBytes = await _loadTextureBytes(markerImageUrl);

    final indicatorNode = ArCoreNode(
      shape: ArCoreSphere(
        materials: [ArCoreMaterial(textureBytes: textureBytes)],
        radius: 0.1,
      ),
      position: vector.Vector3(0, 0, -1.5),
    );

    arCoreController?.addArCoreNode(indicatorNode);
  }

  Future<Uint8List> _loadTextureBytes(String assetPath) async {
    ByteData data = await rootBundle.load(assetPath);
    return data.buffer.asUint8List();
  }

  void _onMarkerDetected(ArCoreNode node, ArCoreHitTestResult hitTestResult) {
    // Aquí puedes mostrar la imagen asociada con el marcador detectado.
    // La implementación dependerá de cómo el plugin maneje la detección de marcadores y la visualización de imágenes.
  }
  Future<void> addMarkerToFirestore(String markerId, String markerImageUrl, [Map<String, dynamic>? additionalData]) async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    Map<String, dynamic> markerData = {
      'markerImageUrl': markerImageUrl,
      ...?additionalData, // Asegúrate de que esto sea un mapa o nulo
    };

    await db.collection('marcadores').doc(markerId).set(markerData);
  }

  void _addMarcadoresToFirestore() {
    for (var marcador in marcadores) {
      if (marcador['id'] != null && marcador['markerImageUrl'] != null) {
        addMarkerToFirestore(
          marcador['id'],
          marcador['markerImageUrl'],
          {
            'model3DUrl': marcador['model3DUrl'] ?? '',
            // Agrega aquí más datos si son parte del marcador
          },
        );
      }
    }
  }
  void _showModelOrInformation(String model3DUrl) {
    // Crear un nodo que contenga el modelado 3D.
    final modelNode = ArCoreReferenceNode(
      name: "Bee",
      objectUrl: model3DUrl, // URL o ruta local del archivo del modelo 3D.
      scale: vector.Vector3.all(0.5), // Escala del modelo (ajustar según sea necesario).
      position: vector.Vector3(0, 0, -1.5), // Posición del modelo.
      rotation: vector.Vector4(0, 0, 0, 1), // Rotación del modelo.
    );

    // Añadir el nodo del modelo 3D al controlador de ARCore.
    arCoreController?.addArCoreNode(modelNode);
  }
}