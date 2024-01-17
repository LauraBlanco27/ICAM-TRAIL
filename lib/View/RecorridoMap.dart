import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recorrido del Sendero')),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          // Establece la posición inicial del mapa
          target: LatLng(37.7749, -122.4194), // Reemplaza con tu ubicación inicial
          zoom: 11.0,
        ),
        // Aquí puedes agregar polilíneas para mostrar la ruta realizada
      ),
    );
  }
}