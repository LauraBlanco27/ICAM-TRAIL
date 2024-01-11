import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Model/User.dart';
import 'firebase_options.dart';
import 'View/Login.dart';
import 'View/constants.dart';

void main() async {
  await dotenv
      .load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      home:
          FirebaseInitializer(),
    ),
  );
}

class FirebaseInitializer extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorApp();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User objUser = User();

  @override
  void initState() {
    super.initState();
    _loadResourcesAndNavigate();
  }

  Future<void> _loadResourcesAndNavigate() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'ima/ICAMTrail.png',
              width: 0.6 * width,
              height: 0.6 * height,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 0.05 * height),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Created by',
                    style:
                        TextStyle(color: kTextColor, fontSize: kTextSizeLarge),
                  ),
                ),
                Text(
                  'WhiteTeam',
                  style: TextStyle(color: kTextColor, fontSize: kTextSizeSmall),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ErrorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Esta plataforma no está soportada'),
        ),
      ),
    );
  }
}
