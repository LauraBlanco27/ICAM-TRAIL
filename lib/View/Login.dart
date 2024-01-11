import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'PagPrincipal.dart';
import 'Registro.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInWithGoogle() async {
    try {
      await _googleSignIn.signOut(); // Asegura que la sesión anterior se cierre
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount == null) return null;

      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);

      // Obtener el token FCM y almacenarlo en Firestore
      FirebaseMessaging.instance.getToken().then((token) {
        if (token != null && userCredential.user != null) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(userCredential.user!.uid)
              .update({'fcmToken': token});
        }
      });

      // Verifica si el usuario ya existe en Firestore
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).get();

      if (!userSnapshot.exists) {
        // Si el usuario no existe, guarda sus datos en Firestore
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'correo': userCredential.user!.email,
          'nombre': userCredential.user!.displayName,
        });
      }

      return userCredential;
    } catch (error) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  void _checkAuthentication() {
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        // Si el usuario ya está autenticado, lo redirigimos a la pantalla principal
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const PagPrincipal()),
        );
      }
    });
  }

  Future<String?> obtenerRolDeUsuario(String uid) async {
    try {
      // Obteniendo la colección 'users' y el documento con ID 'uid'
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      return userDoc['rol'] as String?;
    } catch (e) {
      return null;
    }
  }

  void _forgotPassword() async {
    if (emailController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Por favor, introduce tu correo electrónico.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    try {
      await _auth.sendPasswordResetEmail(email: emailController.text);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Correo enviado'),
            content: const Text(
                'Revisa tu correo electrónico para reiniciar tu contraseña.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'Hubo un error al enviar el correo. Asegúrate de que el correo electrónico esté registrado.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Obtener el token FCM y almacenarlo en Firestore
      FirebaseMessaging.instance.getToken().then((token) {
        if (token != null && userCredential.user != null) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(userCredential.user!.uid)
              .update({'fcmToken': token});
        }
      });

      // Si la autenticación es exitosa, verifica el rol del usuario
      String? rol = await obtenerRolDeUsuario(userCredential.user!.uid);

      if (rol == 'Administrador') {
        // Si el usuario es administrador, navega al Panel de Administrador
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const PagPrincipal()),
        );
      } else {
        // Si el usuario es un invitado, navega a la página principal
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const PagPrincipal()),
        );
      }
    } catch (e) {
      // Si hay un error, muestra un cuadro de diálogo con el mensaje de error
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Correo electrónico o contraseña incorrectos.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double standardSpacing = 16.0;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'ima/LogoAppICAM.png',
                width: 0.5 * width,
                height: 0.5 * width,
              ),
              SizedBox(height: standardSpacing),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: standardSpacing),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  ),
                ),
                obscureText: !showPassword,
              ),
              SizedBox(height: standardSpacing),
              ElevatedButton(
                onPressed: _signInWithEmailAndPassword,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: const Color(0xff224C55),
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),

                ),

                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.login),
                    SizedBox(width: 8),
                    Text('Iniciar sesión'),
                  ],
                ),
              ),
              TextButton(
                onPressed: _forgotPassword,
                child: const Text('Olvidé mi contraseña'),
                style: TextButton.styleFrom(foregroundColor: Colors.blueAccent),
              ),
              SizedBox(height: standardSpacing),



              TextButton.icon(
                onPressed: () async {
                  UserCredential? userCredential = await signInWithGoogle();

                  if (userCredential != null) {
                        'Inició sesión con Google: ${userCredential.user?.displayName}';
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const PagPrincipal()),
                    );
                  } else {
                  }
                },
                icon: Image.asset('ima/google.png', height: 24), // Usa el logo de Google
                label: const Text(
                  'Iniciar sesión con Google',
                  style: TextStyle(color: Colors.black), // Texto en color negro
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white, // Color del texto e icono
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Bordes redondeados
                    side: BorderSide(color: Colors.grey.shade300), // Borde gris claro
                  ),
                ),
              ),
              const SizedBox(height: 5),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const Registro()),
                  );
                },
                child: const Text('¿No tienes una cuenta? Regístrate'),
                style: TextButton.styleFrom(foregroundColor: Colors.blueAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
