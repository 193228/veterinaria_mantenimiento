import 'package:flutter/material.dart';

class Wheaders1 extends StatelessWidget {
 
  const Wheaders1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:500,
      color: Colors.amber,
    );
  }
}
class Wheaders2 extends StatelessWidget {
 
  const Wheaders2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:500,
      color: Colors.yellow,
      decoration:const BoxDecoration(
        borderRadius: 
          BorderRadius.only(bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40)
        )
      ),
    );
  }
}
class Wheaders3 extends StatelessWidget {
 
  const Wheaders3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.15,
      child: Container(
        height:500,
        color: Colors.amber
        
      ),
    );
  }
}

class WHeaders4 extends StatelessWidget {
  const WHeaders4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      
      child: CustomPaint(
        painter: _HeaderPainter(),
        ),
    );
  }
}


class _HeaderPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 30
    );

    const textSpan = TextSpan(
      text: 'Hola mundo canvas',
      style: textStyle
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr
    );

    textPainter.layout(minWidth: 0,maxWidth: size.width);

    final xCenter = (size.width - textPainter.width) * 0.5;
    final yCenter = (size.height - textPainter.height)* 0.25;

    final offset = Offset(xCenter, yCenter);


        
    final paint = Paint();
    paint.color = Colors.amber; 
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();
    path.moveTo(0, size.height * 0.5);
    
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint); 
    textPainter.paint(canvas, offset);
    
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }



}