class IncidenteReporte {
  String descripcion;
  DateTime fecha;
  double latitud;
  double longitud;
  String? id;

  IncidenteReporte({
    required this.descripcion,
    required this.fecha,
    required this.latitud,
    required this.longitud,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'descripcion': descripcion,
      'fecha': fecha,
      'latitud': latitud,
      'longitud': longitud,
    };
  }
}