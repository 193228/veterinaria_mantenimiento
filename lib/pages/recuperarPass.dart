import 'package:mvp/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class recuperarPass extends StatefulWidget {
  recuperarPass({Key? key}) : super(key: key);

  @override
  State<recuperarPass> createState() => _recuperarPassState();
}

class _recuperarPassState extends State<recuperarPass> {
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
                child:Row(
                  children: [
                    const Text('Recuperar contraseña'),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal:0)
                    ),
                    Image.asset('assets/petclinic.png',
                      height: 70,
                    ),
                  ],
                )
              ),
              
              //const Text('Iniciar sesion'),
              elevation: null,
              backgroundColor: ColorsSelect.txtBoHe,
              leading: TextButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (_) => inicio_page()));

                  Navigator.pop(context);
                },
                child: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  color: ColorsSelect.paginatorNext,
                ),
              )
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Center(
                      child: Text('Inicia sesion con tu cuenta para continuar',
                          style: TextStyle(
                              color: ColorsSelect.txtBoSubHe,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  inputMail(),
                  
                  const SizedBox(
                    height: 25.0,
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 220.0),
                    child: Container(
                        child: ElevatedButton(
                      child: const Text(
                        "Enviar Solicitud",
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
                        print("Siguiente");
                      },
                    )),
                  ),
                  
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
        children:  [
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
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              helperText: "Ingrese su correo electronico y le enviaremos un \ncorreo electronico que contiene un enlace para \nestablecer su contraseña",
              border: const OutlineInputBorder(), 
              hintText: 'Direccion de correo'),
          ),
        ],
      ));

}