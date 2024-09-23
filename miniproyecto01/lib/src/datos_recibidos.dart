import 'package:flutter/material.dart';
import './home_page.dart';

class DatosPage extends StatelessWidget {
  final Data data;
  DatosPage({required this.data});

  @override
  Widget build(BuildContext context) {
    String clasificacion ='';
    double imc = (data.peso/(data.altura*data.altura));
    String imglink = '';
    if (imc < 18) {
      clasificacion = 'Bajo peso';
      imglink = 'assets/esqueleto.png';
    } else if(imc<25){
      clasificacion = 'Normal';
      imglink = 'assets/vampiro.png';
    } else if(imc<27){
      clasificacion = 'obesidad';
      imglink = 'assets/calabaza.png';
    } else if(imc<30){ 
      clasificacion = 'obesidad I';
      imglink = 'assets/calabaza (1).png';
    } else if(imc<40){
      clasificacion = 'obesidad II';
      imglink = 'assets/calabaza (2).png';
    }else {
      clasificacion = 'obesidad III';
      imglink = 'assets/calabaza (3).png';
    }
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
            Text('IMC: ${imc}'),
            Text('peso: ${data.peso}'),
            Text('altura: ${data.altura}'),
            Text('clasificacion: ${clasificacion}'),
            Image.asset(imglink, width: 200, height: 200),
          ],
        ),
      ),
    );
  }
}