import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:proyecto1/View/PagPrincipal.dart';
import 'AgriculturaConservacion.dart';
import 'Apicultura.dart';
import 'Formulario.dart';
import 'HuertoFamiliar.dart';
import 'Invernadero.dart';
import 'Lombricomposta.dart';
import 'Perfil.dart';
import 'ReservorioAgua.dart';
import 'RiegoEficiente.dart';
import 'Silvopastoril.dart';
import 'SistemaSilvoagricola.dart';
import 'TerrazasAgricolas.dart';

class Proyecto {
  String id;
  String nombre;
  String imagen;
  int orden;

  Proyecto(
      {required this.id,
      required this.nombre,
      required this.imagen,
      required this.orden});

  Map<String, dynamic> toMap() {
    return {'nombre': nombre, 'imagen': imagen, 'orden': orden};
  }

  static Proyecto fromMap(Map<String, dynamic> map, String id) {
    return Proyecto(
        id: id,
        nombre: map['nombre'] ?? 'Nombre por defecto',
        imagen: map['imagen'] ?? 'Imagen por defecto',
        orden: map['orden'] ?? 0
    );
  }
}

class Proyectos extends StatelessWidget {
  const Proyectos({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> proyectosNombres = [
    'Lombricomposta',
    'Invernadero',
    'Riego Eficiente',
    'Terrazas Agrícolas',
    'Sistema Silvoagricola',
    'Agricultura de Conservación',
    'Apicultura',
    'Huerto Familiar',
    'Silvopastoril',
    'Reservorio de Agua'
  ];

  final List<Widget> paginas = [
    const Lombricomposta(),
    const Invernadero(),
    const RiegoEficiente(),
    const TerrazasAgricolas(),
    const SistemaSilvoagricola(),
    const AgriculturaConservacion(),
    const Apicultura(),
    const HuertoFamiliar(),
    const Silvopastoril(),
    const ReservorioAgua(),
  ];

  final List<String> proyectosImagenes = [
    'ima/lombriz.png',
    'ima/IconoInver.png',
    'ima/aspersor.png',
    'ima/terraza.png',
    'ima/otono.png',
    'ima/planta.png',
    'ima/abeja.png',
    'ima/regadera.png',
    'ima/vacas.png',
    'ima/deposito-de-agua.png',
  ];

  bool esAdmin = false;
  final AuthService _authService = AuthService();
  get tuDocumentSnapshot => null;
  get tuProyectoDocumentSnapshot => null;
  get setStateDialog => null;

  set imagenSeleccionada(File imagenSeleccionada) {}

  @override
  void initState() {
    super.initState();
    verificarRolUsuario();
  }

  void verificarRolUsuario() async {
    User? usuario = FirebaseAuth.instance.currentUser;
    if (usuario != null) {
      String rol = await _authService.obtenerRolUsuario();
      if (mounted) {
        setState(() {
          esAdmin = rol == 'Administrador';
        });
      }
    } else {
      setState(() {
        esAdmin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff224C55),
      floatingActionButton: esAdmin
          ? FloatingActionButton(
              onPressed: () => _agregarProyecto(context),
              child: const Icon(Icons.add),
            )
          : null,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
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
                            MaterialPageRoute(
                                builder: (_) => const PagPrincipal()),
                          );
                        },
                      ),
                      const Text(
                        'Proyectos Educativos',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 30),
                    ],
                  ),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('proyectos')
                        .orderBy('orden')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return const Center(child: CircularProgressIndicator());

                      // Fusionar la lista predefinida con los proyectos de Firestore
                      List<DocumentSnapshot> proyectosFirestore = snapshot.data!.docs;
                      int totalProyectos = proyectosNombres.length + proyectosFirestore.length;

