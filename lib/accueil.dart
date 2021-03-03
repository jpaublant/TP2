import 'package:flutter/material.dart';
import 'dart:math';
import 'main.dart';
import 'exo-1.dart';
import 'exo-4.dart';
import 'exo-5.dart';
import 'exo-5b.dart';
import 'exo-5c.dart';
import 'exo-6.dart';
import 'exo_taquin.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }}
  
class _HomeState extends State<HomePage> {
  final _biggerFont = TextStyle(fontSize: 18.0);

  Widget _buildList() {

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: Exercices.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          child: Center(child: _buildRow(Exercices[index])),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget _buildRow(String exercice) {
    return ListTile(
      title: Text(
        exercice,
        style: _biggerFont,
      ),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) {
              switch (exercice) {
            case 'Exercice 1':
              return Ex1();
            case 'Exercice 4':
              return Ex4();
             case 'Exercice 5a':
              return Ex5();
           case 'Exercice 5b':
              return Ex5b();
            case 'Exercice 5c':
              return Ex5c();
           case 'Exercice 6':
              return Ex6();
            case 'Jeu Taquin':
              return Taquin(); 
            default:
              return HomePage();
              break;
          }
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page d'accueil"),
      ),
      body: _buildList(),
    );
  }
}

