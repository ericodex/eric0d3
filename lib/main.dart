import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'db_plantas.dart';
import 'cards.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:core';
import 'objetos_flare.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final _font = GoogleFonts.pressStart2P();

  final String text;
  TypewriterText(this.text);

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
        duration: Duration(milliseconds: 800),
        delay: Duration(milliseconds: 800),
        tween: IntTween(begin: 0, end: text.length),
        builder: (context, textLength) {
          return FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone_android,
                    color: Colors.green,
                    size: 24.0,
                  ),
                  Text(text.substring(0, textLength), style: _font),
                  ControlledAnimation(
                    playback: Playback.LOOP,
                    duration: Duration(milliseconds: 600),
                    tween: IntTween(begin: 0, end: 1),
                    builder: (context, oneOrZero) {
                      return Opacity(
                          opacity: oneOrZero == 1 ? 1.0 : 0.0,
                          child: Text("_", style: _font));
                    },
                  ),
                  Icon(
                    Icons.code,
                    color: Colors.green,
                    size: 24.0,
                  ),
                ],
              ),
            ),
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
        ));
  }
}

class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        backgroundColor: Colors.transparent,
        expandedHeight: 100,
        floating: true,
        flexibleSpace: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Box(),
        ),
      ),
      SliverFillRemaining(
        fillOverscroll: true,
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Botao(),
                ],
              ),

              /// -> Cartões
              CartoesApresentacao(),
            ],
          ),
        ),
      )
    ]));
  }
}

class Botao extends StatelessWidget {
  Botao({Key key}) : super(key: key);

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
      child: Row(
        children: <Widget>[
          Padding(
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
                  Navigator.push(
                      context,
                      //MaterialPageRoute(builder: (context) => SegundaPagina()));
                      MaterialPageRoute(builder: (context) => VapowaveSpace()));
                  //-------------------------------------
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Ink(
              decoration: const ShapeDecoration(
                color: Colors.black,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(Icons.cloud_upload),
                color: Colors.green[300],
                onPressed: () {
                  //-------------------------------------
                  Navigator.push(
                      context,
                      //MaterialPageRoute(builder: (context) => SegundaPagina()));
                      MaterialPageRoute(
                          builder: (context) => InterruptorCicardiano()));
                  //-------------------------------------
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SegundaPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Icon(
      Icons.favorite,
    )));
  }
}

//--------- Insert Flare Animation
