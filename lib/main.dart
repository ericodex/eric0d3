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
              child: isEnoughRoomForTypewriter(width)
                  ? TypewriterText(" Ericódigos")
                  : Expanded(child: Container()),
            );
          },
        );
      },
    );
  }

  isEnoughRoomForTypewriter(width) => width > 20;
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
              child: FlipCard(
                direction: FlipDirection.VERTICAL, // default
                front: Container(
                  width: 300,
                  alignment: Alignment.center,
                  color: Colors.deepPurple[900],
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 150),
                    child: Text(
                        'Desenvolvedor de Software: Full-Stack Python e Dart Lang\n\n Experiência com BI e computação de lotes.'),
                  ),
                ),
                back: Container(
                  width: 300,
                  alignment: Alignment.center,
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 150),
                    child: Text(
                        'Nome: Eric Oliveira Lima \n\n e-mail: ericol@outlook.com.br \n\n cel: +55 034 988047387'),
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
                      Color.fromRGBO(143, 55, 156, 0.6),
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
              Alert(
                context: context,
                style: alertStyle,
                type: AlertType.success,
                title: "Desenvolvimento Nativo",
                desc: "Para Android e IOS na mesma base de código",
                buttons: [
                  DialogButton(
                    child: Text(
                      "Sim!",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => Navigator.pop(context),
                    color: Color.fromRGBO(0, 179, 134, 1.0),
                    radius: BorderRadius.circular(0.0),
                  ),
                ],
              ).show();
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

var alertStyle = AlertStyle(
  animationType: AnimationType.fromTop,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  descStyle: TextStyle(fontWeight: FontWeight.bold),
  animationDuration: Duration(milliseconds: 400),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(0.0),
    side: BorderSide(
      color: Colors.grey,
    ),
  ),
  titleStyle: TextStyle(
    color: Colors.red,
  ),
);
