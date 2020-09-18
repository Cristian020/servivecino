import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:restaurant_ui_kit/screens/join.dart';

class Walkthrough extends StatefulWidget {
  @override
  _WalkthroughState createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  @override
  Widget build(BuildContext context) {
    List<PageViewModel> pages = [
      PageViewModel(
        "Quieres un servicio o haces servicios",
        "Evita ir a lugares publicos por servicios."
            " disfruta desde la comodidad de tú casa. "
            "Ofreceremos los servicios que necesitas y cuando los necesita.",
        image: Image.asset(
          "assets/image1.png",
          height: 175.0,
        ),
        decoration: PageDecoration(
          titleTextStyle: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).accentColor,
          ),
          bodyTextStyle: TextStyle(fontSize: 15.0),
          dotsDecorator: DotsDecorator(
            activeColor: Theme.of(context).accentColor,
            activeSize: Size.fromRadius(8),
          ),
          pageColor: Theme.of(context).primaryColor,
        ),
      ),
      PageViewModel(
        "El servico más rapido",
        "Espera en tú casa y disfruta de otra actividad."
            " no te afanes, la distancia no importa",
        image: Image.asset(
          "assets/image2.jpg",
          height: 185.0,
        ),
        decoration: PageDecoration(
          titleTextStyle: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).accentColor,
          ),
          bodyTextStyle: TextStyle(fontSize: 15.0),
          dotsDecorator: DotsDecorator(
            activeColor: Theme.of(context).accentColor,
            activeSize: Size.fromRadius(8),
          ),
          pageColor: Theme.of(context).primaryColor,
        ),
      ),
      PageViewModel(
        "Tu celular es el localizador",
        "Te notificaremos a tu celular cuando la persona vaya a prestar el servicio."
            " Evita perder tiempo yendo a que te presten servicios"
            "vas a estar informado de todo el servicio a prestar.",
        image: Image.asset(
          "assets/image3.jpg",
          height: 175.0,
        ),
        decoration: PageDecoration(
          titleTextStyle: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).accentColor,
          ),
          bodyTextStyle: TextStyle(fontSize: 15.0),
          dotsDecorator: DotsDecorator(
            activeColor: Theme.of(context).accentColor,
            activeSize: Size.fromRadius(8),
          ),
          pageColor: Theme.of(context).primaryColor,
        ),
      ),
    ];

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: IntroductionScreen(
            pages: pages,
            onDone: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return JoinApp();
                  },
                ),
              );
            },
            onSkip: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return JoinApp();
                  },
                ),
              );
            },
            showSkipButton: true,
            skip: Text("Saltar"),
            next: Text(
              "Siguiente",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).accentColor,
              ),
            ),
            done: Text(
              "Hecho",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
