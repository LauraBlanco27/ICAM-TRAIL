import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' show basename;
import 'Servicios.dart';

class FaunaScreen extends StatefulWidget {
  const FaunaScreen({Key? key}) : super(key: key);

  @override
  _FaunaScreenState createState() => _FaunaScreenState();
}

class _FaunaScreenState extends State<FaunaScreen> {
  bool esAdmin = false;
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    verificarRolUsuario();
  }

  void verificarRolUsuario() async {
    User? usuario = FirebaseAuth.instance.currentUser;
    if (usuario != null) {
      String rol = await _authService.obtenerRolUsuario();
      setState(() {
        esAdmin = rol == 'Administrador';
      });
    } else {
      setState(() {
        esAdmin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffd9d9d9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const Servicios()),
            );
          },
        ),
        title: const Text(
          'Fauna',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: esAdmin ? vistaAdmin() : vistaInvitado(),
      ),
      floatingActionButton: esAdmin
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                if (esAdmin) {
                  _mostrarDialogoAgregarContenido(context);
                }
              },
            )
          : null,
    );
  }

  Widget vistaAdmin() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('fauna').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No hay contenido disponible"));
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;

            return TarjetaContenido(
              imageUrl: data['imageUrl'],
              descripcion: data['descripcion'],
              onEditar: () {
                _mostrarDialogoEditarContenido(document, esAdmin: esAdmin);
              },
              onEliminar: () {
                _eliminarContenido(document.id);
              },
              onTap: () {
                _mostrarDialogoAmpliarImagen(data['imageUrl']);
              },
              esAdmin: esAdmin,
            );
          }).toList(),
        );
      },
    );
  }

  void _mostrarDialogoEditarContenido(DocumentSnapshot doc,
      {required bool esAdmin}) {
    final TextEditingController _descripcionController =
        TextEditingController(text: doc['descripcion']);
    XFile? nuevaImagenSeleccionada;
    String imageUrlActual = doc['imageUrl'];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Contenido'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                child: const Text('Seleccionar Nueva Imagen'),
                onPressed: () async {
                  final ImagePicker _picker = ImagePicker();
                  final XFile? imagen =
                      await _picker.pickImage(source: ImageSource.gallery);
                  nuevaImagenSeleccionada = imagen;
                },
              ),
              TextField(
                controller: _descripcionController,
                decoration: const InputDecoration(
                  hintText: "Nueva Descripción",
                  contentPadding: EdgeInsets.all(10.0),
                ),
                maxLines: 4,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Guardar'),
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('fauna')
                    .doc(doc.id)
                    .update({
                  'descripcion': _descripcionController.text,
                });

                if (nuevaImagenSeleccionada != null) {
                  String fileName = basename(nuevaImagenSeleccionada!.path);
                  firebase_storage.Reference ref = firebase_storage
                      .FirebaseStorage.instance
                      .ref()
                      .child('fauna/$fileName');
                  await ref.putFile(File(nuevaImagenSeleccionada!.path));
                  String nuevaImageUrl = await ref.getDownloadURL();

                  await FirebaseFirestore.instance
                      .collection('fauna')
                      .doc(doc.id)
                      .update({
                    'imageUrl': nuevaImageUrl,
                  });

                  firebase_storage.Reference imagenAnteriorRef =
                      firebase_storage.FirebaseStorage.instance
                          .refFromURL(imageUrlActual);
                  await imagenAnteriorRef.delete();
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _eliminarContenido(String docId) async {
    bool confirmacion = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmar Eliminación'),
          content: const Text('¿Estás seguro de eliminar este contenido?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              child: const Text('Eliminar'),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      },
    );

    if (confirmacion == true) {
      await FirebaseFirestore.instance.collection('fauna').doc(docId).delete();
    }
  }

  Widget vistaInvitado() {
    return FutureBuilder<List<TarjetaContenido>>(
      future: obtenerContenidoInvitado(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No hay contenido disponible"));
        }

        return ListView(
          children: snapshot.data!,
        );
      },
    );
  }

  Future<List<TarjetaContenido>> obtenerContenidoInvitado() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('fauna').get();

    List<TarjetaContenido> tarjetas = querySnapshot.docs.map((document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      return TarjetaContenido(
        imageUrl: data['imageUrl'],
        descripcion: data['descripcion'],
        onTap: () {
          _mostrarDialogoAmpliarImagen(data['imageUrl']);
        },
        esAdmin: false,
      );
    }).toList();
    return tarjetas;
  }

  void _mostrarDialogoAgregarContenido(BuildContext context) {
    final TextEditingController _descripcionController =
        TextEditingController();
    XFile? imagenSeleccionada;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Agregar Contenido'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Seleccionar Imagen'),
                  onPressed: () async {
                    final ImagePicker _picker = ImagePicker();
                    final XFile? imagen =
                        await _picker.pickImage(source: ImageSource.gallery);
                    imagenSeleccionada = imagen;
                  },
                ),
                TextField(
                  controller: _descripcionController,
                  decoration: const InputDecoration(
                    hintText: "Descripción",
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                  maxLines: 4,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Agregar'),
              onPressed: () async {
                if (imagenSeleccionada != null &&
                    _descripcionController.text.isNotEmpty) {
                  await _agregarContenido(
                      imagenSeleccionada!, _descripcionController.text);
                  Navigator.of(context).pop();
                } else {}
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _agregarContenido(XFile imagen, String descripcion) async {
    try {
      if (imagen != null) {
        String fileName = basename(imagen.path);
        firebase_storage.Reference ref = firebase_storage
            .FirebaseStorage.instance
            .ref()
            .child('fauna/$fileName');
        await ref.putFile(File(imagen.path));
        String imageUrl = await ref.getDownloadURL();
        await FirebaseFirestore.instance.collection('fauna').add({
          'imageUrl': imageUrl,
          'descripcion': descripcion,
        });
      } else {}
    } catch (e) {}
  }

  void _mostrarDialogoAmpliarImagen(String imageUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Material(
            color: Colors.transparent,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: InteractiveViewer(
                panEnabled: true,
                boundaryMargin: const EdgeInsets.all(20.0),
                minScale: 0.1,
                maxScale: 3.0,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class TarjetaContenido extends StatelessWidget {
  final String imageUrl;
  final String descripcion;
  final VoidCallback onTap;
  final VoidCallback? onEditar;
  final VoidCallback? onEliminar;

  const TarjetaContenido({
    super.key,
    required this.imageUrl,
    required this.descripcion,
    required this.onTap,
    this.onEditar,
    this.onEliminar,
    required this.esAdmin,
  });

  final bool esAdmin;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              descripcion,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (onEditar != null && onEliminar != null && esAdmin)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: onEditar!,
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: onEliminar!,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class AuthService {
  Future<String> obtenerRolUsuario() async {
    User? usuario = FirebaseAuth.instance.currentUser;

    if (usuario != null) {
      DocumentSnapshot usuarioDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(usuario.uid)
          .get();

      if (usuarioDoc.exists) {
        return usuarioDoc['rol'] ?? 'Usuario';
      } else {
        return 'Usuario';
      }
    } else {
      return 'Invitado';
    }
  }
}
