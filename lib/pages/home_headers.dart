import 'package:flutter/material.dart';
//import 'package:mvp/src/widgets/w_headers.dart';
import 'package:mvp/src/widgets/practica.dart';

class homeHeader extends StatelessWidget {
  
  const homeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:triangulo(),
    );
  }
}