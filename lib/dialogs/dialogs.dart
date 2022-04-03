import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

Future<bool?> toast(String message) {
  Fluttertoast.cancel();
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.greenAccent,
      textColor: Colors.white,
      fontSize: 15.0);
}