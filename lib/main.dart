import 'package:chat_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

// Globle object define for Size by Media Query
late Size mq;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Set Enter Full Screen
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // Set Orientation
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) {
    _initializeFirebase();
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(
        // iconTheme: IconThemeData(color: Colors.black),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 2,
          titleTextStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          backgroundColor: Colors.white,
        ),
      ),
      home: SplashScreen(),
    );
  }
}

// method of firebase initialize
_initializeFirebase() async {
  await Firebase.initializeApp();
}
