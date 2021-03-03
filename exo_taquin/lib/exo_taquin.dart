import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'main.dart';
import 'accueil.dart';
import 'package:flutter/material.dart';


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
            widthFactor: 1 / (number),
            heightFactor: 1 / (number),
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
   
 double _nbcasesligne = 3;
 
  @override
  void initState() {
    super.initState();
    generateTiles();
    generateTiles2();
   
  }
  
 List<Widget>  generateTiles() {
        print(_nbcasesligne);
        return List<Widget>.generate((_nbcasesligne * _nbcasesligne).toInt(), (index) {
        return createTileWidgetFrom(createTiles(_nbcasesligne)[index]);
    });
  }
 
 Widget createTileWidgetFrom(Tile tile) {
  
    return Container(
      margin: EdgeInsets.all(4.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: tile.croppedImageTile(_nbcasesligne),
        ),  
    ),);
    
  }
 /*  void generateTiles2() {
  tiles=generateTiles();
  }*/
    List<Widget> tiles;
   void generateTiles2() {
    tiles=generateTiles();
  }
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
            child: GridView.builder(
            
                primary: false,
                padding: const EdgeInsets.all(4),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                crossAxisCount: _nbcasesligne.toInt(),),
                itemCount: (_nbcasesligne*_nbcasesligne).toInt(),
                itemBuilder: (BuildContext context, int index) {
                return InkWell( 
                  child:  tiles[index], // ici pour que le slider fonctionne correctement j'utilise 'generateTiles()[]'
                                         // cependant pour que les tuiles soient interactives il faut que j'utilise tuiles[index]
                  onTap: () {
                   setState(() {
                     tiles.insert(index, tiles.removeAt(index+1));
                      
                   });
                   
                  },
                );
                rebuildAllChildren(context) ;},
          ),),
          Slider(
              value: _nbcasesligne,
              min: 3,
              max: 6,
              divisions: 3,
              label: _nbcasesligne.round().toString(),
              onChanged: (double value) {
                setState(() {
                
                  _nbcasesligne = value;
                  
                });
               rebuildAllChildren(context);},
             ),
        ],
      )),
     
    );
    
  }
  void rebuildAllChildren(BuildContext context) {
  void rebuild(Element el) {
    el.markNeedsBuild();
    el.visitChildren(rebuild);
  }
  (context as Element).visitChildren(rebuild);
}
 swapTiles() {
       setState(() {
   
       generateTiles().insert(1, generateTiles().removeAt(0));
          });
              } 

}
 