import 'dart:convert';
import 'package:conexion_veterinaria/dialogs/dialogs.dart';
import 'package:flutter/cupertino.dart';
import '../models/users.dart';
import 'package:http/http.dart' as http;

Future<List<users>> listaUsuarios(url) async {
  final respuesta = await http.get(Uri.parse(url));
  List<users> propietarios = [];
  if (respuesta.statusCode == 200){
    String body = utf8.decode(respuesta.bodyBytes);
    final jsonData = jsonDecode(body);
    for (var propietario in jsonData){
      propietarios.add(users(propietario['idUsuario'],propietario['user'], propietario['password'], propietario['tipoU']));
    }
    return propietarios;
  }else{
    throw Exception("Fallo la conexión");
  }
}

Future agregarUsuario(context,url,usuario) async {
  final respuesta = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: usuario
  );
  if (respuesta.statusCode == 200){
    Navigator.pushReplacementNamed(context,"listadoUsuarios");
    toast("Usuario Registrado Correctamente");
    return usuario; //peticion realizada
  }else{
    toast("Username Ya Registrado");
  }
}

Future eliminarUsuario(context,url,idUsuario) async {
  final respuesta = await http.post(
    Uri.parse(url+idUsuario),
    headers: {"Content-Type": "application/json"},
  );
  if (respuesta.statusCode == 200){
    Navigator.pushReplacementNamed(context,"listadoUsuarios");
    toast("Usuario Eliminado Correctamente");
    return idUsuario; 
  }else{
    toast("Ocurrio Un Error, Intente Nuevamente");
  }
}

Future editarUsuario(context,url,usuario) async {
  final respuesta = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: usuario
  );
  if (respuesta.statusCode == 200){
    Navigator.pushReplacementNamed(context,"listadoUsuarios");
    toast("Usuario editado Correctamente");
    return usuario; 
  }else{
    toast("Ocurrio Un Error, Intente Nuevamente");
  }
}