import 'package:flutter/material.dart';
import 'package:singleton_flutt/src/models/usuarios.dart';
import 'package:singleton_flutt/src/services/usuarios_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return (snapshot.hasData)
              ? Profesiones(
                  usuario: snapshot.data,
                )
              : Center(
                  child: Text('No hay datos'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.public_sharp),
        onPressed: () {
          Navigator.pushNamed(context, 'second');
        },
      ),
    );
  }
}

class Profesiones extends StatelessWidget {
  final Usuario usuario;

  const Profesiones({required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
          ),
          Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(
            title: Text('Profesion 1: '),
          ),
          ListTile(
            title: Text('Profesion 1:'),
          ),
          ListTile(
            title: Text('Profesion 1: '),
          ),
        ],
      ),
    );
  }
}
