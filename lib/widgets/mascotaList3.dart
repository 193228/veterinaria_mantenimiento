import 'package:flutter/material.dart';
import 'package:mvp/src/styles/colors.dart';
import 'package:mvp/src/pages/actualizarMascota.dart';
import 'package:mvp/models/mascotas.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SwipeList extends StatefulWidget {
  SwipeList({Key? key, required this.id}) : super(key: key);
  int? id;

  @override
  State<SwipeList> createState() => _SwipeListState(id: id!);
}

class _SwipeListState extends State<SwipeList> {
  _SwipeListState({required this.id});
  int id;
  Future<List<Mascota>>? _listaMascotas;
  @override
  void initState() {
    super.initState();
    _listaMascotas = listaMascotas("http://10.0.2.2:9998/listByIdDuenio/",
        id.toString()); //10.0.2.2 si me quiero conectar desde un dispositivo virtual
  }

  @override
  Widget build(BuildContext context) {
    return mascotas(context, _listaMascotas);
  }

  Container lista(context, _listaMascotas) {
    return Container(
        child: ListView.builder(
      itemCount: _listaMascotas.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          margin: EdgeInsets.all(10),
          elevation: 10,
          child: Column(
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                title: Text(
                  'Mascota: ${_listaMascotas[index].nombre}',
                ),
                subtitle: Text(
                  'Tipo ${_listaMascotas[index].tipo}',
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                //alignment: Alignment.centerLeft,
                child: Text(
                  'Razon: ${_listaMascotas[index].razon}',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => actualizarM(
                                
                                  mascota:_listaMascotas[index])))
                    },
                    child: const Text(
                      'Actualizar',
                      style: TextStyle(
                        fontSize: 15,
                        color: ColorsSelect.txtBoSubHe,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Map json = {
                        'idMascota': _listaMascotas[index].idMascota,
                        'nombre': _listaMascotas[index].nombre,
                        'tipo': _listaMascotas[index].tipo,
                        'fechaIngreso': _listaMascotas[index].fechaIngreso,
                        "idDuenio": _listaMascotas[index].idDuenio,
                        'razon': _listaMascotas[index].razon,
                      };
                      var mascota = JsonEncoder().convert(json);
                      eliminarMascota(context,
                          "http://10.0.2.2:9998/mascota/delete", mascota);
                      //print(mascota);
                    },
                    child: const Text(
                      'Eliminar',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    ),);
  }

  Future<List<Mascota>> listaMascotas(url, id) async {
    final respuesta = await http.get(Uri.parse(url + id));
    print(respuesta.statusCode);
    List<Mascota> mascotas = [];
    if (respuesta.statusCode == 200) {
      String body = utf8.decode(respuesta.bodyBytes);
      final jsonData = jsonDecode(body);
      for (var mascota in jsonData) {
        mascotas.add(Mascota(
            mascota['idMascota'],
            mascota['nombre'],
            mascota['tipo'],
            mascota['idDuenio'],
            mascota['fechaIngreso'],
            mascota['razon']));
      }
      // this.idMascota,
      //   this.nombre,
      //   this.tipo,
      //   this.idDuenio,
      //   this.fechaIngreso,
      //   this.razon
      return mascotas;
    } else {
      throw Exception("Fallo la conexión");
    }
  }

  FutureBuilder<List<Mascota>> mascotas(context, _listaMascotas) {
    return FutureBuilder<List<Mascota>>(
        future: _listaMascotas,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Mascota> listaMascotas =
                snapshot.data ?? <Mascota>[]; //user es la lista de usuarios
            return lista(context, listaMascotas);
          }

          // else if (snapshot.hasError){
          //   return const Text("No se pudo cargar los datos con el servidor");
          // }

          return const Center(child: CircularProgressIndicator());
        });
  }

  Future eliminarMascota(context, url, mascota) async {
    final respuesta = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: mascota);
    print(respuesta.statusCode);
    
    // if (respuesta.statusCode == 200){
    //   Navigator.pushReplacementNamed(context,"listadoUsuarios");
    //   toast("Usuario Eliminado Correctamente");
    //   return idUsuario;
    // }else{
    //   toast("Ocurrio Un Error, Intente Nuevamente");
    // }
  }
}
