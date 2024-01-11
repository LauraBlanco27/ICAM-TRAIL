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

  List<Widget> _buildAdminMenu(BuildContext context, Map<String, dynamic> datosUsuario, String urlFotoPerfil) {
    List<Widget> menuItems = List<Widget>.from(_buildStandardMenu(context, datosUsuario, urlFotoPerfil));
    menuItems.add(
      _crearListTile(
        icono: Icons.admin_panel_settings,
        texto: 'Crear Administrador',
        onTap: () {
          _mostrarDialogoCrearAdmin(context);
        },
      ),
    );
    return menuItems;
  }

  List<Widget> _buildStandardMenu(BuildContext context, Map<String, dynamic> datosUsuario, String urlFotoPerfil) {
    return [
      _crearListTile(
        icono: Icons.book,
        texto: 'Manual de Usuario',
        onTap: () => _abrirManualUsuario(context),
      ),
      _crearListTile(
        icono: Icons.description,
        texto: 'Términos y Condiciones',
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => TerminosCondiciones()),
        ),
      ),
      _crearListTile(
        icono: Icons.info,
        texto: 'Acerca De',
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AcercaDe()),
        ),
      ),
      _crearListTile(
        icono: Icons.exit_to_app,
        texto: 'Salir de la App',
        onTap: () => _confirmarCerrarSesion(context),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    User? usuario = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: SafeArea(  // Envuelve tus widgets con SafeArea
        child: Column(
          children: [
            // Construcción del encabezado del usuario o un encabezado por defecto
            Builder(
              builder: (context) {
                if (usuario != null) {
                  return _buildUserHeader(context, usuario);
                } else {
                  return const DrawerHeader(
                    decoration: BoxDecoration(color: Color(0xff072931)),
                    child: Text('Bienvenido Invitado'),
                  );
                }
              },
            ),
            Expanded(
              child: _buildMenuItems(context, usuario),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserHeader(BuildContext context, User usuario) {
    return StreamBuilder<Map<String, dynamic>>(
      stream: obtenerDatosUsuario(usuario.uid),
      builder: (context, snapshotDatosUsuario) {
        if (snapshotDatosUsuario.connectionState == ConnectionState.waiting) {
          return const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xff072931)),
            child: CircularProgressIndicator(),
          );
        } else if (snapshotDatosUsuario.hasError || !snapshotDatosUsuario.hasData) {
          return const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xff072931)),
            child: Text('Error al obtener los datos del usuario'),
          );
        } else {
          String nombre = snapshotDatosUsuario.data?['nombre'] ?? 'Nombre no disponible';
          String correo = snapshotDatosUsuario.data?['correo'] ?? 'Correo no disponible';
          return FutureBuilder<String>(
            future: obtenerUrlFotoPerfil(usuario.uid),
            builder: (context, snapshotFotoPerfil) {
              String urlFotoPerfil = snapshotFotoPerfil.data ?? '';
              return UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xff072931),
                ),
                accountName: Text(nombre),
                accountEmail: Text(correo),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: urlFotoPerfil.isNotEmpty ? NetworkImage(urlFotoPerfil) : null,
                  child: urlFotoPerfil.isEmpty ? const Icon(Icons.person, size: 50) : null,
                ),
              );
            },
          );
        }
      },
    );
  }


  Widget _buildMenuItems(BuildContext context, User? usuario) {
    if (usuario != null) {
      return FutureBuilder<String>(
        future: obtenerRolDeUsuario(usuario.uid),
        builder: (context, snapshotRol) {
          if (snapshotRol.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          String rol = snapshotRol.data ?? 'Invitado';
          List<Widget> menuItems = rol == 'Administrador'
              ? _buildAdminMenu(context, {}, '')
              : _buildStandardMenu(context, {}, '');

          return ListView(children: menuItems);
        },
      );
    } else {
      return ListView(children: _buildStandardMenu(context, {}, ''));
    }
  }

  void _mostrarDialogoCrearAdmin(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Crear nuevo administrador'),
          content: TextField(
            controller: emailController,
            decoration: InputDecoration(hintText: 'Correo electrónico'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Crear'),
              onPressed: () {
                _asignarRolAdministrador(emailController.text, context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _asignarRolAdministrador(String email, BuildContext context) async {
    try {
      // Buscar el usuario por correo electrónico
      var userQuery = await FirebaseFirestore.instance.collection('users').where('correo', isEqualTo: email).get();
      if (userQuery.docs.isEmpty) {
        _mostrarMensaje(context, "Usuario no encontrado.");
        return;
      }

      var userId = userQuery.docs.first.id;

      // Actualizar el rol del usuario a 'Administrador'
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'rol': 'Administrador',
      });

      Navigator.of(context).pop(); // Cierra el diálogo
      _mostrarMensaje(context, "Administrador creado correctamente.");
    } catch (e) {
      print("Error al asignar rol de administrador: $e");
      if (e is FirebaseException) {
        _mostrarMensaje(context, "Firebase Error: ${e.message}");
      } else {
        _mostrarMensaje(context, "Error desconocido: $e");
      }
    }
  }

  void _mostrarMensaje(BuildContext context, String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Información'),
          content: Text(mensaje),
          actions: <Widget>[
            TextButton(
              child: Text('Aceptar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  Future<void> _crearAdministrador(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'correo': email,
        'rol': 'Administrador',
        // Agrega cualquier otro dato relevante
      });

      Navigator.of(context).pop(); // Cierra el diálogo
      // Mostrar confirmación o realizar acciones después de crear el administrador
    } catch (e) {
      // Manejar errores, por ejemplo, mostrar un mensaje
      print("Error al crear administrador: $e");
    }
  }

  Future<String> obtenerRolDeUsuario(String uid) async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        return userData['rol'] ?? 'Invitado';
      } else {
        return 'Invitado';
      }
    } catch (e) {
      print("Error al obtener rol de usuario: $e");
      return 'Invitado';
    }
  }

}

Widget _crearListTile(
    {required IconData icono,
    required String texto,
    required VoidCallback onTap}) {
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
          Expanded(
            // Asegúrate de que el texto no se superponga con el icono
            child: Text(
              texto,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: Colors.black, // Color negro para mejor contraste
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios,
              size: 13.0, color: Colors.grey.shade400),
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
        title: const Text("Cerrar Sesión"),
        content: const Text("¿Estás seguro de que quieres cerrar sesión?"),
        actions: <Widget>[
          TextButton(
            child: const Text("Cancelar"),
            onPressed: () {
              Navigator.of(context).pop(); // Cierra el cuadro de diálogo
            },
          ),
          TextButton(
            child: const Text("Aceptar"),
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
    MaterialPageRoute(builder: (context) => const LoginPage()),
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
                                      builder: (_) => const Proyectos()))),
                          _buildButton(
                              context,
                              'Senderos Ecológicos',
                              'ima/ruta.png',
                              () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Senderos()))),
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
                MaterialPageRoute(builder: (_) => const PagPrincipal()),
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
