import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:mvp/models/modeloCitas.dart';
import 'package:mvp/src/styles/colors.dart';

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
        backgroundColor: ColorsSelect.txtBoHe,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            FontAwesomeIcons.arrowLeft,
            color: ColorsSelect.paginatorNext,
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
      body: SingleChildScrollView(
        child: Column (
          children: [
            citas(context, _listaCitas)
          ]
        )
      )
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
            final List<Citas> listaDeCitas =
                snapshot.data ?? <Citas>[]; //user es la lista de usuarios
            return lista(context, listaDeCitas);
          }

          return const Center(child: CircularProgressIndicator());
        });
  }

  Container lista(context, _listaMascotas) { //lUEGO LO CAMBIO
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: ListView.builder(
        itemCount: _listaMascotas.length,
        itemBuilder: (_, index) => Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(_listaMascotas[index].fecha),
            subtitle: Text(_listaMascotas[index].hora),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(_listaMascotas[index].tipoServicio),
                Text(_listaMascotas[index].idMascota),
              ],
            ),
          ),
        ),
      )
    );
  }
}