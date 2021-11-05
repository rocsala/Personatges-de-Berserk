// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_inlined_adds, unnecessary_null_comparison, unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:async';
import 'berserk_model.dart';
import 'berserk_list.dart';
import 'new_berserk_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personatges de Berserk',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(
        title: 'Personatges de Berserk',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<BerserkCharacter> initialCharacters = []
    ..add(BerserkCharacter(
        'Guts',
        "https://www.gamespot.com/a/uploads/scale_landscape/1562/15626911/3736232-berserk.jpeg",
        "Humà",
        "Guts, conegut com l'Espadachín Negre, és un antic mercenari i vagabund de marca que recorre el món en una lluita interna constant entre perseguir els seus propis fins i mantenir els seus vincles amb aquells que li són estimats. En un moment impulsat únicament per la seva voluntat de sobreviure, Guts troba un propòsit a la vida en unir-se a la Banda del Falcó, ajudant enormement als èxits històrics de la facció durant la Guerra dels Cent Anys com a capità dels assaltants de la banda. Finalment, queda insatisfet d'aferrar-se al somni de Griffith i marxa de la banda a la recerca del seu. Després dels horrors de l'Eclipsi provocats per Griffith, Guts s'embarca en una guerra de dos anys contra la Mà de Déu i els apòstols, sent cada cop més amargat per la seva recerca de retribució. Amb el temps s'adona que protegir el seu amant en regressió és més important per a ell, així com una cosa que no pot fer sol i així deixa de banda la seva recerca de venjança alhora que fomenta la companynia amb nous companys."))
    ..add(BerserkCharacter(
        'Casca',
        "https://pbs.twimg.com/media/EdE5R84XgA0LFC0.png",
        "Humà",
        "Casca és un antic comandant d'unitat de la Banda del Falcó i un company allunyat de Guts. Originalment era una camperola insensible que vivia en un poble de muntanya remot, es converteix en una guerrera ben adaptada en unir-se a la Banda del Falcó i ajuda molt en els èxits històrics del grup durant la Guerra dels Cent Anys. Després de la marxa de Guts i l'empresonament posterior de Griffith, es veu obligada a assumir el càrrec de líder de la banda, aconseguint evitar l'aniquilació completa de la Banda del Falcó i rescatar a Griffith de la Torre del Renaixement."))
    ..add(BerserkCharacter(
        'Griffith',
        "https://i2.wp.com/multiversitystatic.s3.amazonaws.com/uploads/2020/08/Berserk-Finale-Featured.png?fit=1043%2C724",
        "Membre de la Mà de Déu",
        "Griffith va ser líder de la Banda del Falcó i comandant suprem de l'Exèrcit Regular de Midland. Com el Falcó de la Llum, ha estat al capdavant de moltes batalles, havent acumulat una reputació de salvador a tot el continent. Després de la deserció del seu confident de més confiança, Guts, Griffith acull la princesa Charlotte per impuls, provocant el seu empresonament, la tortura d'un any i l'aparent desaparició del seu somni. Tot i que finalment és rescatat per la banda, el seu estat d'extrema invalidesa i el desig etern d'obtenir el seu propi regne l'obliga a sacrificar els seus companys durant el cinquè eclipsi, per la seva parentiu amb la Mà de Déu com el seu cinquè membre Femto, una versió demoníaca i idealitzada d'ell mateix."))
    ..add(BerserkCharacter(
        'Puck',
        "https://static.wikia.nocookie.net/berserk/images/6/66/Puck_sorprendido_%28anime_2016%29.png/revision/latest/scale-to-width-down/250?cb=20171229021729&path-prefix=es",
        "Elf",
        "És el primer dels companys que Guts fa durant els dies d'aquest últim com a Espadachín Negre. Puck és un elf de la raça Pisky, descendent dels antics esperits del vent. Un antic habitant d'Elfhelm, l'idíl·lic regne elf del monarca de la tempesta de flors, va marxar per pur avorriment i es va convertir en el primer company nou trobat de Guts des d'aleshores."))
    ..add(BerserkCharacter(
      'Skull Knight',
      'https://pbs.twimg.com/media/EfQJ4OQXgAENVLF.jpg',
      'Inmortal',
      'És una figura enigmàtica i un autoproclamat enemic dels inhumans, que ha fet la guerra contra els dimonis durant un mil·lenni. Té uns 1000 anys d´antiguitat i té un ampli coneixement dels esdeveniments que envolten el món, així com una notable previsió pel que fa al flux de la causalitat. És qui irromp en el cinquè Eclipsi i salva a Guts i Casca de la seva mort. Més tard ressorgeix durant la invasió Kushan de Midland sobre la Ganishka reencarnada dues vegades en un aparent intent d´assassinar Femto i amb la seva Espasa de Beherits crea una fissura astral utilitzada per l´àngel per desencadenar el Gran Brugit del Món Astral.',
    ));

  Future _showNewBerserkForm() async {
    BerserkCharacter newBerserkCharacter = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddBerserkFormPage();
    }));
    //print(newCharacter);
    if (newBerserkCharacter != null) {
      initialCharacters.add(newBerserkCharacter);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: new Text(widget.title,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Skranji',
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color(0xFFCC0000),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewBerserkForm,
          ),
        ],
      ),
      body: new Container(
          color: Color(0xFFFF6347),
          child: new Center(
            child: new BerserkList(initialCharacters),
          )),
    );
  }
}
