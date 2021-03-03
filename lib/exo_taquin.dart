import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'main.dart';
import 'accueil.dart';
import 'package:flutter/material.dart';

 double nbcasesligne = 3;

math.Random random = new math.Random();

class Tile  extends StatelessWidget {
  String imageURL;
  Alignment alignment;
  final Tile tile;
  Tile({this.tile,this.imageURL, this.alignment});

  Widget croppedImageTile(double number) {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 1 / number,
            heightFactor: 1 / number,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }
  Widget build(BuildContext context) {

    double number;
    return this.croppedImageTile(number);
  }
}

class TileWidget extends StatelessWidget {
  final Tile2 tile;

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
List<Widget> createTiles(double nbTiles) {
  List<Widget> res = [];
  for (double i = -1; i <= 1; i += 2 / (nbTiles-1)) {
    // boucle y
    for (double j = -1; j <= 1; j += 2 / (nbTiles-1)) {
      // boucle x
        res.add(new Tile(imageURL: "https://i.picsum.photos/id/785/512/1024.jpg?hmac=Vr6gXYYAYlToUd6980VUZLTMQMr48TI8kmKcHWcqQ2k",
                         alignment: Alignment(j, i)));
    }
  }
  return res;
}




class Taquin extends StatefulWidget {
   Taquin({ Key key }) : super(key: key);
  @override
  Jeutaquin createState() { return Jeutaquin(); }

}
 
class Jeutaquin extends State<Taquin> {

Widget createTileWidgetFrom(Tile tile) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: InkWell(onTap: () {
        swapTiles();
      },
        child: tile.croppedImageTile(nbcasesligne)),
    );
    
  }


 /* List<Widget> tiles = List<Widget>.generate(
                    (nbcasesligne * nbcasesligne).toInt(),
                    (index) {
                  return createTileWidgetFrom(
                    createTiles(nbcasesligne)[index]);
                }); */
 

 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Jeu Taquin'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Expanded(
            child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(4),
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                crossAxisCount: nbcasesligne.toInt(),
                children: List<Widget>.generate(
                    (nbcasesligne * nbcasesligne).toInt(),
                    (index) {
                  return createTileWidgetFrom(
                    createTiles(nbcasesligne)[index]);
                }) , 
                ),
          ),
          Slider(
              value: nbcasesligne,
              min: 3,
              max: 6,
              divisions: 3,
              label: nbcasesligne.round().toString(),
              onChanged: (double value) {
                setState(() {
                  nbcasesligne = value;
                });
              })
        ],
      )),
    );
   
  }

    swapTiles() {
       setState(() {
       tiles.insert((nbcasesligne*nbcasesligne).toInt(), tiles.removeAt(0));
          });
                     }
}
 