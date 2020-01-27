import 'dart:core';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CartoesApresentacao extends StatefulWidget {
  CartoesApresentacao({Key key}) : super(key: key);

  @override
  _CartoesApresentacaoState createState() => _CartoesApresentacaoState();
}

class _CartoesApresentacaoState extends State<CartoesApresentacao> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 80),
            child: AspectRatio(
              aspectRatio: 19 / 9,
              child: FlipCard(
                direction: FlipDirection.VERTICAL, // default
                front: Container(
                  alignment: Alignment.center,
                  color: Colors.black,
                  child: Text(
                      'Desenvolvedor de Software: Full-Stack Python e Dart Lang\n\nExperiência com BI e computação de lotes.'),
                ),
                back: Container(
                  alignment: Alignment.center,
                  color: Colors.blueGrey,
                  child: Text(
                      'Eric Oliveira Lima\n\nericol@outlook.com.br\n\n+55 034 988047387'),
                ),
              ),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
            child: AspectRatio(
              aspectRatio: 19 / 9,
              child: FlipCard(
                direction: FlipDirection.VERTICAL, // default
                front: Container(
                  alignment: Alignment.center,
                  color: Colors.black,
                  child: Text(
                      'Desenvolvedor de Software: Full-Stack Python e Dart Lang\n\nExperiência com BI e computação de lotes.'),
                ),
                back: Container(
                  alignment: Alignment.center,
                  color: Colors.blueGrey,
                  child: Text(
                      'Eric Oliveira Lima\n\nericol@outlook.com.br\n\n+55 034 988047387'),
                ),
              ),
            ),
          ),
        

        ],
      ),
    );
  }
}
