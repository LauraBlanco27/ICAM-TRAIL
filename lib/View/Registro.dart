import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Login.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final _formKey = GlobalKey<FormState>();
  late String _correo, _contrasena, _nombre, _apellidos;
  bool _obscureText = true;

  String? _validarContrasena(String? value) {
    if (value!.isEmpty) {
      return 'Por favor ingrese su contraseña';
    }
    if (value.length < 8) {
      return 'La contraseña debe tener al menos 8 caracteres';
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return 'La contraseña debe contener al menos un número';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'La contraseña debe contener al menos una letra mayúscula';
    }
    return null;
  }

  String? _validarCorreo(String? value) {
    if (value!.isEmpty) {
      return 'Por favor ingrese su correo';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Ingrese un correo válido';
    }
    return null;
  }

  Future<void> _registrar() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _correo,
          password: _contrasena,
        );
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'nombre': _nombre,
          'apellidos': _apellidos,
          'correo': _correo,
          'rol': 'Invitado',
        });
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      } on FirebaseAuthException catch (e) {
        String mensaje = 'Error desconocido';
        if (e.code == 'weak-password') {
          mensaje = 'La contraseña es demasiado débil';
        } else if (e.code == 'email-already-in-use') {
          mensaje = 'El correo ya está en uso';
        }
        _mostrarDialogo(mensaje);
      } catch (e) {
        _mostrarDialogo('Error al registrar el usuario');
      }
    }
  }

  void _mostrarDialogo(String mensaje) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(mensaje),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Registro', style: TextStyle(fontSize: 24)),
                  SizedBox(height: 20),
                  _campoTexto('Nombre', (value) => _nombre = value!, 'Por favor ingrese su nombre'),
                  _campoTexto('Apellidos', (value) => _apellidos = value!, 'Por favor ingrese sus apellidos'),
                  _campoTexto('Correo', (value) => _correo = value!, 'Por favor ingrese su correo', validator: _validarCorreo),
                  _campoContrasena(),
                  ElevatedButton(
                    onPressed: _registrar,
                    child: Text('Registrarse'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _campoTexto(String etiqueta, Function(String) onSaved, String mensajeError, {String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: etiqueta,
          border: OutlineInputBorder(),
        ),
        onSaved: (value) => onSaved(value!),
        validator: validator ?? (value) {
          if (value!.isEmpty) {
            return mensajeError;
          }
          return null;
        },
      ),
    );
  }

  Widget _campoContrasena() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Contraseña',
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
        obscureText: _obscureText,
        onSaved: (value) => _contrasena = value!,
        validator: _validarContrasena,
      ),
    );
  }
}