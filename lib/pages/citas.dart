import 'package:conexion_veterinaria/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../models/modeloCitas.dart';
import '../styles/colors.dart';

class CitasC extends StatefulWidget {
  const CitasC({Key? key}) : super(key: key);

  @override
  State<CitasC> createState() => _Citas();
}

class _Citas extends State<CitasC> {

  Future<List<Citas>>? _listaCitas;

  // Obtener citas de la BD y obtenerla como una lista.
  @override
  void initState(){
    super.initState();
    _listaCitas = _getCitas('http://10.0.2.2:9999/listCita');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        elevation: null,
        backgroundColor: Colors.black,
        leading: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, ''); // Agregar ruta valida.
          },
          child: const Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ),
        ),

        title: Container(
          child: Row(
            children: [
              const Text(
                'Veterinaria "El Pulgas" - Citas',
                 style: TextStyle(fontSize: 16)
                ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal:20)
              ),
              Image.asset(
                'assets/images/splash.png',
                height: 45,
              ),  
            ],
          )
        ),
      ),
      
      // Cuerpo
      body: ListTileTheme(
      contentPadding: EdgeInsets.all(15),
      style: ListTileStyle.list,
      dense: true,
      child: citas(context,_listaCitas),
      ),
    );
  }

  Future<List<Citas>> _getCitas(url) async {
    /*
    const corsHeaders = {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, DELETE, OPTIONS',
      'Access-Control-Allow-Headers': '*',
    };
    */
    final respuesta = await http.get(
      Uri.parse(url),
      // headers: corsHeaders
    );
    print(respuesta.statusCode);
    List<Citas> citas = [];
    if (respuesta.statusCode == 200) {
      String body = utf8.decode(respuesta.bodyBytes);
      final jsonData = jsonDecode(body);
      for (var cita in jsonData) {
        citas.add(Citas(
            cita['idCita'],
            cita['fecha'],
            cita['hora'],
            cita['tipoServicio'],
            cita['idMascota']));
      }
      print(citas);
      return citas;
    } else {
      throw Exception("Fallo la conexión");
    }
  }

  FutureBuilder<List<Citas>> citas(context, _listaCitas) {
    return FutureBuilder<List<Citas>>(
        future: _listaCitas,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Citas> listaDeCitas =snapshot.data ?? <Citas>[]; //user es la lista de usuarios
            //return Text(listaDeCitas[0].fecha);
            return lista(context, listaDeCitas);
          }

          return const Center(child: CircularProgressIndicator());
        });
  }

  Container lista(context, _listadoUsuario) { //lUEGO LO CAMBIO
    return Container(
      child: ListView.builder(
      itemCount: _listadoUsuario.length,
      itemBuilder: (_, index) => 
        Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.all(10),
        elevation: 10,
        child: ListTile(
          title: Text(_listadoUsuario[index].fecha),
          subtitle: Text(_listadoUsuario[index].hora),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      toast("Editar en progreso");
                      // Citas usuarioEleccion = _listadoUsuario[index];
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => editUser(usuarios: usuarioEleccion))
                      // );
                    });
                  },
                  icon: Icon(Icons.edit)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      toast("eliminar en progreso");
                      //toast("Modulo Inalcanzable, Solo el dueño puede eliminar usuarios");
                      //eliminarUsuario(context,"http://10.0.2.2:18081/user/delete/",_listadoUsuario[index].idUsuario.toString());
                    });
                  },
                  icon: const Icon(Icons.delete,color: ColorsSelect.paginatorNext)),
            ],
          ),
        ),
      ),
    ),
    );
  }
}