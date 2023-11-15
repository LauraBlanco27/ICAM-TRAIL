import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'PagPrincipal.dart';
import 'Registro.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> obtenerRolDeUsuario(String uid) async {
    try {
      // Obteniendo la colección 'users' y el documento con ID 'uid'
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();

      // Devolviendo el valor del campo 'rol' del documento
      return userDoc['rol'] as String?;
    } catch (e) {
      print("Error obteniendo rol: $e");
      return null;
    }
  }

  void _forgotPassword() async {
    if (emailController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Por favor, introduce tu correo electrónico.'),
            actions: [
              TextButton(
                child: Text('OK'),
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
            title: Text('Correo enviado'),
            content: Text('Revisa tu correo electrónico para reiniciar tu contraseña.'),
            actions: [
              TextButton(
                child: Text('OK'),
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
            title: Text('Error'),
            content: Text('Hubo un error al enviar el correo. Asegúrate de que el correo electrónico esté registrado.'),
            actions: [
              TextButton(
                child: Text('OK'),
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
      // Intenta iniciar sesión con las credenciales proporcionadas
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Si la autenticación es exitosa, verifica el rol del usuario
      String? rol = await obtenerRolDeUsuario(userCredential.user!.uid);

      if (rol == 'Administrador') {
        // Si el usuario es administrador, navega al Panel de Administrador
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => PagPrincipal()),
        );
      } else {
        // Si el usuario es un invitado, navega a la página principal
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => PagPrincipal()),
        );
      }
    } catch (e) {
      // Si hay un error, muestra un cuadro de diálogo con el mensaje de error
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Correo electrónico o contraseña incorrectos.'),
            actions: [
              TextButton(
                child: Text('OK'),
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

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'ima/LogoAppICAM.png',
                width: 0.5 * width,
                height: 0.5 * width,
              ),
              SizedBox(height: 0.03 * width),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 0.02 * width),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  ),
                ),
                obscureText: !showPassword,
              ),
              SizedBox(height: 0.02 * width),
              ElevatedButton(
                onPressed: _signInWithEmailAndPassword, // <-- Aquí es donde se hace el cambio
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.login),
                    SizedBox(width: 0.02 * width),
                    Text('Iniciar sesión'),
                  ],
                ),
              ),
              SizedBox(height: 0.015 * width),
              TextButton(
                onPressed: _forgotPassword, // Función que definiremos a continuación
                child: Text('Olvidé mi contraseña'),
              ),
              SizedBox(height: 0.015 * width),
              TextButton.icon(
                onPressed: () {
                  // Lógica para iniciar sesión con Google
                },
                icon: Icon(Icons.g_translate, color: Colors.redAccent),
                label: Text('Iniciar sesión con Google'),
              ),
              SizedBox(height: 0.015 * width),
              TextButton.icon(
                onPressed: () {
                  // Lógica para iniciar sesión con Facebook
                },
                icon: Icon(Icons.facebook, color: Colors.blueAccent),
                label: Text('Iniciar sesión con Facebook'),
              ),
              SizedBox(height: 0.015 * width),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Registro()),
                  );
                },
                child: Text('¿No tienes una cuenta? Regístrate'),
                style: TextButton.styleFrom(primary: Colors.blueAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


