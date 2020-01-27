import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_dart/math/mat2d.dart';
import 'objetos_flare.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with FlareController {
  static final List<bool> options = [false, true, false, true, true];
  bool _snapToEnd = true;

  ActorAnimation _pullAnimation;

  @override
  void initialize(FlutterActorArtboard artboard) {
    _pullAnimation = artboard.getAnimation("switch_day");
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Space(),
            FlatButton(
              onPressed: () {
                //Navigator.of(context).pop();
              },
              color: Colors.pinkAccent,
              child: const Text('Voltar'),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    // TODO: implement advance
    throw UnimplementedError();
  }
}

class Interruptor_page extends StatefulWidget {
  Interruptor_page({Key key}) : super(key: key);

  @override
  _Interruptor_pageState createState() => _Interruptor_pageState();
}

bool _snapToEnd = true;

class _Interruptor_pageState extends State<Interruptor_page> with FlareController {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: false,
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Configurações'),
            ),
          ),

          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.topLeft,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Center(child: DayNigth(false,snapToEnd: _snapToEnd, onToggle: (){
                    setState(() {
                      _snapToEnd =false;
                
                    });
                  }),)
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    // TODO: implement advance
    throw UnimplementedError();
  }

  @override
  void initialize(FlutterActorArtboard artboard) {
    // TODO: implement initialize
  }

  @override
  void setViewTransform(Mat2D viewTransform) {
    // TODO: implement setViewTransform
  }
}
