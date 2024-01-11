import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Evento {
  String id;
  String titulo;
  String descripcion;
  DateTime fecha;
  int hora = 0;

  Evento({
    this.id = '',
    required this.titulo,
    required this.descripcion,
    required this.fecha,
    required this.hora,
  });

  Map<String, dynamic> toMap() {
    DateTime fechaSolo = DateTime(fecha.year, fecha.month, fecha.day);
    return {
      'titulo': titulo,
      'descripcion': descripcion,
      'fecha': Timestamp.fromDate(fechaSolo),
      'hora': DateFormat('HH:mm').format(DateTime(fecha.year, fecha.month, fecha.day, hora ~/ 60, hora % 60)), // Formato de 24 horas
    };
  }

  Future<void> saveToFirebase() async {
    final doc = id.isNotEmpty
        ? FirebaseFirestore.instance.collection('eventos').doc(id)
        : FirebaseFirestore.instance.collection('eventos').doc();
    await doc.set(toMap());
    id = doc.id;
  }

  Future<void> deleteFromFirebase() async {
    if (id.isNotEmpty) {
      final doc = FirebaseFirestore.instance.collection('eventos').doc(id);
      await doc.delete();
    }
  }

  Future<void> updateInFirebase() async {
    if (id.isNotEmpty) {
      final doc = FirebaseFirestore.instance.collection('eventos').doc(id);
      await doc.update(toMap());
    }
  }

  static Evento fromMap(Map<String, dynamic> map, String id) {

    if (map['titulo'] == null || map['titulo'] is! String) {
      throw Exception('El campo "titulo" es obligatorio y debe ser una cadena de texto.');
    }
    if (map['descripcion'] == null || map['descripcion'] is! String) {
      throw Exception('El campo "descripcion" es obligatorio y debe ser una cadena de texto.');
    }
    if (map['fecha'] == null || map['fecha'] is! Timestamp) {
      throw Exception('El campo "fecha" es obligatorio y debe ser un Timestamp.');
    }

    int hora = 0;
    if (map['hora'] is int) {
      hora = map['hora'];
    } else if (map['hora'] is String) {
      List<String> parts = map['hora'].split(':');
      if (parts.length == 2) {
        try {
          int horas = int.parse(parts[0]);
          int minutos = int.parse(parts[1]);
          hora = horas * 60 + minutos;
        } catch (e) {
          throw Exception('Formato de hora no válido: ${map['hora']}');
        }
      } else {
        throw Exception('Formato de hora no válido: ${map['hora']}');
      }
    } else {
      throw Exception('El formato del campo "hora" no es válido.');
    }

    return Evento(
      id: id,
      titulo: map['titulo'],
      descripcion: map['descripcion'],
      fecha: (map['fecha'] as Timestamp).toDate(),
      hora: hora,
    );
  }
}