import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PositionedTiles(),
    );
  }
}

//
// Lista de quadros a exibir
//
List<Widget> tiles = [
  Padding(
    // Place the keys at the *top* of the tree
    key: UniqueKey(),
    padding: const EdgeInsets.all(8.0),
    child: ColorTile(),
  ),
  Padding(
    key: UniqueKey(),
    padding: const EdgeInsets.all(8.0),
    child: ColorTile(),
  ),
];

//
// Classe para a tela principal
//
class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

//
// Clase para gerenciar o estado da tela principal
//
class PositionedTilesState extends State<PositionedTiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: tiles),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.sentiment_very_satisfied),
        onPressed: swapTiles,
      ),
    );
  }

  // Funcao para trocar a ordem dos quadros
  swapTiles() {
    print("Trocando os quadros");
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

//
// Classe para gerar uma cor aleatoria
//
class UniqueColorGenerator {
  static Random random = Random();
  static Color getColor() {
    return Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}

//
// Classe para quadros a exibir
//
class ColorTile extends StatefulWidget {
  ColorTile({Key key}) : super(key: key);  // NEW CONSTRUCTOR

  @override
  ColorTileState createState() => ColorTileState();
}

//
// Classe para gerencia o estado do quadro a exibir
//
class ColorTileState extends State<ColorTile> {
  Color myColor;

  @override
  void initState() {
    super.initState();
    myColor = UniqueColorGenerator.getColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColor,
      child: Padding(
        padding: EdgeInsets.all(70.0),
      )
    );
  }
}
