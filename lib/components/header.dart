import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../styles/colors.dart';

AppBar generalAppBar(context,titulo,imagen,rutaDestino) {
  return AppBar(
    title: Text(titulo),
    leading: TextButton(
      onPressed: () {
        Navigator.pushNamed(context, rutaDestino);
      },
      child: const Icon(
        FontAwesomeIcons.arrowLeft,
        color: ColorsSelect.paginatorNext,
      ),
    ),
    actions: [
      IconButton(onPressed: (){}, icon: Image.asset(imagen))
    ],
  );
}