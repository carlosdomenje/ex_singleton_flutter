import 'dart:async';

import 'package:singleton_flutt/src/models/usuarios.dart';

class _UsuarioService {
  Usuario _usuario = Usuario(edad: 0, nombre: '', profesiones: []);
  StreamController<Usuario> _streamController =
      new StreamController<Usuario>.broadcast();

  Usuario get usuario => this._usuario;
  bool get existeUsuario => (this._usuario.edad != 0) ? true : false;
  void cargarUsuario(Usuario user) {
    _usuario.edad = user.edad;
    _usuario.nombre = user.nombre;
    _usuario.profesiones = user.profesiones.toList();

    this._streamController.add(user);
  }

  void cambiarEdad(int edad) {
    _usuario.edad = edad;
    this._streamController.add(_usuario);
  }

  Stream<Usuario> get usuarioStream => _streamController.stream;

  dispose() {
    _streamController.close();
  }
}

final usuarioService = new _UsuarioService();
