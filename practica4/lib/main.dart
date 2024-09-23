import 'package:flutter/material.dart';
import 'package:practica4/src/splash_screen.dart';
import './src/splash_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 04',
      home:  SplashScreen()
    );
  }
}
