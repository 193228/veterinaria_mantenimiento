import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:conexion_veterinaria/pages/inicioP.dart';
import 'package:conexion_veterinaria/pages/mascotas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/colors.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscure = true;

  final scaffoldkey = GlobalKey<ScaffoldState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final vistaEmpleado='mascotasEmpleados';
  final vistaDuenio='mascotasDuenio';
  final ip='10.0.2.2';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Iniciar sesión'),
        iconTheme: const IconThemeData(color: ColorsSelect.paginatorNext),
        actions: [
          Container(
            padding: const EdgeInsets.only(left:50, right: 10),
            height: 60,
            width: 170,
            child: Image.asset('assets/images/splash.png'),
          ),
        ],
        backgroundColor: ColorsSelect.txtBoHe,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 30, top: 40),
                padding: const EdgeInsets.only(right: 8),
                child: const Text(
                  'Inicia sesión con tu cuenta para continuar',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: ColorsSelect.txtBoSubHe),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 5),
                // margin: const EdgeInsets.only(left: 0, top: 25),
                child: const Text(
                  'Nombre de usuario',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20),
                child: 
                TextField(
                  controller: userController,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 18),
                  autofocus: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    hintText: 'Usuario',
                  ),
                  onChanged: (text) {},
                ),
              ),


               Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 5),
                // margin: const EdgeInsets.only(left: 0, top: 25),
                child: const Text(
                  'Contraseña',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20),
                child: TextField(
                  controller: passwordController,
                  obscureText: _isObscure,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 18),
                  autofocus: true,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    hintText: 'Contraseña',
                  ),
                  onChanged: (text) {},
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 250),
                child: SizedBox(
                  width: size.width - 70,
                  height: 50,
                  child: ElevatedButton(
                      child: const Text(
                        'Ingresar',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        login(userController.text, passwordController.text);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: ColorsSelect.splashColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '¿Todavia no tienes una cuenta?',
                    style: TextStyle(fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "listadoUsuarios");
                      //Navigator.pushNamed(context, 'register');
                    },
                    child: const Text(
                      'Registrate',
                      style: TextStyle(
                          color: ColorsSelect.paginatorNext, fontSize: 15),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );

    
  }

void login(String user, String password) async {
      Map<String, String> body = {
      'user': user,
      'password': password
    };

    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded"
    };

    var tipoUsuario;
    var idUsuario;

    var idDuenio;
    var idEmpleado;
    var url= 'http://${ip}:18081/user/login';
    // var body =jsonEncode(datos);
    try {
      var response = await http.post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode==200) {
      var jsonResponse = json.decode(response.body);
      log('Response Status: ${response.statusCode}');
      log('Response Body: ${response.body}');

      tipoUsuario=jsonResponse["tipo"];
      var url2 = "http://${ip}:18081/user/"+jsonResponse['user'];
      var response2 = await http.get(Uri.parse(url2));
      var jsonResponse2 = json.decode(response2.body);
      idUsuario = jsonResponse2['idUsuario'];
      }
      else if(response.statusCode==500){
        SnackBar snackbar = SnackBar(
        content: Text("Usuario o contraseña incorrectos"),
        );
      scaffoldkey.currentState!.showSnackBar(snackbar);
      return null;
      }
    } on HttpException catch (ex) {
      log('http');
      log(ex.toString());
      log('exception');
      return null;
    } on Error catch (error) {
      // code will go here
      log("segundo catch");
      log(error.toString());
      return null;
    }

    if (tipoUsuario!=null) {
      if (tipoUsuario=='empleado') {
        print("es empleado "+idUsuario.toString());
        // Manda a vista de empleado
        Navigator.pushNamed(context, 'mascotasEmpleados');
      } else {
        if (tipoUsuario=='propietario') {
        var url3 = "http://${ip}:18081/duenio/"+idUsuario.toString();
        var response3 = await http.get(Uri.parse(url3));
        var jsonResponse3 = json.decode(response3.body);
        idDuenio = jsonResponse3['idDuenio'];
        print("esto es idduenio -> "+idDuenio.toString());
        // Manda a vista de dueño
        print("es dueno "+idDuenio.toString());
        Navigator.push(context,MaterialPageRoute(builder: (context) => mascotasC(id: idDuenio)));
        // Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: (_) => mascotasC(
                                
        //                           id:));
        //Navigator.pushNamed(context, 'listaCitas');
      }
      }
    }
    else{
        SnackBar snackbar = SnackBar(
        content: Text("Algo salio mal. Intentalo nuevamente"),
        );
      scaffoldkey.currentState!.showSnackBar(snackbar);
    }
}

}
