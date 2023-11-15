import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/models/ar_anchor.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/datatypes/hittest_result_types.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
import 'package:flutter/services.dart';
import 'package:proyecto1/View/progress_panel.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;
import 'dart:math';
import 'InfoSendero1.dart';

class ARSendero1 extends StatefulWidget {
  @override
  _ARSendero1State createState() => _ARSendero1State();
}

class _ARSendero1State extends State<ARSendero1> {
  ARSessionManager? arSessionManager;
  ARObjectManager? arObjectManager;
  ARAnchorManager? arAnchorManager;
  bool? isARCoreCompatible;
  List<ARNode> nodes = [];
  List<ARAnchor> anchors = [];

  int modelosVistos = 0;
  double distanciaRecorrida = 0.0;


  @override
  void initState() {
    super.initState();
    checkARCoreCompatibility();
  }

  void checkARCoreCompatibility() async {
    try {
      bool? isSupported = await ArCoreController.checkArCoreAvailability();
      setState(() {
        isARCoreCompatible = isSupported;
      });
    } catch (e) {
      print("Error checking ARCore availability: $e");
      setState(() {
        isARCoreCompatible = false; // Considerar no compatible si hay un error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sendero Ecológico AR"),
        actions: [
          IconButton(
            icon: Icon(Icons.timeline),
            onPressed: _mostrarProgreso,
          ),
        ],
      ),
      body: ARView(
        onARViewCreated: onARViewCreated,
        planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: onRemoveEverything,
            child: Icon(Icons.delete_outline),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _finalizarExperiencia,
            child: Icon(Icons.stop),
          ),
        ],
      ),
    );
  }

  void _mostrarProgreso() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ProgressPanel(
          modelosVistos: modelosVistos,
          distanciaRecorrida: distanciaRecorrida,
        );
      },
    );
  }

  void _finalizarExperiencia() {
    // Navega a la pantalla InfoSendero1 y reemplaza la pantalla actual
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => Sendero1()),
    );
  }

  void onARViewCreated(ARSessionManager arSessionManager, ARObjectManager arObjectManager, ARAnchorManager arAnchorManager, ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;
    this.arAnchorManager = arAnchorManager;

    // Configurar la detección de planos
    arSessionManager.onPlaneOrPointTap = onPlaneOrPointTapped;
  }

  Future<void> onPlaneOrPointTapped(List<ARHitTestResult> hitTestResults) async {
    for (var hitTestResult in hitTestResults) {
      if (hitTestResult.type == ARHitTestResultType.plane) {
        var newAnchor = ARPlaneAnchor(transformation: hitTestResult.worldTransform);
        bool? didAddAnchor = await arAnchorManager!.addAnchor(newAnchor);
        if (didAddAnchor!) {
          // Añadir un modelo 3D al ancla
          var newNode = ARNode(
            type: NodeType.localGLTF2,  // Asegúrate de que tu modelo es compatible
            uri: "Models/Invernadero.gltf",  // Ruta al modelo 3D en tus activos
            scale: Vector3(0.2, 0.2, 0.2),  // Ajusta la escala según sea necesario
            position: Vector3(0.0, 0.0, 0.0),  // Posición inicial del modelo
          );
          bool? didAddNodeToAnchor = await arObjectManager!.addNode(newNode, planeAnchor: newAnchor);
          if (didAddNodeToAnchor!) {
            print("Modelo 3D añadido exitosamente");
          } else {
            print("Error al añadir el modelo 3D");
          }
        }
      }
    }
  }

  Future<void> onNodeTapped(List<String> nodeIds) async {
    // Lógica para manejar el toque en los nodos
  }

  void onRemoveEverything() {
    anchors.forEach((anchor) {
      arAnchorManager!.removeAnchor(anchor);
    });
    anchors.clear();
    nodes.clear();
  }

  Widget buildAlternativeExperience() {
    return Scaffold(
      appBar: AppBar(title: Text("Experiencia Alternativa")),
      body: Center(child: Text("ARCore no es compatible con este dispositivo")),
    );
  }

  @override
  void dispose() {
    arSessionManager?.dispose();
    super.dispose();
  }
}

