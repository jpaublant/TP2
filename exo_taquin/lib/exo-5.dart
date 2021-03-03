import 'package:flutter/material.dart';
import 'dart:math';
import 'main.dart';
import 'accueil.dart';


class Ex5 extends StatefulWidget {

  const Ex5({ Key key }) : super(key: key);
  @override
  GridViewsimple createState() {
    return GridViewsimple();
  }
}



class GridViewsimple extends State<Ex5> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 2,
  children: <Widget>[
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text("Title 1"),
      color: Colors.teal[100],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Title 2'),
      color: Colors.teal[200],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Title 3'),
      color: Colors.teal[300],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Title 4'),
      color: Colors.teal[400],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Title 5'),
      color: Colors.teal[500],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Title 6'),
      color: Colors.teal[600],
    ),
  ],
);
  }

  
}