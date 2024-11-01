import 'package:flutter/material.dart';
import './myAlertDialog.dart';

class DatosUsuarios extends StatefulWidget {
  @override
  _DatosUsuariosState createState() => _DatosUsuariosState();
}

class _DatosUsuariosState extends State<DatosUsuarios> {
  var _name;
  var _phone;

  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 01'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/empire.png'),
          SizedBox(height: 10.0),
          TextField(
            controller: nameCtrl,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5),
              hintText: 'Ingresa un nombre',
            ),
          ),
          SizedBox(height: 10.0),
          TextField(
            controller: phoneCtrl,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5),
              hintText: 'Ingresa un teléfono',
            ),
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.amber,
              onPrimary: Colors.black,
            ),
            child: Text('Enviar'),
            onPressed: () {
              _name = nameCtrl.text;
              _phone = phoneCtrl.text;

              setState(() {
                showAlertDialog(
                  context,
                  'El usuario $_name tiene un teléfono $_phone',
                  'Mi app :)',
                  'OK',
                  ':(',
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
