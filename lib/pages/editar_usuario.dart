import 'dart:convert';
import 'package:conexion_veterinaria/dialogs/dialogs.dart';
import 'package:conexion_veterinaria/models/users.dart';
import 'package:flutter/material.dart';
import '../components/body.dart';
import '../components/header.dart';
import '../conexion/DaoUser.dart';
import '../styles/colors.dart';

class editUser extends StatefulWidget {
  final users usuarios;
  editUser({Key? key, required this.usuarios}) : super(key: key);

  @override
  State<editUser> createState() => _editUser();
}

class _editUser extends State<editUser> {
  bool _isObscure = true;
  final List<TextEditingController> inputs = [
  for (int i = 0; i < 3; i++)
    TextEditingController()
  ];

  
  @override
  Widget build(BuildContext context) {
    inputs[0].text = widget.usuarios.user;
    inputs[1].text = widget.usuarios.password;
    inputs[2].text = widget.usuarios.tipoUsuario;

    return Scaffold(
      appBar: generalAppBar(context,"Editar Usuario","assets/images/splash.png","listadoUsuarios"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            textoInformativo("Modulo Editar Usuario", 30.0),
            campoInformacionEditar(30.0,"Usuario","Ingrese Su Username", "", inputs[0], widget.usuarios.user),
            password(15.0, "Password", "Ingrese Su Password", "", inputs[1], widget.usuarios.password),
            //campoInformacionEditar(15.0,"Password","Ingrese Su Password", "", inputs[1], widget.usuarios.password),
            campoInformacionEditar(15.0,"Tipo De Usuario","Ingrese Si Es Empleado O Propietario","",inputs[2], widget.usuarios.tipoUsuario),
            botonAceptacionUsuario(35.00, "Agregar Usuario",inputs,context,widget.usuarios.idUsuario),
          ],
        ),
      )
    );
  }

  Container password(alto, texto, hint, helper,inputControlador,usuario) {
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
              hintText: usuario,
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

  Container botonAceptacionUsuario(altitud, texto, cuerpo, context, id) {
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
          if (cuerpo[0].text.length != 0 && cuerpo[1].text.length != 0 && cuerpo[2].text.length != 0) {
            Map json = {
            "idUsuario": id,
            'user': cuerpo[0].text,
            'password': cuerpo[1].text,
            'tipoU': cuerpo[2].text
            };
            var usuario = JsonEncoder().convert(json);
            setState(() {
              editarUsuario(context,"http://10.0.2.2:18081/user/edit", usuario);
            });
          }else{
            toast("no se pudo actualizar, agregue todos los campos bien");
          }
        },
      ),
    );
  }

}