import 'package:flutter/material.dart';
import 'dart:math';
import 'main.dart';
import 'accueil.dart';

class Ex4 extends StatefulWidget {

  const Ex4({ Key key }) : super(key: key);
  @override
  DisplayTileWidget createState() {
    return DisplayTileWidget();
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
    imageURL: "https://i.picsum.photos/id/785/512/1024.jpg?hmac=Vr6gXYYAYlToUd6980VUZLTMQMr48TI8kmKcHWcqQ2k", alignment: Alignment(0, 0));



class DisplayTileWidget extends State<Ex4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display a Tile as a Cropped Image'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: [
        Container(
          child: SizedBox(
            width: 150.0,
            height: 150.0,
            child: Container(
                margin: EdgeInsets.all(20.0),
                child: this.createTileWidgetFrom(tile))),),
        Container(
            height: 200,
            child: Image.network('https://i.picsum.photos/id/785/512/1024.jpg?hmac=Vr6gXYYAYlToUd6980VUZLTMQMr48TI8kmKcHWcqQ2k',
                fit: BoxFit.cover))
      ])),
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