import 'package:conexion_veterinaria/components/header.dart';
import 'package:conexion_veterinaria/conexion/DaoUser.dart';
import 'package:conexion_veterinaria/pages/editar_usuario.dart';
import 'package:flutter/material.dart';
import '../models/users.dart';
import '../styles/colors.dart';

class listaUser extends StatefulWidget {
  listaUser({Key? key}) : super(key: key);

  @override
  State<listaUser> createState() => _listaUser();
}

class _listaUser extends State<listaUser> {
  Future<List<users>>? _listadoUsuarios;
  final String rutaDestino = "agregarUsuario";

  @override
  void initState(){
    super.initState();
    _listadoUsuarios = listaUsuarios("http://10.0.2.2:18081/listUser"); //10.0.2.2 si me quiero conectar desde un dispositivo virtual
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBar(context, "Lista De Usuarios", "assets/images/splash.png", "rutaDestino"),
      body: vistaTileUsuarios(context,_listadoUsuarios,rutaDestino),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, rutaDestino);
            setState(() {});
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }

  ListTileTheme vistaTileUsuarios(context,_listadoUsuario,vistaDestino){
  return ListTileTheme(
    contentPadding: EdgeInsets.all(15),
    style: ListTileStyle.list,
    dense: true,
    child: listado_Usuarios(context,_listadoUsuario,vistaDestino),
  );
}

FutureBuilder<List<users>> listado_Usuarios(context,_listadoUsuario,vistaDestino){
  return FutureBuilder<List<users>>(
    future: _listadoUsuario,
      builder: (context, snapshot) {
        
        if (snapshot.hasData){
          final List<users> listaUsuarios = snapshot.data ?? <users>[]; //user es la lista de usuarios
          return vistaListaUsuarios(context,listaUsuarios,vistaDestino);
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

  ListView vistaListaUsuarios(context, _listadoUsuario, vistaDestino) {
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