                      return GridView.builder(
                        padding: const EdgeInsets.all(10.0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: (constraints.maxWidth < 600) ? 2 : 3,
                          crossAxisSpacing: 30.0,
                          mainAxisSpacing: 30.0,
                          childAspectRatio: 1.6667,
                        ),
                        itemCount: totalProyectos,
                        itemBuilder: (BuildContext context, int index) {
                          if (index < proyectosNombres.length) {
                            // Proyectos predefinidos
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => paginas[index]),
                                );
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: tuWidgetProyectoPredefinido(
                                  proyectosNombres[index],
                                  proyectosImagenes[index]),
                            );
                          } else {
                            // Proyectos de Firestore
                            var proyecto = proyectosFirestore[
                                index - proyectosNombres.length];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Formulario(proyecto: proyecto, modoSoloLectura: true),
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: tuWidgetProyectoFirestore(
                                  proyecto, constraints),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
                Container(
                  color: const Color(0xff072931),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.home, color: Color(0xffd9d9d9)),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const PagPrincipal()),
                          );
                        },
                      ),
                      IconButton(
                        icon:
                            const Icon(Icons.person, color: Color(0xffd9d9d9)),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const Perfil()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget tuWidgetProyectoPredefinido(String nombre, String imagen,
      {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap, // Agrega tu lógica de navegación aquí
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(7, 41, 49, 0.5),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffecf8e5),
              spreadRadius: 0,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagen,
                width: 50.0,
                height: 50.0,
              ),
              const SizedBox(height: 8),
              Text(
                nombre,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tuWidgetProyectoFirestore(
      DocumentSnapshot proyecto, BoxConstraints constraints) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          // El widget original que muestra el proyecto
          Ink(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(7, 41, 49, 0.5),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xffecf8e5),
                  spreadRadius: 0,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    proyecto['imagen'],
                    width: 50.0,
                    height: 50.0,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    proyecto['nombre'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: (constraints.maxWidth < 600) ? 14 : 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Botones de editar y eliminar
          if (esAdmin)
            Positioned(
              right: 0,
              top: 0,
              child: PopupMenuButton<String>(
                onSelected: (String value) {
                  if (value == 'Editar') {
                    _editarProyecto(proyecto);
                  } else if (value == 'Eliminar') {
                    _eliminarProyecto(proyecto.id);
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Editar',
                    child: Text('Editar'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Eliminar',
                    child: Text('Eliminar'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _editarProyecto(DocumentSnapshot proyecto) {
    print('Editando proyecto: ${proyecto.id}'); // Agrega esta línea para depurar
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Formulario(proyecto: proyecto)),
    );
  }

  void _eliminarProyecto(String proyectoId) async {
    bool confirmar = await _mostrarDialogoConfirmacion();

    if (confirmar) {
      FirebaseFirestore.instance
          .collection('proyectos')
          .doc(proyectoId)
          .delete()
          .then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Proyecto eliminado con éxito'),
            backgroundColor: Colors.green,
          ),
        );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error al eliminar el proyecto'),
            backgroundColor: Colors.red,
          ),
        );
      });
    }
  }

  Future<bool> _mostrarDialogoConfirmacion() async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirmar eliminación'),
              content: const Text(
                  '¿Estás seguro de que deseas eliminar este proyecto?'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                TextButton(
                  child: const Text('Eliminar'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          },
        ) ??
        false;
  }

  void _agregarProyecto(BuildContext context) async {
    TextEditingController nombreController = TextEditingController();
    File? imagenSeleccionada;
    StateSetter? setStateDialog;

    Future<void> _seleccionarImagen() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        imagenSeleccionada = File(pickedFile.path);
        setStateDialog
            ?.call(() {}); // Reabre el diálogo con la imagen seleccionada
      }
    }

    Future<String> _subirImagen(File imagen) async {
      FirebaseStorage storage = FirebaseStorage.instance;
      String filePath =
          'imagenes/${DateTime.now()}_${imagen.path.split('/').last}';
      UploadTask uploadTask = storage.ref().child(filePath).putFile(imagen);

      TaskSnapshot taskSnapshot = await uploadTask;
      String urlImagen = await taskSnapshot.ref.getDownloadURL();
      return urlImagen;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        setStateDialog = setState;
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Wrap(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Agregar Nuevo Proyecto',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: nombreController,
                      decoration: InputDecoration(
                        labelText: 'Nombre del Proyecto',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    imagenSeleccionada == null
                        ? ElevatedButton(
                            onPressed: _seleccionarImagen,
                            child: Text(
                              'Seleccionar Imagen',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff072931),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.all(8),
                            child: Image.file(
                              imagenSeleccionada!,
                              fit: BoxFit.cover,
                            ),
                          ),
                    SizedBox(height: 20),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'Cancelar',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (nombreController.text.isEmpty) {
                              return;
                            }

                            if (imagenSeleccionada == null) {
                              return;
                            }

                            String urlImagen =
                                await _subirImagen(imagenSeleccionada!);
                            int ordenMaximo = 0;
                            var querySnapshot = await FirebaseFirestore.instance
                                .collection('proyectos')
                                .orderBy('orden', descending: true)
                                .limit(1)
                                .get();
                            if (querySnapshot.docs.isNotEmpty) {
                              ordenMaximo = querySnapshot.docs.first
                                  .data()['orden'] as int;
                            }

                            await FirebaseFirestore.instance
                                .collection('proyectos')
                                .add({
                              'nombre': nombreController.text,
                              'imagen': urlImagen,
                              'orden': ordenMaximo + 1,
                            });

                            Navigator.of(context).pop();
                          },
                          child: const Text('Guardar'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xff072931),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
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
