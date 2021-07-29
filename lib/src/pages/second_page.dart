import 'package:flutter/material.dart';
import 'package:singleton_flutt/src/models/usuarios.dart';
import 'package:singleton_flutt/src/services/usuarios_services.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<Usuario>(
            stream: usuarioService.usuarioStream,
            builder: (context, snapshot) {
              return (snapshot.hasData)
                  ? Text('${snapshot.data!.nombre}')
                  : Text('Second Page');
            }),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            child: Text('Establecer Usuario'),
            onPressed: () {
              final usuario = Usuario(
                  edad: 10,
                  nombre: 'Carlos',
                  profesiones: ['Ingeniero', 'Docente']);
              usuarioService.cargarUsuario(usuario);
            },
            color: Colors.purple[100],
          ),
          MaterialButton(
            child: Text('Cambiar edad'),
            onPressed: () {
              usuarioService.cambiarEdad(35);
            },
            color: Colors.purple[100],
          ),
          MaterialButton(
            child: Text('Añadir Profesion'),
            onPressed: () {},
            color: Colors.purple[100],
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
