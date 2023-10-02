import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart';

class ARSendero1 extends StatefulWidget {
  @override
  ARSendero1State createState() => ARSendero1State();
}

class ARSendero1State extends State<ARSendero1> {
  late ArCoreController arCoreController;

  _requestPermissions() async {
    await Permission.camera.request();
    await Permission.location.request();
  }

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
      ),
    );
  }

  _onArCoreViewCreated(ArCoreController _arcoreController) {
    arCoreController = _arcoreController;

    // Aquí puedes añadir objetos en el mundo real, por ejemplo:

    final node = ArCoreReferenceNode(
      name: 'Sendero',
      object3DFileName: 'tu_modelo.obj', // Asegúrate de tener este archivo en los assets de Android
      position: Vector3(0, 0, -1), // Usamos Vector3 aquí
      scale: Vector3(0.5, 0.5, 0.5), // y aquí también
    );

    arCoreController.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}