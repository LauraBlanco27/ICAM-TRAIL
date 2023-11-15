import 'package:flutter/material.dart';
import 'AcercaDe.dart';
import 'Desafios.dart';
import 'Login.dart';
import 'ManualUsuario.dart';
import 'Perfil.dart';
import 'Proyectos.dart';
import 'Senderos.dart';
import 'Servicios.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'TerminosCondiciones.dart';

class PagPrincipal extends StatelessWidget {
  const PagPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: const MenuLateral(),
        body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'ima/fondoP.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const MyScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  Future<String> obtenerUrlFotoPerfil(String userId) async {
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    try {
      String rutaImagen = 'perfil/$userId';
      firebase_storage.Reference ref = storage.ref(rutaImagen);
      String url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      return '';
    }
  }

  Stream<Map<String, dynamic>> obtenerDatosUsuario(String userId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists) {
        return snapshot.data() ?? {};
      } else {
        return {};
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    User? usuario = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                usuario != null
                    ? StreamBuilder<Map<String, dynamic>>(
                        stream: obtenerDatosUsuario(usuario.uid),
                        builder: (context, snapshotDatosUsuario) {
                          if (snapshotDatosUsuario.connectionState ==
                              ConnectionState.waiting) {
                            return const DrawerHeader(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshotDatosUsuario.hasError) {
                            return const DrawerHeader(
                              child: Text(
                                  'Error al obtener los datos del usuario'),
                            );
                          } else {
                            Map<String, dynamic> datosUsuario =
                                snapshotDatosUsuario.data ?? {};
                            String nombre = datosUsuario['nombre'] ??
                                'Nombre no disponible';
                            String correo = datosUsuario['correo'] ??
                                'Correo no disponible';
                            return FutureBuilder<String>(
                              future: obtenerUrlFotoPerfil(usuario.uid),
                              builder: (context, snapshotFotoPerfil) {
                                if (snapshotFotoPerfil.connectionState ==
                                    ConnectionState.waiting) {
                                  return const DrawerHeader(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshotFotoPerfil.hasError) {
                                  return const DrawerHeader(
                                    child: Text(
                                        'Error al obtener la foto de perfil'),
                                  );
                                } else {
                                  String urlFotoPerfil =
                                      snapshotFotoPerfil.data ?? '';
                                  return UserAccountsDrawerHeader(
                                    decoration: const BoxDecoration(
                                      color: Color(
                                          0xff072931), // Cambia 'tuColorDeseado' por el color que quieras
                                    ),
                                    accountName: Text(nombre),
                                    accountEmail: Text(correo),
                                    currentAccountPicture: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(urlFotoPerfil),
                                    ),
                                  );
                                }
                              },
                            );
                          }
                        },
                      )
                    : const UserAccountsDrawerHeader(
                        accountName: Text('Invitado'),
                        accountEmail: Text(''),
                      ),
                _crearListTile(
                  icono: Icons.book,
                  texto: 'Manual de Usuario',
                  onTap: () {
                    _abrirManualUsuario(context);
                  },
                ),
                _crearListTile(
                  icono: Icons.description,
                  texto: 'Términos y Condiciones',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TerminosCondiciones(),
                      ),
                    );
                  },
                ),
                _crearListTile(
                  icono: Icons.info,
                  texto: 'Acerca De',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AcercaDe(),
                      ),
                    );
                  },
                ),
                _crearListTile(
                  icono: Icons.exit_to_app,
                  texto: 'Salir de la App',
                  onTap: () {
                    _confirmarCerrarSesion(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _crearListTile({required IconData icono, required String texto, required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
      child: Row(
        children: [
          Icon(icono, color: Colors.grey.shade600, size: 24.0),
          const SizedBox(width: 20.0),
          Expanded( // Asegúrate de que el texto no se superponga con el icono
            child: Text(
              texto,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: Colors.black, // Color negro para mejor contraste
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 13.0, color: Colors.grey.shade400),
        ],
      ),
    ),
    splashColor: Colors.grey.shade200,
    highlightColor: Colors.grey.shade100,
  );
}

void _abrirManualUsuario(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => ManualUsuario()),
  );
}

void _confirmarCerrarSesion(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Cerrar Sesión"),
        content: Text("¿Estás seguro de que quieres cerrar sesión?"),
        actions: <Widget>[
          TextButton(
            child: Text("Cancelar"),
            onPressed: () {
              Navigator.of(context).pop(); // Cierra el cuadro de diálogo
            },
          ),
          TextButton(
            child: Text("Aceptar"),
            onPressed: () {
              // Cerrar sesión y redirigir al login
              _cerrarSesion(context);
            },
          ),
        ],
      );
    },
  );
}

void _cerrarSesion(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false, // Esto elimina todas las rutas anteriores
  );
}

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                color: const Color(0xffd9d9d9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 8,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildButton(
                              context,
                              'Proyectos Educativos',
                              'ima/proyectos.png',
                              () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Proyectos()))),
                          _buildButton(
                              context,
                              'Senderos Ecológicos',
                              'ima/ruta.png',
                              () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Senderos()))),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildButton(
                              context,
                              'Servicios',
                              'ima/servicio.png',
                              () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Servicios()))),
                          _buildButton(
                              context,
                              'Desafíos',
                              'ima/objetivo.png',
                              () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Desafios()))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildBottomBar(context),
        ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      color: const Color(0xff072931),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Color(0xffd9d9d9)),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => PagPrincipal()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Color(0xffd9d9d9)),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Perfil()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, String text, String imagePath, VoidCallback onTap) {
    double size = MediaQuery.of(context).size.width * 0.3;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color.fromRGBO(7, 41, 49, 0.5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Image.asset(
                imagePath,
                width: size * 0.5,
                height: size * 0.5,
              ),
            ),
            SizedBox(height: size * 0.05),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
