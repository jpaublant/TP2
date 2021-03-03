import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'main.dart';
import 'accueil.dart';

// ==============
// Models
// ==============

math.Random random = new math.Random();

class Tile {
  Color color;

  Tile(this.color);
  Tile.randomColor() {
    this.color = Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}

// ==============
// Widgets
// ==============

class TileWidget extends StatelessWidget {
  final Tile tile;

  TileWidget(this.tile);

  @override
  Widget build(BuildContext context) {
    return this.coloredBox();
  }

  Widget coloredBox() {
    return Container(
        color: tile.color,
        child: Padding(
          padding: EdgeInsets.all(70.0),
        ));
  }
}



class Ex6 extends StatefulWidget {
  Ex6({ Key key }) : super(key: key);
  @override
  PositionedTilesState createState() { return  PositionedTilesState(); }
}

class PositionedTilesState extends State<Ex6> {
 
  List<Widget> tiles =
      List<Widget>.generate(4, (index) => TileWidget(Tile.randomColor()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moving Tiles'),
        centerTitle: true,
      ),
      body: Row(children: tiles),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sentiment_very_satisfied), 
          onPressed: () { swapTiles(); },
          ),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(2, tiles.removeAt(0));
    });
  }
}