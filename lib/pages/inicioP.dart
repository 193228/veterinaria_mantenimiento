import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:conexion_veterinaria/styles/colors.dart';
import 'package:conexion_veterinaria/widgets/mascotaList3.dart';
import 'package:conexion_veterinaria/widgets/mascotasForm.dart';

class inicioP extends StatefulWidget {
  inicioP({Key? key}) : super(key: key);

  @override
  State<inicioP> createState() => _inicioPState();
}

class _inicioPState extends State<inicioP> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Image.asset('assets/petclinic2.png'),
          leadingWidth: 100,
          title: const Text('Inicio'),
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
      body:  GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 2,
  children: <Widget>[
    Container(
      decoration: BoxDecoration(
        color: ColorsSelect.btnBackgroundBo2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_today_rounded,
                  color: Colors.white,
                  size: 60.0,
                  semanticLabel: 'Text to announce in accessibility modes',
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                width: double.infinity,
                child: ElevatedButton(
                
                style: ElevatedButton.styleFrom(
                  primary: ColorsSelect.paginatorNext,
                  //padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
                child: const Text('Citas'),
            ),
              ),
            ],),
          
      ),
      //color: ColorsSelect.btnBackgroundBo2,
    ),
    Container(
      decoration: BoxDecoration(
        color: ColorsSelect.btnBackgroundBo2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.people_alt_outlined,
                  color: Colors.white,
                  size: 60.0,
                  semanticLabel: 'Text to announce in accessibility modes',
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                width: double.infinity,
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ColorsSelect.paginatorNext,
                  //padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
                child: const Text('Dueños'),
            ),
              ),
            ],),
          
      ),
      
    ),
    Container(
      decoration: BoxDecoration(
        color: ColorsSelect.btnBackgroundBo2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.pets,
                  color: Colors.white,
                  size: 60.0,
                  semanticLabel: 'Text to announce in accessibility modes',
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                width: double.infinity,
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ColorsSelect.paginatorNext,
                  //padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
                child: const Text('Mascotas'),
            ),
              ),
            ],),
          
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: ColorsSelect.btnBackgroundBo2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.bookMedical,
                  color: Colors.white,
                  size: 60.0,
                  semanticLabel: 'Text to announce in accessibility modes',
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                width: double.infinity,
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ColorsSelect.paginatorNext,
                  //padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
                child: const Text('Medicamentos'),
            ),
              ),
            ],),
          
      ),
    ),
    // Container(
    //   padding: const EdgeInsets.all(8),
    //   child: const Text('Revolution is coming...'),
    //   color: Colors.teal[500],
    // ),
    // Container(
    //   padding: const EdgeInsets.all(8),
    //   child: const Text('Revolution, they...'),
    //   color: Colors.teal[600],
    // ),
  ],
)
      
      
      ),
    );
    
  }
}