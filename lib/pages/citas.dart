import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:mvp/models/modeloCitas.dart';

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
                'assets/images/petclinic.png',
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
            // Boton
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              width: 200,
              height: 48,
              child: ElevatedButton(
                onPressed: () {}, 
                child: Column(
                  children: const[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 7)
                    ),
                    Text(
                      'Acceder a las APIs',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ]
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300,48),
                  primary: Colors.black,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
                ),
              ),
            ),
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