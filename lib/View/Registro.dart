import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Login.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final _formKey = GlobalKey<FormState>();
  late String _confirmarContrasena;
  final _contrasenaController = TextEditingController();
  late String _correo, _contrasena, _nombre, _apellidos;
  bool _obscureText = true;

  String encriptarSHA256(String contrasena) {
    var bytes = utf8.encode(contrasena);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

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

  @override
  void dispose() {
    _contrasenaController.dispose();
    super.dispose();
  }
  String? _validarConfirmacionContrasena(String? value) {
    if (value != _contrasenaController.text) {
      return 'Las contraseñas no coinciden';
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
        await FirebaseAuth.instance.signOut();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
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
          title: const Text('Error'),
          content: Text(mensaje),
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

  InputDecoration _inputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      filled: true,
      fillColor: Colors.grey[200],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd9d9d9),
        title: const Text(
          'Registrate con ICAM TRAIL',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginPage()),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'ima/LogoAppICAM.png',
                    width: 0.4 * width,
                  ),
                  const SizedBox(height: 30),
                  _campoTexto('Nombre', (value) => _nombre = value, 'Por favor ingrese su nombre'),
                  _campoTexto('Apellidos', (value) => _apellidos = value, 'Por favor ingrese sus apellidos'),
                  _campoTexto('Correo', (value) => _correo = value, 'Por favor ingrese su correo', validator: _validarCorreo),
                  _campoContrasena(),
                  _campoConfirmarContrasena(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: _registrar,
                      child: const Text('Registrarse', style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
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
        decoration: _inputDecoration(etiqueta),
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
        controller: _contrasenaController,
        decoration: InputDecoration(
          labelText: 'Contraseña',
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
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
  bool _obscureTextConfirm = true;
  Widget _campoConfirmarContrasena() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Confirmar Contraseña',
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureTextConfirm ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                _obscureTextConfirm = !_obscureTextConfirm;
              });
            },
          ),
        ),
        obscureText: _obscureTextConfirm,
        onSaved: (value) => _confirmarContrasena = value!,
        validator: _validarConfirmacionContrasena,
      ),
    );
  }
}