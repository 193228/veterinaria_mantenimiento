import 'package:flutter/material.dart';
import 'package:mvp/src/pages/progressPainter.dart';
import 'dart:ui' as ui;
import 'dart:async';
class progressView extends StatefulWidget {
 const progressView({Key? key}) : super(key: key);

  @override
  State <progressView> createState() =>  progressViewState();
}

class  progressViewState extends State <progressView> {
  double porAnima=0;

  @override
  void initState(){
    super.initState();  
    animation();
    toOnboarding();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
    
      body: Center(
          
          child: Container(
            // margin: const EdgeInsets.all(8),
            height: 200, 
            width: 200,
            //color: ColorsSelect.paginatorNext,
            child: CustomPaint(
              
              painter: progressPainter(valor: porAnima),
              
            ),
          ),
      ),
    );
  }
  void toOnboarding()async {
    await Future.delayed(const Duration(milliseconds:2000),(){});
    Navigator.pushNamed(context, 'inicioHome');
  }
  animation(){
    Timer.periodic(const Duration(milliseconds: 80), (timer) {
      setState((){
        porAnima += 10;
        if(porAnima==110){
          porAnima=0;
        }
      });
     });
  }
  // AnimatedContainer metodo({required int valor}) {
  //   return AnimatedContainer(
  //     duration: kThemeAnimationDuration,
      
  //   );
  // }

}

