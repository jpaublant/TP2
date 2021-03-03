import 'package:flutter/material.dart';
import 'dart:math';
import 'main.dart';
import 'accueil.dart';


class Ex1 extends StatefulWidget {

  const Ex1({ Key key }) : super(key: key);
  @override
  Exo1 createState() {
    return Exo1();
  }
}
class image_bv extends StatelessWidget {
   
  @override
  Widget build(BuildContext context){
    return Container( 
    width: 512,
    height: 512,
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
    image: DecorationImage(
      //fit: BoxFit.fill,
      image: NetworkImage("https://i.picsum.photos/id/588/512/512.jpg?hmac=rzE0eN3oaIhmIXnM3OdrUFw-cwSR3WlEN6dzZnzegsI"),
    ),
  ),
);

  }
}
class Exo1 extends State<Ex1> {
  double _currentSliderValue = 0;
   double _currentSliderValue2 = 0;
  @override
  Widget build(BuildContext context){
    
    return Scaffold(
      appBar:AppBar(
        title: Text('Exercice 1')
      ),

        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Transform(
    //alignment: Alignment.topRight,
    transform: Matrix4.skew(_currentSliderValue,_currentSliderValue2),
    child: image_bv(),
    ),
    Text('RotateX'),
      Expanded(
             child: Slider(
      value: _currentSliderValue,
      min: 0,
      max: 100,
      divisions: 20,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
          
        });
         
       

      },
    ),),
    Text('RotateZ'),
    Expanded(
             child: Slider(
      value: _currentSliderValue2,
      min: 0,
      max: 100,
      divisions: 20,
      label: _currentSliderValue2.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue2 = value;
        });
      },
    ),),
          ],
        ),
      ),
    
    );  
  }
}