import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:conexion_veterinaria/widgets/mascotaList3.dart';
import 'package:conexion_veterinaria/widgets/mascotasForm.dart';
import 'package:conexion_veterinaria/models/mascotas.dart';
import '../styles/colors.dart';
//import 'package:mvp/src/widgets/formMascotas.dart';

class mascotasC extends StatefulWidget {
  mascotasC({Key? key, required this.id}) : super(key: key);
  int? id;
  @override
  State<mascotasC> createState() => _mascotasCState(id: id!);
}

class _mascotasCState extends State<mascotasC> {
  _mascotasCState({required this.id});
  int id;
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
          SwipeList(id:id),
          mascotasForm(id: id, agregar: true, mascota: new Mascota(00, "nombre", "tipo", 00, "fechaIngreso", "razon"))
        ],
      )
      ),
    );
    
  }
}