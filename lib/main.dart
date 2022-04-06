import 'package:conexion_veterinaria/pages/add_usuario.dart';
import 'package:conexion_veterinaria/pages/listadoUsuarios.dart';
import 'package:conexion_veterinaria/pages/login.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      initialRoute: 'login',
      routes: {
        'login': (context) => const Login(),
        //Agregar vistas para empleados y para dueños
        'listadoUsuarios': (BuildContext context) => listaUser(),
        'agregarUsuario': (BuildContext context) => addUser(),
      },
    );
  }
}