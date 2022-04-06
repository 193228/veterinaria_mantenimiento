import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mvp/src/styles/colors.dart';
import 'package:mvp/src/widgets/mascotaList3.dart';
import 'package:mvp/src/widgets/mascotasForm.dart';
import 'package:mvp/models/mascotas.dart';
//import 'package:mvp/src/widgets/formMascotas.dart';

class mascotasC extends StatefulWidget {
  mascotasC({Key? key}) : super(key: key);

  @override
  State<mascotasC> createState() => _mascotasCState();
}

class _mascotasCState extends State<mascotasC> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom:const TabBar(
            tabs:[
              Text('Lista',
               style: TextStyle(fontSize: 18),
              ),
              Text('Nuevo',
               style: TextStyle(fontSize: 18),),
            ]
          ),
          leading: Image.asset('assets/petclinic2.png'),
          leadingWidth: 100,
          title: const Text('Mascotas'),
          elevation: null,
          backgroundColor: ColorsSelect.txtBoHe,
          actions: <Widget>[
             IconButton(
              icon: const Icon(Icons.logout, color: Colors.white),
              tooltip: 'Cerrar sesion',
              onPressed: () {
              },
            ),
          ],
          
        ),
      body:  TabBarView(
        children: [
          SwipeList(id:1),
          mascotasForm(id: 1, agregar: true, mascota: new Mascota(00, "nombre", "tipo", 00, "fechaIngreso", "razon"))
        ],
      )
      ),
    );
    
  }
}