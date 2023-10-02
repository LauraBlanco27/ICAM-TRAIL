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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'ima/LogoAppICAM.png',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 30),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => PagPrincipal()),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.login),
                    SizedBox(width: 8),
                    Text('Iniciar sesión'),
                  ],
                ),
              ),
              SizedBox(height: 15),
              TextButton.icon(
                onPressed: () {
                  // Iniciar sesión con Google.
                },
                icon: Icon(Icons.g_translate, color: Colors.redAccent), // Color personalizado
                label: Text('Iniciar sesión con Google'),
              ),
              SizedBox(height: 15),
              TextButton.icon(
                onPressed: () {
                  // Iniciar sesión con Facebook.
                },
                icon: Icon(Icons.facebook, color: Colors.blueAccent), // Color personalizado
                label: Text('Iniciar sesión con Facebook'),
              ),
              SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Registro()),
                  );
                },
                child: Text('¿No tienes una cuenta? Regístrate'),
                style: TextButton.styleFrom(primary: Colors.blueAccent), // Color personalizado
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class Validators {
  static bool isEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')
        .hasMatch(email);
  }
}
