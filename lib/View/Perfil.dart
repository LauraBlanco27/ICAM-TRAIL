import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'PagPrincipal.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  User? usuario = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  ImagePicker picker = ImagePicker();
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidosController = TextEditingController();
  File? imagenPerfil;
  String? urlImagenPerfil;
  bool establecerComoPerfil = false;
  List<String> fotosUrls = [];

  Future<File?> _getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<File?> _getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<String?> _uploadImage(File imageFile) async {
    try {
      String fileName = 'perfil/${usuario!.uid}';
      Reference ref = storage.ref(fileName);
      UploadTask uploadTask = ref.putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _cargarDatosUsuario();
    _cargarFotosDelUsuario();
  }

  Future<void> _cargarFotosDelUsuario() async {
    if (usuario == null) return;
    List<String> urls = await obtenerUrlsFotosUsuario(usuario!.uid);
    setState(() {
      fotosUrls = urls;
    });
  }

  Future<List<String>> obtenerUrlsFotosUsuario(String userId) async {
    List<String> urls = [];

    final ref = FirebaseStorage.instance.ref('users/$userId');

    // Listar todos los archivos en la carpeta.
    final result = await ref.listAll();
    for (var item in result.items) {
      final url = await item.getDownloadURL();
      urls.add(url);
    }
    return urls;
  }

  Future<List<String>> obtenerFotosDelUsuario() async {
    if (usuario == null) return [];
    return obtenerUrlsFotosUsuario(usuario!.uid);
  }

  Future<void> _cargarDatosUsuario() async {
    final userDoc = await firestore.collection('users').doc(usuario!.uid).get();
    final userData = userDoc.data() as Map<String, dynamic>;
    setState(() {
      nombreController.text = userData['nombre'] ?? '';
      apellidosController.text = userData['apellidos'] ?? '';
      urlImagenPerfil = userData['fotoPerfil'];
    });
  }

  _actualizarFotoPerfil() async {
    // Obtener el archivo de imagen
    final pickedFile = await _getImageFromGallery();
    if (pickedFile != null) {
      imagenPerfil = File(pickedFile.path);
      // Subir el archivo de imagen a Firebase Storage
      String? urlImagen = await _uploadImage(imagenPerfil!);
      if (urlImagen != null) {
        // Actualizar el campo `fotoPerfil` del documento del usuario en Firebase Firestore
        await firestore.collection('users').doc(usuario!.uid).update({
          'fotoPerfil': urlImagen,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Foto de perfil actualizada con éxito')),
        );
        setState(() {
          urlImagenPerfil = urlImagen;
          imagenPerfil = null;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al subir la imagen')),
        );
      }
    }
  }

  _eliminarFotoPerfil() async {
    try {
      await storage.ref('perfil/${usuario!.uid}').delete();
      await firestore.collection('users').doc(usuario!.uid).update({
        'fotoPerfil': null,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Foto de perfil eliminada con éxito')),
      );
      setState(() {
        urlImagenPerfil = null;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al eliminar la foto de perfil')),
      );
    }
  }

  _actualizarDatosUsuario() async {
    await firestore.collection('users').doc(usuario!.uid).update({
      'nombre': nombreController.text,
      'apellidos': apellidosController.text,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Datos de usuario actualizados con éxito')),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PagPrincipal()),
    );
  }

  void _verGaleriaCompleta(BuildContext context, int index) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return GaleriaCompletaScreen(
        urlsFotos: fotosUrls,
        indiceInicial: index,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: const Color(0xffd9d9d9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => PagPrincipal()),
                        );
                      },
                    ),
                    const Text(
                      'Perfil',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 30),
                  ],
                ),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!kIsWeb) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Seleccionar imagen'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      GestureDetector(
                                        child: const Text('Galería'),
                                        onTap: () {
                                          Navigator.of(context).pop();
                                          _actualizarFotoPerfil();
                                        },
                                      ),
                                      const SizedBox(height: 16),
                                      GestureDetector(
                                        child: const Text('Cámara'),
                                        onTap: () async {
                                          Navigator.of(context).pop();
                                          // Captura la imagen desde la cámara
                                          File? imagenDesdeCamara =
                                              await _getImageFromCamera();
                                          if (imagenDesdeCamara != null) {
                                            // Si se capturó una imagen, subirla a Firebase y actualizar el perfil
                                            String? urlImagen =
                                                await _uploadImage(
                                                    imagenDesdeCamara);
                                            if (urlImagen != null) {
                                              await firestore
                                                  .collection('users')
                                                  .doc(usuario!.uid)
                                                  .update({
                                                'fotoPerfil': urlImagen,
                                              });
                                              setState(() {
                                                urlImagenPerfil = urlImagen;
                                              });
                                              if (mounted) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                      content: Text(
                                                          'Foto de perfil actualizada con éxito')),
                                                );
                                              }
                                            } else if (mounted) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        'Error al subir la imagen')),
                                              );
                                            }
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          _actualizarFotoPerfil();
                        }
                      },
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: urlImagenPerfil != null
                            ? NetworkImage(urlImagenPerfil!)
                            : null,
                        child: urlImagenPerfil == null
                            ? const Icon(Icons.person, size: 60)
                            : null,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: urlImagenPerfil != null ? _eliminarFotoPerfil : null,
                      child: Text(
                        'Eliminar foto de perfil',
                        style: TextStyle(color: Color(0xff072931)), // Aplica el estilo aquí
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: nombreController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: apellidosController,
                      decoration: const InputDecoration(
                        labelText: 'Apellidos',
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _actualizarDatosUsuario,
                      child: const Text('Actualizar datos'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            const Color(0xff072931), // Color del texto
                        // Añade aquí otros estilos si los necesitas
                      ),
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return FutureBuilder<List<String>>(
                        future: obtenerUrlsFotosUsuario(usuario!.uid),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }

                          if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return Center(
                                child: Text('No hay fotos disponibles'));
                          }

                          final fotosUrls = snapshot.data!;

                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                            ),
                            itemCount: fotosUrls.length,
                            itemBuilder: (context, index) {
                              return Image.network(fotosUrls[index],
                                  fit: BoxFit.cover);
                            },
                          );
                        },
                      );
                    },
                  );
                },
                child: const Text('Ver fotos'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xff072931),
                ),
              ),
              //_buildPhotoGallery(),
              // Widget para mostrar las fotos del usuario
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: fotosUrls.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _verGaleriaCompleta(context, index),
                    child: Hero(
                      tag:
                          'foto$index', // Asegúrate de que el tag sea único para cada foto.
                      child: Image.network(fotosUrls[index], fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
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

  Widget _buildPhotoGallery() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: fotosUrls.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _verGaleriaCompleta(context, index),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            child: Hero(
              tag: 'foto$index',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  fotosUrls[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class GaleriaCompletaScreen extends StatelessWidget {
  final List<String> urlsFotos;
  final int indiceInicial;

  const GaleriaCompletaScreen({
    Key? key,
    required this.urlsFotos,
    this.indiceInicial = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffd9d9d9),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Perfil()),
            );
          },
        ),
        title: const Text(
          'Galería',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          const SizedBox(width: 30),
        ],
      ),
      body: PageView.builder(
        itemCount: urlsFotos.length,
        controller: PageController(initialPage: indiceInicial),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Hero(
              tag: 'foto$index', // Usa el mismo tag que en la miniatura.
              child: Image.network(urlsFotos[index], fit: BoxFit.contain),
            ),
          );
        },
      ),
    );
  }
}
