
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'PDFScreen.dart';

class ManualUsuario extends StatefulWidget {
  @override
  _ManualUsuarioState createState() => _ManualUsuarioState();
}

class _ManualUsuarioState extends State<ManualUsuario> {
  String pathPDF = "";

  @override
  void initState() {
    super.initState();

    fromAsset('assets/ManualUsuario.pdf', 'ManualUsuario.pdf').then((f) {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PDFScreen(path: f.path),
          ),
        );
      }
    });
  }

  Future<File> fromAsset(String asset, String filename) async {
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error convirtiendo el archivo!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    // Dado que initState manejará la navegación a PDFScreen,
    // aquí puedes mostrar un indicador de carga hasta que initState navegue.
    return MaterialApp(
      home: Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}