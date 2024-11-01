import 'package:flutter/material.dart';
import './datos_recibidos.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final ctrlnom = new TextEditingController();
  final data = Data(nombre:'',sexo:'');
  int? _valor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[200],
        title: Text('Practica 03'),
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

  Data({required this.nombre,required this.sexo});
}