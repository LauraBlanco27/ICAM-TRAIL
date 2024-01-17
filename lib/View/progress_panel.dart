import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Model/Reportes.dart';
import 'RecorridoMap.dart';
import 'Servicios.dart';

Future<void> reportarIncidente(BuildContext context, String descripcion, double latitud, double longitud) async {
  DateTime fecha = DateTime.now();

  IncidenteReporte reporte = IncidenteReporte(
    descripcion: descripcion,
    fecha: fecha,
    latitud: latitud,
    longitud: longitud, id: '',
  );

  await guardarReporte(reporte.descripcion, context);

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Incidente reportado con éxito')),
  );
}

class ProgressPanel extends StatelessWidget {
  final int modelosVistos;
  final double distanciaRecorrida;
  final double distanciaTotal;

  const ProgressPanel({
    Key? key,
    required this.modelosVistos,
    required this.distanciaRecorrida,
    this.distanciaTotal = 1.0,
  }) : super(key: key);



  void mostrarDialogoReporte(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reportar Incidente'),
          content: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Describe el incidente aquí...',
            ),
            maxLines: 3,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Reportar'),
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  reportarIncidente(
                    context,
                    _controller.text,
                    37.7749, // Ejemplo de latitud
                    -122.4194, // Ejemplo de longitud
                  );
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> tomarFotoYGuardar(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final User? user = FirebaseAuth.instance.currentUser;

    // Verificar si el usuario está autenticado
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, inicia sesión primero.')),
      );
      return;
    }

    // Tomar una foto
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      File imageFile = File(photo.path);
      String filePath = 'users/${user.uid}/${DateTime.now()}.jpg';

      try {
        // Subir la foto a Firebase Storage
        TaskSnapshot snapshot = await FirebaseStorage.instance.ref(filePath).putFile(imageFile);

        // Opcional: Obtener la URL de la imagen y guardarla en Firestore o Realtime Database
        String fileURL = await snapshot.ref.getDownloadURL();
        // Aquí podrías guardar fileURL en Firestore o Realtime Database

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Foto subida con éxito: $fileURL')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al subir la foto: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se seleccionó ninguna foto')),
      );
    }
  }

  void onMapIconTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MapScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double porcentajeRecorrido = distanciaRecorrida / distanciaTotal;

    void onPhotoIconTap() {
      tomarFotoYGuardar(context);
    }

    void onMapIconTap() {

    }

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Progreso del Sendero",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomPaint(
            painter: ProgressLine(porcentajeRecorrido),
            child: Container(height: 30),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${distanciaRecorrida.toStringAsFixed(2)} km recorridos",
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                "${(distanciaTotal - distanciaRecorrida).toStringAsFixed(2)} km restantes",
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => mostrarDialogoReporte(context),
                child: const Icon(Icons.send_to_mobile, color: Colors.white),
              ),
              GestureDetector(
                onTap: onPhotoIconTap,
                child: const Icon(Icons.photo, color: Colors.white),
              ),
              GestureDetector(
                onTap: onMapIconTap,
                child: const Icon(Icons.map, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );


  }
}

class ProgressLine extends CustomPainter {
  final double porcentaje;

  ProgressLine(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    var paintProgress = Paint()
      ..color = Colors.green
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    var startPoint = Offset(0, size.height / 2);
    var endPoint = Offset(size.width, size.height / 2);
    var progressPoint = Offset(size.width * porcentaje, size.height / 2);

    canvas.drawLine(startPoint, endPoint, paint);
    canvas.drawLine(startPoint, progressPoint, paintProgress);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}