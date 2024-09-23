import 'package:flutter/material.dart';
import './datos_recibidos.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final ctrlnom = new TextEditingController();
  final ctrlpeso = new TextEditingController();
  final ctrlaltura = new TextEditingController();
  final data = Data(nombre:'',sexo:'',peso:0,altura: 0);
  int? _valor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[200],
        title: Text('Practica 04'),
        centerTitle: true,
      ),
      body : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: ctrlnom,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'Ingresa el nombre',
                contentPadding: EdgeInsets.all(20),
              ),
            ),
            TextField(
              controller: ctrlpeso,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ingresa el peso',
                contentPadding: EdgeInsets.all(20),
              ),
            ),
            TextField(
              controller: ctrlaltura,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ingresa la altura',
                contentPadding: EdgeInsets.all(20),
              ),
            ),
            SizedBox(height: 20),
            DropdownButton(
              value: _valor,
              items: [
                DropdownMenuItem(
                  child: Text('Mujer'),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text('Hombre'),
                  value: 2,
                ),
              ],
              onChanged: (int? selected){
                setState(() {
                  _valor = selected!;
                });
              }
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange[200],
                onPrimary: Colors.white
              ),
              child: Text('Enviar'),
              onPressed: (){
                setState(() {
                  data.nombre = ctrlnom.text;
                  data.peso = double.parse(ctrlpeso.text);
                  data.altura = double.parse(ctrlaltura.text);

                  if (_valor ==1){
                    data.sexo = 'Mujer';
                  } else {
                    data.sexo = 'Hombre';
                  }
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DatosPage(data: data)));
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
class Data {
  String  nombre;
  String sexo;
  double peso;
  double altura;

  Data({required this.nombre,required this.sexo, required this.peso, required this.altura});
}