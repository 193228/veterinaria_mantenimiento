import 'dart:convert';
import 'dart:developer';
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
    toast("Empleado Registrado Correctamente");
    return usuario; //peticion realizada
  }else{
    toast("Empleado Ya Registrado");
  }
}

Future <List<Map<String,dynamic>>> agregarDuenio(context,urlAgregarUsuario,usuario,urlAgregarDuenio,jsonDuenio,urlAddDuenio,urlDestino) async {
  var value = <Map<String, dynamic>>[];
  var idUsuario;

  var r1 = http.post(
    Uri.parse(urlAgregarUsuario),
    headers: {"Content-Type": "application/json"},
    body: usuario
  );
  var r2 = http.get(
    Uri.parse(urlAgregarDuenio),
    headers: {"Content-Type": "application/json"},
  );

  var results = await Future.wait([r1,r2]);
  for (var response in results){
    if(response.body.isNotEmpty) {
        value.add(json.decode(response.body));
        idUsuario = value[0]['idUsuario'];
    }
  }
  //print("esta es la id del usuario -> "+idUsuario.toString());
  jsonDuenio['idUsuario'] = idUsuario;
  var duenio = JsonEncoder().convert(jsonDuenio);

  var r3 = await http.post(
    Uri.parse(urlAddDuenio),
    headers: {"Content-Type": "application/json"},
    body: duenio
  );

  if (r3.statusCode == 200){
    Navigator.pushReplacementNamed(context,urlDestino);
    toast("Propietario Registrado Correctamente");
  }else{
    toast("Propietario Ya Registrado");
  }
  return value;
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