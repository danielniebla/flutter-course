import 'package:flutter/material.dart';
import './home_page.dart';

class DatosPage extends StatelessWidget {
  final Data data;
  DatosPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos Personales'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Los datos son:'),
            Text('Nombre: ${data.nombre}'),
            Text('Sexo: ${data.sexo}'),
          ],
        ),
      ),
    );
  }
}