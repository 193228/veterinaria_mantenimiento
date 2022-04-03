import 'dart:convert';
import 'package:conexion_veterinaria/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import '../components/body.dart';
import '../components/header.dart';
import '../conexion/DaoUser.dart';
import '../styles/colors.dart';

class addUser extends StatefulWidget {
  addUser({Key? key}) : super(key: key);

  @override
  State<addUser> createState() => _addUser();
}

class _addUser extends State<addUser> {
  bool _isObscure = true;
  final List<TextEditingController> inputs = [
  for (int i = 0; i < 3; i++)
    TextEditingController()
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBar(context,"Agregar Usuario","assets/images/splash.png","listadoUsuarios"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            textoInformativo("Agrega Un Nuevo Propietario", 30.0),
            campoInformacion(30.0,"Usuario","Ingrese Su Username", "", inputs[0]),
            password(15.0, "Password", "Ingrese Su Password", "", inputs[1]),
            //campoInformacion(15.0,"Password","Ingrese Su Password", "", inputs[1]),
            campoInformacion(15.0,"Tipo De Usuario","Ingrese Si Es Empleado O Propietario","",inputs[2]),
            botonAceptacionUsuario(35.00, "Agregar Usuario",inputs,context),
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
        onPressed: () {
          if (cuerpo[0].text.length != 0 && cuerpo[1].text.length != 0 && cuerpo[2].text.length != 0){
            Map json = {
            'user': cuerpo[0].text,
            'password': cuerpo[1].text,
            'tipoU': cuerpo[2].text
            };
            var usuario = JsonEncoder().convert(json);
            setState(() {
              agregarUsuario(context,"http://10.0.2.2:18081/user/add", usuario);
            });
          }else{
            toast("No se pudo registrar al usuario, complete todos los campos de texto");
          }
        },
      ),
    );
  }

}