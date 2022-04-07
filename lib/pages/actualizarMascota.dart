import 'package:flutter/material.dart';
import 'package:mvp/src/widgets/mascotasForm.dart';
//import 'package:mvp/src/widgets/formMascotas.dart';
import 'package:mvp/src/styles/colors.dart';
import 'package:mvp/models/mascotas.dart';
class actualizarM extends StatefulWidget {
  actualizarM({Key? key, required this.mascota}) : super(key: key);
  // int? id;
  Mascota? mascota;
  @override
  State<actualizarM> createState() => _actualizarMState( mascota: mascota!);
}

class _actualizarMState extends State<actualizarM> {
  _actualizarMState({required this.mascota});
  // int id;
  Mascota mascota;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
              iconTheme: const IconThemeData(color: ColorsSelect.paginatorNext),
              title: const Text('Actualizar mascota'),
              actions: <Widget>[
                Image.asset('assets/petclinic.png',
                       height: 100,
                     ),
              ],
              elevation: null,
              backgroundColor: ColorsSelect.txtBoHe,
          ),
      body: SingleChildScrollView(
        child:
       mascotasForm(id: 1, agregar: false, mascota: mascota)
      )

    );
  }
}