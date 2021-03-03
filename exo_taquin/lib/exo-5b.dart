import 'package:flutter/material.dart';
import 'dart:math';
import 'main.dart';
import 'accueil.dart';

class Ex5b extends StatefulWidget {

  const Ex5b({ Key key }) : super(key: key);
  @override
  GridViewsimpleb createState() {
    return GridViewsimpleb();
  }
}

class Tile {
  String imageURL;
  Alignment alignment;

  Tile({this.imageURL, this.alignment});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }
}

Tile tile = new Tile(
    imageURL: "https://i.picsum.photos/id/785/512/1024.jpg?hmac=Vr6gXYYAYlToUd6980VUZLTMQMr48TI8kmKcHWcqQ2k", alignment: Alignment.topLeft);
Tile tile_centerleft = new Tile(
    imageURL: "https://i.picsum.photos/id/785/512/1024.jpg?hmac=Vr6gXYYAYlToUd6980VUZLTMQMr48TI8kmKcHWcqQ2k", alignment: Alignment.centerLeft);
Tile tile_topright = new Tile(
    imageURL: "https://i.picsum.photos/id/785/512/1024.jpg?hmac=Vr6gXYYAYlToUd6980VUZLTMQMr48TI8kmKcHWcqQ2k", alignment: Alignment.topRight);
Tile tile_centerright = new Tile(
    imageURL: "https://i.picsum.photos/id/785/512/1024.jpg?hmac=Vr6gXYYAYlToUd6980VUZLTMQMr48TI8kmKcHWcqQ2k", alignment: Alignment.centerRight);
Tile tile_bottomright = new Tile(
    imageURL: "https://i.picsum.photos/id/785/512/1024.jpg?hmac=Vr6gXYYAYlToUd6980VUZLTMQMr48TI8kmKcHWcqQ2k", alignment: Alignment.bottomRight);
Tile tile_bottomleft = new Tile(
    imageURL: "https://i.picsum.photos/id/785/512/1024.jpg?hmac=Vr6gXYYAYlToUd6980VUZLTMQMr48TI8kmKcHWcqQ2k", alignment: Alignment.bottomLeft);
Tile tile_center = new Tile(
    imageURL: "https://i.picsum.photos/id/785/512/1024.jpg?hmac=Vr6gXYYAYlToUd6980VUZLTMQMr48TI8kmKcHWcqQ2k", alignment: Alignment.center);
Tile tile_topcenter = new Tile(
    imageURL: "https://i.picsum.photos/id/785/512/1024.jpg?hmac=Vr6gXYYAYlToUd6980VUZLTMQMr48TI8kmKcHWcqQ2k", alignment: Alignment.topCenter);
Tile tile_bottomcenter = new Tile(
    imageURL: "https://i.picsum.photos/id/785/512/1024.jpg?hmac=Vr6gXYYAYlToUd6980VUZLTMQMr48TI8kmKcHWcqQ2k", alignment: Alignment.bottomCenter);
int numberoftilesonwidth = 3;

class GridViewsimpleb extends State<Ex5b> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ex5 lets goooooo'),
        centerTitle: true,
      ),
      body: GridView.count(
  primary: false,
  padding: EdgeInsets.all(1),
  crossAxisCount: numberoftilesonwidth,
  crossAxisSpacing: 1,
  mainAxisSpacing: 1,
  children: <Widget>[
    Container(
      child:  this.createTileWidgetFrom(tile) ,
      color: Colors.teal[100],
    ),
    Container(
      
      child: this.createTileWidgetFrom(tile_topcenter) ,
      color: Colors.teal[100],
    ),
    Container(
      child: this.createTileWidgetFrom(tile_topright) ,
      color: Colors.teal[200],
    ),
    Container(
      child: this.createTileWidgetFrom(tile_centerleft) ,
      color: Colors.teal[300],
    ),
    Container(   
      child: this.createTileWidgetFrom(tile_center) ,
      color: Colors.teal[300],
    ),
    Container(
      child: this.createTileWidgetFrom(tile_centerright) ,
      color: Colors.teal[400],
    ),
    Container(
      child: this.createTileWidgetFrom(tile_bottomright),
      color: Colors.teal[500],
    ),
    Container(
      child: this.createTileWidgetFrom(tile_bottomcenter),
      color: Colors.teal[500],
    ),
    Container(
      child: this.createTileWidgetFrom(tile_bottomleft),
      color: Colors.teal[600],
    ),
  ],
),
    );
  }

  


Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(),
      onTap: () {
        print("tapped on tile");
      },
    );
  }
}