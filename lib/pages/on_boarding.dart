import 'package:flutter/material.dart';

import 'content_onBoarding.dart';
import 'package:mvp/src/styles/colors.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int pages = 0;
  PageController controlador = PageController();
  List<Map<String, String>> onBoardingDatas = [
    {
      "text": "EPARCIMIENTO",
      "text1": "Brindamos todos los servicios para consentir a tu mascota",
      "image": "assets/images/B1.png"
    },
    {
      "text": "Adopción",
      "text1": "Brindamos todos los servicios para consentir a tu mascota",
      "image": "assets/images/B2.png"
    },
    {
      "text": "Hospitalidad",
      "text1": "Brindamos todos los servicios para consentir a tu mascota",
      "image": "assets/images/B3.png"
    },
    {
      "text": "Veterinaria",
      "text1": "Brindamos todos los servicios para consentir a tu mascota",
      "image": "assets/images/B4.png"
    },
    {
      "text": "Tienda",
      "text1": "Comprar todas las necesidades de tu m ascota sin salir de casa",
      "image": "assets/images/B5.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                color: Colors.white,
                child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            flex: 4,
                            child: PageView.builder(
                              controller: controlador,
                              onPageChanged: (value) {
                                setState(() {
                                  pages = value;
                                });
                              },
                              itemCount: onBoardingDatas.length,
                              itemBuilder: (context, index) => ContentBoarding(
                                text: onBoardingDatas[index]["text"]!,
                                text1: onBoardingDatas[index]["text1"]!,
                                image: onBoardingDatas[index]["image"]!,
                              ),
                            )
                        ),
                        Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                        onBoardingDatas.length,
                                        (index) => newMethod(index: index)
                                        )
                                ),
                                
                                Container(
                                  margin: const EdgeInsets.only(top:200, left:25, right:25),
                                  width: double.infinity,
                                  height: 48,                                 
                                  child: _button(lengAll:onBoardingDatas.length-1),
                                ) 
                              ],
                            )),
                            
                      ],
                    ),),),),);
  }

  OutlinedButton _button({required int lengAll}) {
    return OutlinedButton(                          
      child: Text(
        pages ==lengAll ?
        "Continuar"
        : "Siguiente",
        style: TextStyle(
            color: pages ==lengAll
            ? ColorsSelect.btnBackgroundBo1
            : ColorsSelect.btnTextbo1,
            fontWeight: FontWeight.bold,
            fontSize: 14 
          ),
      ),
      style: OutlinedButton.styleFrom(
          backgroundColor: pages ==lengAll
            ? ColorsSelect.btnBackgroundBo2
            : ColorsSelect.btnBackgroundBo1,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          side: BorderSide(color: 
          pages ==lengAll
            ? ColorsSelect.btnBackgroundBo2
            : ColorsSelect.btnTextbo1,
           width: 2),
        ),
      onPressed: () {
        pages ==lengAll
            ? Navigator.pushNamed(context, 'progressPainter')
            : controlador.nextPage(duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
      },
    );
  }
  

  AnimatedContainer newMethod({required int index}) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 8),
      height: 4,
      width: pages == index ? 20 : 12,
      duration: kThemeAnimationDuration,
      decoration: BoxDecoration(
        color: pages == index
            ? ColorsSelect.paginatorNext
            : ColorsSelect.paginator,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
