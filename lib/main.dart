import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'db_plantas.dart';
import 'package:custom_splash/custom_splash.dart';

import 'dart:core';

void main() async => runApp(MeuAplicativo());

// Importante: Tudo é um Widget.

Map<int, Widget> op = {1: PaginaInicial(), 2: PaginaInicial()};

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
          animationEffect: 'zoom-out',
          logoSize: 200,
          home: PaginaInicial(),
          duration: 4000,
          type: CustomSplashType.StaticDuration,
          outputAndHome: op,
        ) // Widget Pagina Inicial
        );
  }
}>

// Página inivcial
class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ericódigos Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //Primeiro botão
            const SizedBox(height: 60),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => SegundaPagina()));
              },
              child:
                  const Text('Dados OffLine', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 30),
            RaisedButton(
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
        appBar: AppBar(title: Text("Segunda Página")),
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

