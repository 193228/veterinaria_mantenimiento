import 'package:conexion_veterinaria/pages/add_duenio.dart';
import 'package:conexion_veterinaria/pages/add_usuario.dart';
import 'package:conexion_veterinaria/pages/citas.dart';
import 'package:conexion_veterinaria/pages/inicioP.dart';
import 'package:conexion_veterinaria/pages/inicio_page.dart';
import 'package:conexion_veterinaria/pages/listadoUsuarios.dart';
import 'package:conexion_veterinaria/pages/login.dart';
import 'package:conexion_veterinaria/pages/mascotas.dart';
import 'package:conexion_veterinaria/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'Painters/progressView.dart';


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
      initialRoute: 'initialHeader',
      routes: {
        'initialHeader': (BuildContext context)=> SplashView(),
        'inicioHome': (BuildContext context)=> inicio_page(),
        'progressPainter': (BuildContext context)=> progressView(),
        'login': (context) => const Login(),
        'listadoUsuarios': (BuildContext context) => listaUser(),
        'agregarUsuario': (BuildContext context) => addUser(),
        'agregarDuenio': (BuildContext context) => addDuenio(),
        //'mascotasDuenio': (BuildContext context)=> mascotasC(),
        'mascotasEmpleados': (BuildContext context)=> inicioP(),
        'listaCitas': (BuildContext context)=> CitasC(),
        // 'registro': (BuildContext context)=> Registro(),     
        // 'recuperarPass': (BuildContext context)=> recuperarPass(),
        // 'initialHeader': (BuildContext context)=> mascotasC(),
        // 'initialHeader2': (BuildContext context)=> inicioP(),
        //Agregar vistas para empleados y para dueños
      },
    );
  }
}