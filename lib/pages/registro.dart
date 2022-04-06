import 'package:flutter/material.dart';
import 'package:mvp/src/styles/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/gestures.dart';
class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _Registro();
}

class _Registro extends State<Registro> {
  var value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              iconTheme: const IconThemeData(color: ColorsSelect.paginatorNext),
              title: Container(
                child:Row(
                  children: [
                    const Text('Registrate'),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal:10)
                    ),
                    Image.asset('assets/petclinic.png',
                      height: 100,
                    ),
                  ],
                )
              ),
              elevation: null,
              backgroundColor: ColorsSelect.txtBoHe,

              // leading: TextButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, 'login');
              //   },
              //   child: const Icon(
              //     FontAwesomeIcons.arrowLeft,
              //     color: ColorsSelect.paginatorNext,
              //   ),
              // )
          ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              children: [
                // Texto
                const Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Center(
                      child: Text('Crea una cuenta para empezar a usar la app',
                          style: TextStyle(
                              color: ColorsSelect.txtBoSubHe,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                
                // Texto 1
                Container(
                  margin: const EdgeInsets.only(top: 40, left: 30),
                  child: Row(
                    children: const <Widget>[
                      Text(
                        'Nombre',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                        )
                      )
                    ],
                  )
                ),
                // Entrada 1
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 30, top: 5),
                  child:  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                      ),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintText: 'Nombre completo'
                    ),
                  ),
                ),
                // Texto 2
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 30),
                  child: Row(
                    children: const <Widget>[
                      Text(
                        'Correo electrónico',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                        )
                      )
                    ],
                  )
                ),
                // Entrada 2
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 20),
                  child:  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintText: 'Dirección de correo'
                    ),
                  ),
                ),
                
                // Entrada 3
                inputPass(),
                
                // Checkbox
                Container(
                  margin: const EdgeInsets.only(top: 15, left: 20),
                  child: Row(
                    children: <Widget>[
                      Checkbox (
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        value: value,
                        onChanged: (v) {
                          setState(() {
                            value = v!;
                          });
                        },
                      ),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children:  <TextSpan>[
                           const TextSpan(
                              text: 'Al registrarme, acepto los ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                decoration: TextDecoration.none
                              )
                            ),
                            TextSpan(
                              text: 'terminos y\n',
                              recognizer: new TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, 'login'),
                              style:const TextStyle(
                                color: Color(0xfffc1460),
                                fontSize: 12,
                                decoration: TextDecoration.none
                              )
                            ),
                            TextSpan(
                              text: 'condiciones',
                              recognizer: new TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, 'login'),
                              style:const TextStyle(
                                color: Color(0xfffc1460),
                                fontSize: 12,
                                decoration: TextDecoration.none
                              )
                            ),
                            const TextSpan(
                              text: ' y la',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                decoration: TextDecoration.none
                              )
                            ),
                            TextSpan(
                              text: ' politica de privacidad',
                              recognizer: new TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, 'login'),
                              style:const TextStyle(
                                color: Color(0xfffc1460),
                                fontSize: 12,
                                decoration: TextDecoration.none
                              )
                            )
                          ]
                        )
                      ),
                    ],
                  )
                ),
                // Boton
                Container(
                margin: const EdgeInsets.only(top: 40),
                width: 320,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {}, 
                    child: Column(
                      children: const[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 7)
                        ),
                        Text(
                          'Crear Cuenta',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ]
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300,48),
                      primary: const Color(0xff76a757),
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))
                    ),
                  ),
                ),
                // Texto Final
                Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '¿Ya tienes una cuenta?',
                            style: TextStyle(
                              color: ColorsSelect.txtBoSubHe,
                              fontSize: 18,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'login');
                              },
                              child: const Text(
                                'Iniciar Sesion',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xfffc1460)),
                              )),
                        ],
                      ),
                    )
              ],
          ),
        ),
      )
    );
  }
  Widget inputPass() {
  return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           const Text(
              'Contraseña',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
           const SizedBox(
              height: 10,
            ),
            TextField(              
              obscureText: true,
              decoration: InputDecoration(
                  helperText: "La contraseña debe contener caracteres, números y\nsimbolos con un minimode 6 caracteres.",
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(FontAwesomeIcons.eye),
                  hintText: 'Password'
                  )
                  ,
            )
          ]));
}
}