import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'InfoSendero2.dart';

class InfoRuta2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Primer rectángulo
          Container(
            color: Color(0xffd9d9d9),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => Sendero2()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Acción para el botón de búsqueda
                  },
                ),
              ],
            ),
          ),
          // Segundo rectángulo
          Container(
            color: Colors.white,
            height: 45,
            child: Center(
              child: Text(
                'Montaña de los Andes',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          // Espacio para el mapa
          Expanded(
            flex: 2, // Ocupará 2 partes del espacio disponible
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(-34.6083, -58.3719), // Ubicación inicial
                zoom: 10,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('id_1'),
                  position: LatLng(-34.6083, -58.3719),
                  infoWindow: InfoWindow(title: 'Punto de Interés 1'),
                ),
                // Puedes agregar más marcadores aquí
              },
            ),
          ),
          // Rectángulo para el perfil de ruta
          Expanded(
            flex: 1, // Ocupará 1 parte del espacio disponible
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff224C55),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Center(
                child: Text('Perfil de la Ruta'),
              ),
            ),
          ),
          // Rectángulo para el desnivel, altitud mínima y máxima
          Container(
            color: Color(0xff224C55),
            width: double.infinity,
            height: 177,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Desnivel       .......... 500m'),
                Text('Altitud        .......... 1000m'),
                Text('Altitud máxima .......... 1500m'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}