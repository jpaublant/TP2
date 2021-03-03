import 'package:flutter/material.dart';

import 'accueil.dart';
import 'exo-1.dart';
import 'exo-4.dart';
class exo{
  final String titre;


  exo(this.titre);
}
List<String> Exercices = [
  "Exercice 1",
  "Exercice 2",
  "Exercice 4",
  "Exercice 5a",
  "Exercice 5b",
  "Exercice 5c",
  "Exercice 6",
  "Jeu Taquin",
  "Test"
];
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:HomePage(),
    );
  }
}
/*
class MyHomePage extends StatefulWidget {

  const MyHomePage({ Key key }) : super(key: key);
  @override
  Exo1 createState() {
    return Exo1();
  }
}


class MyHomePageState extends StatelessWidget {

 final List<exo> todos;
  MyHomePageState({Key key, this.todos}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercices"),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context,index) {
          return ListTile(
            title: Text(todos[index].titre),
            onTap: () {  
              
              Navigator.push(context,MaterialPageRoute (builder: (BuildContext context) => ontaps[index]),
              );
              },
          );
        },
      ),



    );
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
class Ex1 extends StatefulWidget {

  const Ex1({ Key key }) : super(key: key);
  @override
  Exo1 createState() {
    return Exo1();
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
}*/
 