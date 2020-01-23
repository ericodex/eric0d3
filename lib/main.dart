import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'db_plantas.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:core';
import 'package:flip_card/flip_card.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() async => runApp(MeuAplicativo());

class Box extends StatelessWidget {
  static final boxDecoration = BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withAlpha(60),
            blurRadius: 15,
            offset: Offset(0, 8),
            spreadRadius: 2)
      ]);

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      duration: Duration(milliseconds: 1400),
      tween: Tween(begin: 0.0, end: 100.0),
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
              child: isEnoughRoomForTypewriter(width)
                  ? TypewriterText(" Ericódigos")
                  : FittedBox(child: Container()),
            );
          },
        );
      },
    );
  }

  isEnoughRoomForTypewriter(width) => width > 25;
}

class TypewriterText extends StatelessWidget {
  static const TEXT_STYLE = TextStyle(
      letterSpacing: 5,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.green);

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
              Icon(
                Icons.android,
                color: Colors.green,
                size: 24.0,
              ),
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
              ),
              Icon(
                Icons.code,
                color: Colors.green,
                size: 24.0,
              ),
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
            /// Baner inicial com icones
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
              child: Box(),
            ),
            //Segundo botão

            Center(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Butts(),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 80),
              child: AspectRatio(
                aspectRatio: 16 / 12,
                child: FlipCard(
                  direction: FlipDirection.VERTICAL, // default
                  front: Container(
                    alignment: Alignment.center,
                    color: Colors.deepPurple[900],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 150),
                      child: Text(
                          'Desenvolvedor de Software: Full-Stack Python e Dart Lang\n\nExperiência com BI e computação de lotes.'),
                    ),
                  ),
                  back: Container(
                    alignment: Alignment.center,
                    color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 50, 10, 150),
                      child: Text(
                          'Eric Oliveira Lima \n\nericol@outlook.com.br \n\n+55 034 988047387'),
                    ),
                  ),
                ),
              ),
            ),

            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SegundaPagina()));
              },
              textColor: Colors.white,
              color: Colors.deepPurpleAccent,
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color.fromRGBO(21, 8, 23, 1.0),
                      Color.fromRGBO(103, 39, 112, 0.8),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child: const Text('Deixe um recado:',
                    style: TextStyle(fontSize: 20)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Butts extends StatelessWidget {
  Butts({Key key}) : super(key: key);

  isEnoughRoomForTypewriter(width) => width > 20;

  static final boxDecoration = BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withAlpha(60),
            blurRadius: 15,
            offset: Offset(0, 8),
            spreadRadius: 2)
      ]);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.black,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(Icons.android),
            color: Colors.green[300],
            onPressed: () {
              //-------------------------------------

              //-------------------------------------
            },
          ),
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
    )));
  }
}
