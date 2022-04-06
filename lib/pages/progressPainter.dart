import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mvp/src/styles/colors.dart';

class progressPainter extends CustomPainter{
  double valor=0;
  progressPainter({required this.valor});
  @override
  void paint(Canvas canvas, Size size){
    final paint =  Paint();
    paint.color = ColorsSelect.paginator;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 7;
    
    canvas.drawCircle( Offset(size.width*0.50, size.height*0.50), size.height/3, paint);

    final paint2 =  Paint();
    paint2.color = ColorsSelect.btnBackgroundBo2;
    paint2.style = PaintingStyle.stroke;
    paint2.strokeWidth = 7;
   
    double porcentaje = pi*(2*(valor/100.0));
    //path2.lineTo(size.width,size.height);
    canvas.drawArc(
      Rect.fromCircle(
        center:  Offset(size.width*0.50, size.height*0.50), 
        radius: size.height/3
      ),
      -pi/2, porcentaje, false, paint2
    );
    //canvas.drawPath(path2, paint2);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return true;
  }
}