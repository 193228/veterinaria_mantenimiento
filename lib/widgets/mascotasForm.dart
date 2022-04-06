import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvp/src/styles/colors.dart';
import 'package:mvp/models/mascotas.dart';
import 'package:http/http.dart' as http;

class mascotasForm extends StatefulWidget {
  mascotasForm({Key? key, required this.id, required this.agregar,  required this.mascota})
      : super(key: key);
  int? id;
  bool? agregar;
  Mascota? mascota;
  @override
  State<mascotasForm> createState() =>
      // ignore: no_logic_in_create_state
      _mascotasFormState(id: id!, agregar: agregar!, mascota: mascota!);
}

// ignore: camel_case_types
class _mascotasFormState extends State<mascotasForm> {
  _mascotasFormState({required this.id, required this.agregar, required this.mascota});
  int id;
  bool agregar;
  Mascota? mascota;
  
  TextEditingController nombre = TextEditingController();
  TextEditingController tipo = TextEditingController();
  TextEditingController fecha = TextEditingController();
  TextEditingController razon = TextEditingController();
  // Mascota? mascotaglobal;

  @override
  initState() {
    super.initState();

    // if (agregar == false) {
    // mascota =  mascotaID("http://10.0.2.2:9998/mascotaid/", id.toString());
    // print(mascota!.nombre);
    // }
  }

  Widget build(BuildContext context) {
    agregar==false ?
    nombre.text =mascota!.nombre
    : nombre;
    agregar==false ?
    tipo.text =mascota!.tipo
    : tipo;
    agregar==false ?
    fecha.text =mascota!.fechaIngreso
    : fecha;
    agregar==false ?
    razon.text =mascota!.razon
    : razon;
    
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TextField(
                controller: nombre,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Nombre"),
                onChanged: (text) {},
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextField(
                  controller: tipo,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Tipo'),
                  onChanged: (text) {},
                )),
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextField(
                  controller: fecha,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Fecha ingreso'),
                  onChanged: (text) {},
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextField(
                  maxLines: 6,
                  controller: razon,
                  decoration: InputDecoration(
                    hintText: 'Razon',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {},
                )),
            agregar != true
                ? Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        
                        Map json = {
                          'idMascota': widget.mascota!.idMascota,
                          'nombre': nombre.text,
                          'tipo': tipo.text,
                          'fechaIngreso': fecha.text,
                          "idDuenio": id,
                          'razon': razon.text
                        };

                        var mascota = JsonEncoder().convert(json);
                        print(mascota);
                        setState(() {
                          agregarMascota(context,
                              "http://10.0.2.2:9998/mascota/update", mascota);
                        });
                      },
                      child: Text(
                        'Actualizar2',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 48),
                          primary: Color(ColorsSelect.paginatorNext.value),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0))),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        if (nombre.text.length != 0 &&
                            tipo.text.length != 0 &&
                            fecha.text.length != 0 &&
                            razon.text.length != 0) {
                          Map json = {
                            
                            'nombre': nombre.text,
                            'tipo': tipo.text,
                            'fechaIngreso': fecha.text,
                            "idDuenio": id,
                            'razon': razon.text
                          };
                          var mascota = JsonEncoder().convert(json);
                          setState(() {
                            agregarMascota(context,
                                "http://10.0.2.2:9998/mascota/add", mascota);
                          });
                        } else {
                          //toast("No se pudo registrar al usuario, complete todos los campos de texto");
                        }
                      },
                      child: Text(
                        'Agregar2',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 48),
                          primary: Color(ColorsSelect.btnBackgroundBo2.value),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0))),
                    ),
                  ),
          ],
        ),
      )));
  }

  Future agregarMascota(context, url, mascota) async {
    final respuesta = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: mascota);
    print(respuesta.statusCode);
  }

  // mascotaID(url, id) async {
  //   final respuesta = await http.get(Uri.parse(url + id));
  //   if (respuesta.statusCode == 200) {
  //     //String body = utf8.decode(respuesta.bodyBytes);
  //     var jsonData = jsonDecode(respuesta.body);
  //     //return Mascota.fromJson(jsonData);
      
  //     //  return Mascota(
  //     //     jsonData['idMascota'],
  //     //     jsonData['nombre'],
  //     //     jsonData['tipo'],
  //     //     jsonData['idDuenio'],
  //     //     jsonData['fechaIngreso'],
  //     //     jsonData['razon']);
  //     // return mascota;
  //   } else {
  //     throw Exception("Fallo la conexión");
  //   }
  // }
  // FutureBuilder<Mascota> mascotas(context, mascota) {
  //   return FutureBuilder<Mascota>(
  //       future: mascota,
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           Mascota m = Mascota(
  //             snapshot.data.idMascota,
  //             snapshot.data.nombre,
  //             snapshot.data.tipo,
  //             snapshot.data.idDuenio,
  //             snapshot.data.fechaIngreso,
  //             snapshot.data.razon,
  //           );
  //           return formulario(context, m);

            
  //         }

  //         // else if (snapshot.hasError){
  //         //   return const Text("No se pudo cargar los datos con el servidor");
  //         // }

  //         return const Center(child: CircularProgressIndicator());
  //       });
  // }
  
}
