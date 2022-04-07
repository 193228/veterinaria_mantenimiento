import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:conexion_veterinaria/styles/colors.dart';
import 'package:conexion_veterinaria/models/mascotas.dart';
import 'package:http/http.dart' as http;

class mascotasForm extends StatelessWidget {
  int? id;
  mascotasForm({Key? key, required this.id}) : super(key: key);
  TextEditingController nombre = TextEditingController();
  TextEditingController tipo = TextEditingController();
  TextEditingController fecha = TextEditingController();
  TextEditingController razon = TextEditingController();
  initState(){
      if(id!=0){
      print(this.id);
      }else{print("no lleva id");}
    }
  @override
  Widget build(BuildContext context) {
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
                      border: OutlineInputBorder(),
                      hintText: 'Nombre'
                    ),
                    onChanged: (text) {
                      
                    },
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: TextField(
                    controller: tipo,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Tipo'
                    ),
                    onChanged: (text) {
                     
                    },
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: TextField(
                    controller: fecha,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Fecha ingreso'
                    ),
                    onChanged: (text) {
                      
                    },
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
                    onChanged: (text) {
                      
                    },
                  )),

                  id!=0 ?
                  Container(
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () => {},
                child: Text(
                  'Actualizar',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 48),
                    primary: Color(ColorsSelect.paginatorNext.value),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0))),
              ),
            )
             : 
             Container(
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () => {
                  
                },
                child: Text(
                  'Agregar',
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

  Future agregarMascota(context,url,mascota) async {
  final respuesta = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: mascota
  );
  print(respuesta.statusCode);
  }
}