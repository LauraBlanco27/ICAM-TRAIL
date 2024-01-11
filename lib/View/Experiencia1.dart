import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:http/http.dart' as http;

class ARSendero1 extends StatefulWidget {
  @override
  _ARSendero1State createState() => _ARSendero1State();
}

class _ARSendero1State extends State<ARSendero1> {
  late ArCoreController arCoreController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrViewController;
  String? qrData;
  bool showARView = true;
  bool isLoading = false;

  @override
  void dispose() {
    arCoreController.dispose();
    qrViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AR Sendero'),
        actions: [
          if (isLoading)
            Padding(
              padding: EdgeInsets.all(10.0),
              child: CircularProgressIndicator(color: Colors.white),
            ),
          IconButton(
            icon: Icon(showARView ? Icons.qr_code_scanner : Icons.camera),
            onPressed: () => toggleView(),
          ),
        ],
      ),
      floatingActionButton: showARView ? FloatingActionButton(
        onPressed: () => clearARContent(),
        child: Icon(Icons.close),
      ) : null,
      body: Stack(
        children: [
          showARView ? ArCoreView(onArCoreViewCreated: _onARCoreViewCreated) : _buildQRView(),
          Positioned(
            bottom: 20,
            left: 20,
            child: Text(qrData ?? 'Escanea un código QR'),
          ),
        ],
      ),
    );
  }

  Widget _buildQRView() => QRView(key: qrKey, onQRViewCreated: _onQRViewCreated);

  void toggleView() {
    setState(() {
      showARView = !showARView;
      if (!showARView) {
        qrViewController?.resumeCamera();
      } else {
        qrViewController?.pauseCamera();
      }
    });
  }

  void _onARCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
  }

  void _onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    controller.scannedDataStream.listen((scanData) => handleQRData(scanData.code));
  }

  void handleQRData(String? qrCode) {
    if (qrCode == null || qrCode.isEmpty) return;
    setState(() {
      qrData = qrCode;
      isLoading = true; // Iniciar el indicador de carga
    });
    _addImageToAR(qrCode);
  }

  void _addImageToAR(String imageUrl) {
    downloadImage(imageUrl).then((imageBytes) {
      final texture = ArCoreMaterial(textureBytes: imageBytes);
      final imageNode = ArCoreNode(
        shape: ArCoreCube(
          materials: [texture],
          size: vector.Vector3(1, 1, 0.1),
        ),
        position: vector.Vector3(0, 0, -1),
      );
      arCoreController.addArCoreNode(imageNode);
      setState(() => isLoading = false); // Finalizar el indicador de carga
    });
  }

  Future<Uint8List> downloadImage(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.bodyBytes;
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      print(e);
      return Uint8List(0);
    }
  }

  void clearARContent() {
    arCoreController.dispose();

  }
}