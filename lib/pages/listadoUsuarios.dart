import 'package:conexion_veterinaria/components/header.dart';
import 'package:conexion_veterinaria/conexion/DaoUser.dart';
import 'package:conexion_veterinaria/pages/editar_usuario.dart';
import 'package:flutter/material.dart';
import '../models/users.dart';
import '../styles/colors.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class listaUser extends StatefulWidget {
  listaUser({Key? key}) : super(key: key);

  @override
  State<listaUser> createState() => _listaUser();
}

class _listaUser extends State<listaUser> {
  Future<List<users>>? _listadoUsuarios;
  var rutaAgregoUser = "agregarUsuario";
  var rutaAgregoPerson = "agregarDuenio";

  @override
  void initState(){
    super.initState();
    _listadoUsuarios = listaUsuarios("http://10.0.2.2:18081/listUser"); //10.0.2.2 si me quiero conectar desde un dispositivo virtual
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBar(context, "Lista De Usuarios", "assets/images/splash.png", "agregarUsuario"),
      body: vistaTileUsuarios(context,_listadoUsuarios),
      floatingActionButton: SpeedDial(
          icon: Icons.add,
          backgroundColor: Colors.green,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.face),
              label: 'Agregar Dueño',
              backgroundColor: Colors.amber,
              onTap: () {
                Navigator.pushNamed(context, rutaAgregoPerson);
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.person),
              label: 'Agregar Empleado',
              backgroundColor: Colors.amber,
              onTap: () {
                Navigator.pushNamed(context, rutaAgregoUser);
              },
            ),
          ]
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //   floatingActionButton: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: <Widget>[
      //         FloatingActionButton(
      //           onPressed: () { //agregar
      //             print("presiono agregar");
      //             Navigator.pushNamed(context, rutaAgregoUser);
      //             setState(() {});
      //           },
      //           backgroundColor: Colors.green,
      //           child: Icon(Icons.add),
      //         ),
      //         FloatingActionButton(
      //           onPressed: () { //agrego duenio
      //             Navigator.pushNamed(context, rutaAgregoPerson);
      //             setState(() {});
      //           },
      //           backgroundColor: Colors.amber,
      //           child: Icon(Icons.person_add),
      //         )
      //       ],
      //     ),
      //   )
      /*floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, rutaDestino);
            setState(() {});
          },
          backgroundColor: Colors.red,
          child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,*/
    );
  }

  ListTileTheme vistaTileUsuarios(context,_listadoUsuario){
  return ListTileTheme(
    contentPadding: EdgeInsets.all(15),
    style: ListTileStyle.list,
    dense: true,
    child: listado_Usuarios(context,_listadoUsuario),
  );
}

FutureBuilder<List<users>> listado_Usuarios(context,_listadoUsuario){
  return FutureBuilder<List<users>>(
    future: _listadoUsuario,
      builder: (context, snapshot) {
        
        if (snapshot.hasData){
          final List<users> listaUsuarios = snapshot.data ?? <users>[]; //user es la lista de usuarios
          return vistaListaUsuarios(context,listaUsuarios);
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

  ListView vistaListaUsuarios(context, _listadoUsuario) {
    return ListView.builder(
      itemCount: _listadoUsuario.length,
      itemBuilder: (context, index) => 
        Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.all(10),
        elevation: 10,
        child: ListTile(
          title: Text(_listadoUsuario[index].user),
          subtitle: Text(_listadoUsuario[index].tipoUsuario),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      users usuarioEleccion = _listadoUsuario[index];
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => editUser(usuarios: usuarioEleccion))
                      );
                    });
                  },
                  icon: Icon(Icons.edit)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      //toast("Modulo Inalcanzable, Solo el dueño puede eliminar usuarios");
                      eliminarUsuario(context,"http://10.0.2.2:18081/user/delete/",_listadoUsuario[index].idUsuario.toString());
                    });
                  },
                  icon: const Icon(Icons.delete,color: ColorsSelect.paginatorNext)),
            ],
          ),
        ),
      ),
    );
  }

}