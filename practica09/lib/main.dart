import 'package:flutter/material.dart';
import './src/list_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 09',
      home: ListPage(),
    );
  }
}
