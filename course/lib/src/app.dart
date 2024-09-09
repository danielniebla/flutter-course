import 'package:course/src/pages/increment_pages.dart';
import 'package:flutter/material.dart';
import 'pages/home_pages.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child:IncrementPage()
        )
    );
  }
}