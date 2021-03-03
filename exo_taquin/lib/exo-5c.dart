import 'package:flutter/material.dart';
import 'dart:math';
import 'main.dart';
import 'accueil.dart';


class Ex5c extends StatefulWidget {

  const Ex5c({ Key key }) : super(key: key);
  @override
  GridViewsimplec createState() {
    return GridViewsimplec();
  }
}
List<Tile> createTiles(double nombtuiles) {
  List<Tile> res = [];
  for (double i = -1; i <= 1; i += 2 / (nombtuiles-1)) {
    // boucle y
    for (double j = -1; j <= 1; j += 2 / (nombtuiles-1)) {
      // boucle x
        res.add(new Tile(imageURL: "https://i.picsum.photos/id/785/512/1024.jpg?hmac=Vr6gXYYAYlToUd6980VUZLTMQMr48TI8kmKcHWcqQ2k", 
                        alignment: Alignment(j, i)));
    }
  }
  return res;
}
class Tile {
  String imageURL;
  Alignment alignment;

  Tile({this.imageURL, this.alignment});

  Widget croppedImageTile(double tuiles) {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 1 / tuiles,
            heightFactor: 1 / tuiles,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }
}

class GridViewsimplec extends State<Ex5c> {
  double _numberOfTilesOnWidth = 3;

  Widget createTileWidgetFrom(Tile tile) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: InkWell(child: tile.croppedImageTile(_numberOfTilesOnWidth)),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 5c'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Expanded(
            child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(9),
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                crossAxisCount: _numberOfTilesOnWidth.toInt(),
                children: List.generate(
                    (_numberOfTilesOnWidth * _numberOfTilesOnWidth).toInt(),
                    (index) {
                  return createTileWidgetFrom(
                      createTiles(_numberOfTilesOnWidth)[index]);
                })),
          ),
          Slider(
              value: _numberOfTilesOnWidth,
              min: 3,
              max: 6,
              divisions: 3,
              label: _numberOfTilesOnWidth.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _numberOfTilesOnWidth = value;
                });
              })
        ],
      )),
    );
  }
}
