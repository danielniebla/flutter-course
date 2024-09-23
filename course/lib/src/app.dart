import 'package:course/src/pages/increment_pages.dart';
import 'package:flutter/material.dart';
import 'pages/home_pages.dart';
import './pages/userData.dart';


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 01',
      home: Center(
        child: DatosUsuarios(),
        )
    );
  }
}