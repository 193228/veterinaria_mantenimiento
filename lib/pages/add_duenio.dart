import 'dart:convert';
import 'package:conexion_veterinaria/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import '../components/body.dart';
import '../components/header.dart';
import '../conexion/DaoUser.dart';
import '../models/users.dart';
import '../styles/colors.dart';

class addDuenio extends StatefulWidget {
  addDuenio({Key? key}) : super(key: key);

  @override
  State<addDuenio> createState() => _addDuenio();
}

class _addDuenio extends State<addDuenio> {
  bool _isObscure = true;
  final List<TextEditingController> inputs = [
  for (int i = 0; i < 5; i++)
    TextEditingController()
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBar(context,"Agregar Usuario","assets/images/splash.png","listadoUsuarios"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            textoInformativo("Agrega Un Dueño", 15.0),
            campoInformacion(20.0,"Usuario","Ingrese Username", "", inputs[0]),
            password(15.0, "Password", "Ingrese Su Password", "", inputs[1]),
            //campoInformacion(0.0,"Password","Ingrese Password", "", inputs[1]),
            campoInformacion(0.0,"Nombre","Ingrese Su Nombre", "", inputs[2]),
            campoInformacion(0.0, "Telefono", "Ingrese Su Telefono", "", inputs[3]),
            campoInformacion(0.0,"Direccion","Ingrese Su Direccion","",inputs[4]),
            botonAceptacionUsuario(10.00, "Agregar Dueño",inputs,context),
          ],
        ),
      )
    );
  }

  Container password(alto, texto, hint, helper, inputControlador) {
    return Container(
      padding: EdgeInsets.only(top: alto),
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          texto,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
            controller: inputControlador,
            obscureText: _isObscure,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              helperText: helper,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: hint,
              suffixIcon: IconButton(
                icon: _isObscure
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
            )),
      ]),
    );
  }

  Container botonAceptacionUsuario(altitud, texto, cuerpo, context) {
    return Container(
      padding: EdgeInsets.only(top: altitud),
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: ElevatedButton(
        child: Text(
          texto,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(350, 48),
          primary: Color(ColorsSelect.btnBackgroundBo2.value),
          onPrimary: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
        ),
        onPressed: (){
          if (cuerpo[0].text.length != 0 && cuerpo[1].text.length != 0 && cuerpo[2].text.length != 0 && cuerpo[3].text.length != 0 && cuerpo[4].text.length != 0){
            var urlUsuario = "http://10.0.2.2:18081/user/add";
            var urlDuenio = "http://10.0.2.2:18081/user/"+cuerpo[0].text.toString();
            var urlAddDuenio = "http://10.0.2.2:18081/duenio/add";
            var urlDestino = "listadoUsuarios";
            
            Map jsonAddUser = {
            'user': cuerpo[0].text,
            'password': cuerpo[1].text,
            'tipoU': "propietario"
            };
            var usuario = JsonEncoder().convert(jsonAddUser);
            
            Map jsonAddDuenio = {
            'nombre': cuerpo[2].text,
            'telefono': cuerpo[3].text,
            'direccion': cuerpo[4].text,
            "idUsuario": ""
            };

            setState((){
              agregarDuenio(context,urlUsuario,usuario,urlDuenio,jsonAddDuenio,urlAddDuenio,urlDestino);
            });
          }else{
            toast("No se pudo registrar al usuario, complete todos los campos de texto");
          }
        },
      ),
    );
  }

  FutureBuilder<users> listado_Usuarios(context,usuario){
  return FutureBuilder<users>(
    future: usuario,
      builder: (context,snapshot){
       if (snapshot.hasData){
         print("hubo datos");
          //final users listaUsuarios = snapshot.data ?? users;
          //print(listaUsuarios.idUsuario); //user es la lista de usuarios
        }
        else if (snapshot.hasError){ 
          return const Text("No se pudo cargar los datos con el servidor");
        }
        return const Center( 
          child: CircularProgressIndicator()
        ); 
      }
    );
  }

}