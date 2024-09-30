import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage('https://imgs.search.brave.com/Nasf50TB4M83j0H47v6fyyunuJs3tN7v9eE-6TJzTHk/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9hc3Nl/dHMuc3RpY2twbmcu/Y29tL2ltYWdlcy81/ODVlNGJkN2NiMTFi/MjI3NDkxYzMzOTcu/cG5n'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 5.0),
                Text('Brayhan Niebla', style: TextStyle(fontSize: 22.0)),
                SizedBox(height: 5.0),
                Text('Estudiante', style: TextStyle(fontSize: 16.0)),
                SizedBox(height: 20.0)
              ],
            ),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.person,
            color: Colors.black
          ),
          title: Text('Perfil'),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(
              Icons.inbox,
              color: Colors.black
          ),
          title: Text('Mensajeria'),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(
              Icons.assessment,
              color: Colors.black
          ),
          title: Text('Dashboard'),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(
              Icons.settings,
              color: Colors.black
          ),
          title: Text('Configuracion'),
        ),
      ],
    );
  }
}
