import 'package:mvp/src/styles/colors.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Scaffold(
          appBar: AppBar(
              title: Container(
                  child: Row(
                children: [
                  const Text('Iniciar sesion'),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  Image.asset(
                    'assets/petclinic.png',
                    height: 100,
                  ),
                ],
              )),

              //const Text('Iniciar sesion'),
              elevation: null,
              backgroundColor: ColorsSelect.txtBoHe,
              leading: TextButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (_) => inicio_page()));

                  Navigator.pushNamed(context, 'inicioHome');
                },
                child: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  color: ColorsSelect.paginatorNext,
                ),
              )),
          body: SingleChildScrollView(
            child: Container(
              
              child: Column(
                children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container( 
                          margin: const EdgeInsets.symmetric(
                            horizontal: 30.0,
                            vertical: 40,
                          ),
                          alignment: Alignment.centerRight,
                          child: const Text(
                              'Inicia sesion con tu cuenta para continuar',
                              style: TextStyle(
                                  color: ColorsSelect.txtBoSubHe,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ]),
                  inputMail(),
                  const SizedBox(
                    height: 25.0,
                  ),
                  inputPass(),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'recuperarPass');
                        },
                        child: const Text(
                          '¿Has olvidado tu contraseña?',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xfffc1460),
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 160.0),
                    child: Container(
                        child: ElevatedButton(
                      child: const Text(
                        "Ingresar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(350, 48),
                        primary: Color(ColorsSelect.btnBackgroundBo2.value),
                        onPrimary: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                      ),
                      onPressed: () {
                        print("Siguiente");
                      },
                    )),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '¿Todavia no tienes cuenta?',
                          style: TextStyle(
                            color: ColorsSelect.txtBoSubHe,
                            fontSize: 18,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'registro');
                            },
                            child: const Text(
                              'Registrate',
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xfffc1460)),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget inputMail() {
  return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Correo electronico',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'Email Address'),
          ),
        ],
      ));
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
              //onChanged: (value) =>setState(()=>this.password),
              obscureText: true,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  suffixIcon: Icon(FontAwesomeIcons.eye),
                  border: OutlineInputBorder(),
                  hintText: 'Password'),
            )
          ]));
}


// SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(top: 60.0),
//               child: Center(
//                 child: Container(
//                     width: 200,
//                     height: 150,
//                     /*decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(50.0)),*/
//                     child: Text('hola')),
//               ),
//             ),
//             Padding(
//               //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               child: TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Correo electronico',
//                     hintText: 'Email Address'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                   left: 15.0, right: 15.0, top: 15, bottom: 0),
//               //padding: EdgeInsets.symmetric(horizontal: 15),
//               child: TextField(

//                 obscureText: true,
//                 decoration: InputDecoration(
                    
//                     prefixIcon: Icon(FontAwesomeIcons.eye),
//                     border: OutlineInputBorder(),
//                     labelText: 'Contraseña',
//                     hintText: 'Password'),
                    
//               ),
//             ),
//             FlatButton(
//               onPressed: (){
//                 //TODO FORGOT PASSWORD SCREEN GOES HERE
//               },
//               child: Text(
//                 'Forgot Password',
//                 style: TextStyle(color: ColorsSelect.paginatorNext, fontSize: 15),
//               ),
//             ),
//             Container(
//               height: 50,
//               width: 250,
//               decoration: BoxDecoration(
//                   color: ColorsSelect.btnBackgroundBo2, borderRadius: BorderRadius.circular(20)),
//               child: FlatButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (_) => inicio_page()));
//                 },
//                 child: Text(
//                   'Login',
//                   style: TextStyle(color: Colors.white, fontSize: 25),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 130,
//             ),
//             Text('New User? Create Account')
//           ],
//         ),
//       ),