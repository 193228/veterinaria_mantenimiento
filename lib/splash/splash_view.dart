import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvp/src/pages/on_boarding.dart';
import 'package:mvp/src/styles/colors.dart';
import 'dart:ui' as ui;

class SplashView extends StatefulWidget {
 const SplashView({Key? key}) : super(key: key);

  @override
  State <SplashView> createState() =>  _SplashViewState();
}

class  _SplashViewState extends State <SplashView> {
  ui.Image? image;

  @override
  void initState(){
    super.initState();  
    _loadImage('assets/images/splash.png');
    _toOnboarding();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
          child: SizedBox(
            height: double.infinity, 
            width: double.infinity,
            child: CustomPaint(
              painter: _SplashCanvas(image),
              
            ),
          ),
      ),
    );
  }
  
  void _toOnboarding()async {
    await Future.delayed(const Duration(milliseconds:5000),(){});
    Navigator.pushReplacement(context, 
      MaterialPageRoute(
        builder: (context)=> OnBoarding(),
      ),
    );
  }
  _loadImage(String path) async{
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List() ;
    final image = await decodeImageFromList(bytes);
    setState(()=> this.image = image);
  }
}

class _SplashCanvas extends CustomPainter{
  final ui.Image? image ;
  const _SplashCanvas( this.image);
  
  @override
  void paint(Canvas canvas, Size size){
    final paint =  Paint();
    paint.color = ColorsSelect.btnBackgroundBo2;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;
    final path = Path();
    path.lineTo(0, size.height* 0.10);
    path.quadraticBezierTo(size.width*0.17, size.height*0.20, size.width*0.35, size.height*0.13);

    path.quadraticBezierTo(size.width*0.45, size.height*0.10, size.width*0.65, size.height*0.11);
    path.quadraticBezierTo(size.width*0.90, size.height*0.15, size.width, size.height*0.11);
    
    path.lineTo(size.width,0);
    path.moveTo(0, size.height );
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(size.width*0.70, size.height*0.75, size.width*0.01, size.height);
    canvas.drawPath(path, paint);

    canvas.scale(0.30,0.30);
    canvas.drawImage(image!, const Offset(125*2.5, 320*3.0), paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return true;
  }
}