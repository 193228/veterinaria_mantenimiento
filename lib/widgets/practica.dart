import 'package:flutter/material.dart';
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
      text: 'canvas',
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

class diagonal extends StatelessWidget {
  const diagonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      
      child: CustomPaint(
        painter: _diagonalPainter(),
        ),
    );
  }
}


class _diagonalPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 30
    );

    const textSpan = TextSpan(
      text: 'canvas diagonal',
      style: textStyle
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr
    );

    textPainter.layout(minWidth: 0,maxWidth: size.width);

    final xCenter = (size.width - textPainter.width) * 0.1;
    final yCenter = (size.height - textPainter.height)* 0.1;

    final offset = Offset(xCenter, yCenter);


        
    final paint = Paint();
    paint.color = Colors.amber; 
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();
    path.moveTo(0, size.height );
    
    path.lineTo(size.width, size.height * 0);
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
class triangulo extends StatelessWidget {
  const triangulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      
      child: CustomPaint(
        painter: _trianguloPainter(),
        ),
    );
  }
}


class _trianguloPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 30
    );

    const textSpan = TextSpan(
      text: 'canvas triangulo',
      style: textStyle
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr
    );

    textPainter.layout(minWidth: 0,maxWidth: size.width);

    final xCenter = (size.width - textPainter.width) * 0.50;
    final yCenter = (size.height - textPainter.height)* 0.1;

    final offset = Offset(xCenter, yCenter);


        
    final paint = Paint();
    paint.color = Colors.amber; 
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();
    path.moveTo(size.width, 0 );
    path.lineTo(size.width/2,size.height/2);
    path.lineTo(0,0);

    canvas.drawPath(path, paint); 
    textPainter.paint(canvas, offset);
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}
class triangulodos extends StatelessWidget {
  const triangulodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      
      child: CustomPaint(
        painter: _triangulodosPainter(),
        ),
    );
  }
}


class _triangulodosPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 30
    );

    const textSpan = TextSpan(
      text: 'triangulo',
      style: textStyle
    );
   
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr
    );

    textPainter.layout(minWidth: 0,maxWidth: size.width);

    final xCenter = (size.width - textPainter.width) * 0.15;
    final yCenter = (size.height - textPainter.height)* 0.1;

    final offset = Offset(xCenter, yCenter);


    final xCenter2 = (size.width*0.88 - textPainter.width);
    final yCenter2 = (size.height - textPainter.height)* 0.1;
    final offset2 = Offset(xCenter2, yCenter2);

        
    final paint = Paint();
    paint.color = Colors.amber; 
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();
    path.moveTo(size.width/2, 0 );
    path.lineTo(size.width/4,size.height/3);
    path.lineTo(0,0);
    

    final path2 = Path();
    path2.moveTo(size.width/2,0 );
    path2.lineTo(size.width*0.7,size.height/3);
    path2.lineTo(size.width,0);

    canvas.drawPath(path, paint); 
    canvas.drawPath(path2, paint);
    textPainter.paint(canvas, offset);
    textPainter.paint(canvas, offset2);
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

