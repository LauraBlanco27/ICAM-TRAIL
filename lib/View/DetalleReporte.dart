import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'package:google_maps_webservice/directions.dart' as webservice;
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/directions.dart';

import '../Model/Reportes.dart';

String apiKey = dotenv.env['GOOGLE_API_KEY'] ?? "Clave API no encontrada";

class DetalleReporteScreen extends StatefulWidget {
  final IncidenteReporte reporte;

  const DetalleReporteScreen({Key? key, required this.reporte}) : super(key: key);

  @override
  _DetalleReporteScreenState createState() => _DetalleReporteScreenState();
}

class _DetalleReporteScreenState extends State<DetalleReporteScreen> {
  late GoogleMapController mapController;
  final directionsService = GoogleMapsDirections(apiKey: apiKey);
  List<LatLng> routeCoordinates = [];
  Set<maps.Polyline> _polylines = Set();
  PolylinePoints polylinePoints = PolylinePoints();
  LatLng? _currentLocation;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
    _getCurrentLocation();
  }

  Future<void> _checkLocationPermission() async {
    print('Checking location permissions...');
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      print('Location permissions are denied, requesting permissions...');
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are still denied.');
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Location permissions are permanently denied.');
      return Future.error('Location permissions are permanently denied.');
    }

    print('Location permissions granted.');
  }

  Future<void> _getCurrentLocation() async {
    try {
      print('Obtaining current location...');
      var currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentLocation = LatLng(currentPosition.latitude, currentPosition.longitude);
      });
      _getRoute();
    } catch (e) {
      print('Error obtaining location: $e');
      // Manejar la excepción...
    }
  }

  _getRoute() async {
    if (_currentLocation == null)
      return;

    LatLng destination = LatLng(widget.reporte.latitud, widget.reporte.longitud);

    var currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    LatLng origin = LatLng(currentPosition.latitude, currentPosition.longitude);

    final directions = await directionsService.directionsWithLocation(
      Location(lat: origin.latitude, lng: origin.longitude),
      Location(lat: destination.latitude, lng: destination.longitude),
      travelMode: webservice.TravelMode.driving,
    );

    var decodedPolyline = polylinePoints.decodePolyline(directions.routes[0].overviewPolyline.points);

    setState(() {
      routeCoordinates = decodedPolyline.map((point) => maps.LatLng(point.latitude, point.longitude)).toList();

      _polylines.add(maps.Polyline(
        polylineId: maps.PolylineId('route'),
        points: routeCoordinates,
        color: Colors.blue,
        width: 5,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildNavigationBar(),
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _currentLocation ?? LatLng(0, 0), // Posición inicial del mapa
                zoom: 15.0,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('reporte'),
                  position: LatLng(widget.reporte.latitud, widget.reporte.longitud),
                ),
              },
              polylines: _polylines,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Descripción:',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        widget.reporte.descripcion,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Fecha:',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat('dd/MM/yyyy HH:mm').format(widget.reporte.fecha),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (_currentLocation != null) {
      mapController.animateCamera(CameraUpdate.newLatLngZoom(_currentLocation!, 15.0));
    } else {
      mapController.animateCamera(CameraUpdate.newLatLngZoom(LatLng(widget.reporte.latitud, widget.reporte.longitud), 15.0));
    }
  }

  Widget _buildNavigationBar() {
    return SafeArea(
      child: Container(
        height: 45.0,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
          color: Color(0xffd9d9d9),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const Text(
              'Detalle del Reporte',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 30),
          ],
        ),
      ),
    );
  }

}