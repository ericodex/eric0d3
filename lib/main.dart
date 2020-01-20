import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'db_plantas.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:core';

void main() async => runApp(MeuAplicativo());

// Importante: Tudo é um Widget.

Map<int, Widget> op = {1: PaginaInicial(), 2: PaginaInicial()};


class Box extends StatelessWidget {
  static final boxDecoration = BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withAlpha(60),
            blurRadius: 5,
            offset: Offset(0, 8),
            spreadRadius: 2)
      ]);

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      duration: Duration(milliseconds: 400),
      tween: Tween(begin: 0.0, end: 80.0),
      builder: (context, height) {
        return ControlledAnimation(
          duration: Duration(milliseconds: 1200),
          delay: Duration(milliseconds: 500),
          tween: Tween(begin: 2.0, end: 300.0),
          builder: (context, width) {
            return Container(
              decoration: boxDecoration,
              width: width,
              height: height,
              child: TypewriterText("  Ericódigos  "),
            );
          },
        );
      },
    );
  }

  isEnoughRoomForTypewriter(width) => width > 20;
}

class TypewriterText extends StatelessWidget {
  static const TEXT_STYLE =
      TextStyle(letterSpacing: 5, fontSize: 20, fontWeight: FontWeight.w600, color: Colors.green);

  final String text;
  TypewriterText(this.text);

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
        duration: Duration(milliseconds: 800),
        delay: Duration(milliseconds: 800),
        tween: IntTween(begin: 0, end: text.length),
        builder: (context, textLength) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text.substring(0, textLength), style: TEXT_STYLE),
              ControlledAnimation(
                playback: Playback.LOOP,
                duration: Duration(milliseconds: 600),
                tween: IntTween(begin: 0, end: 1),
                builder: (context, oneOrZero) {
                  return Opacity(
                      opacity: oneOrZero == 1 ? 1.0 : 0.0,
                      child: Text("_", style: TEXT_STYLE));
                },
              )
            ],
          );
        });
  }
}

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<int, Widget> op = {1: PaginaInicial(), 2: PaginaInicial()};
    return MaterialApp(
        title: 'Ericódigos',
        theme: ThemeData(
          brightness: Brightness.dark,
          backgroundColor: Colors.black,
          primaryColor: Colors.blueGrey,
        ),
        home: CustomSplash(
          imagePath: 'assets/ericodigosSplash.gif',
          backGroundColor: Colors.black,
          animationEffect: 'fade-in',
          logoSize: 200,
          home: PaginaInicial(),
          duration: 4000,
          type: CustomSplashType.StaticDuration,
          outputAndHome: op,
        ) // Widget Pagina Inicial
        );
  }
}


// Página inivcial
class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //Terceiro botão
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Box(),
            ),
            //Segundo botão
            const SizedBox(height: 30),
            Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => SegundaPagina()));
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color.fromRGBO(21, 8, 23, 1.0),
                        Color.fromRGBO(103, 39, 112, 0.8),
                        Color.fromRGBO(143, 55, 156, 0.6),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('Gradient Button',
                      style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SegundaPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: RaisedButton(
          onPressed: () {
            principal();
          },
          child: Text('Testa base de dados'),
        )
        
        ));
  }
}

