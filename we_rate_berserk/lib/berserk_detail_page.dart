// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_new, prefer_const_constructors, prefer_void_to_null, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, unnecessary_const, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:we_rate_berserk/main.dart';
import 'berserk_model.dart';
import 'dart:async';

class BerserkDetailPage extends StatefulWidget {
  final BerserkCharacter berserk;
  BerserkDetailPage(this.berserk);

  @override
  _BerserkDetailPageState createState() => new _BerserkDetailPageState();
}

class _BerserkDetailPageState extends State<BerserkDetailPage> {
  final double berserkAvarterSize = 150.0;
  double _sliderValue = 10.0;

  Widget get addYourRating {
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Flexible(
                flex: 1,
                child: new Slider(
                  activeColor: Color(0xFFCC0000),
                  min: 0.0,
                  max: 10.0,
                  value: _sliderValue,
                  onChanged: (newRating) {
                    setState(() {
                      _sliderValue = newRating;
                    });
                  },
                ),
              ),
              new Container(
                  width: 50.0,
                  alignment: Alignment.center,
                  child: new Text(
                    '${_sliderValue.toInt()}',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Skranji',
                        fontSize: 25.0),
                  )),
            ],
          ),
        ),
        submitRatingButton,
      ],
    );
  }

  void updateRating() {
    if (_sliderValue < 3) {
      _ratingErrorDialog();
    } else {
      setState(() {
        widget.berserk.rating = _sliderValue.toInt();
      });
    }
  }

  Future<Null> _ratingErrorDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('De debò penses que és molt dolent?!'),
            content: new Text("Va vinga! És molt guai!"),
            actions: <Widget>[
              new TextButton(
                child: new Text('Torna'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  Widget get submitRatingButton {
    return new ElevatedButton(
      onPressed: () => updateRating(),
      child: new Text('Enviar'),
      style: ElevatedButton.styleFrom(
          primary: Color(0xFFCC0000),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          textStyle: TextStyle(
              fontSize: 12,
              fontFamily: 'Skranji',
              fontWeight: FontWeight.bold)),
    );
  }

  Widget get berserkImage {
    return new Hero(
      tag: widget.berserk,
      child: new Container(
        height: berserkAvarterSize,
        width: berserkAvarterSize,
        constraints: new BoxConstraints(),
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              // ignore: unnecessary_const
              const BoxShadow(
                  offset: const Offset(1.0, 2.0),
                  blurRadius: 2.0,
                  spreadRadius: -1.0,
                  color: const Color(0x33000000)),
              // ignore: unnecessary_const
              const BoxShadow(
                  offset: const Offset(2.0, 1.0),
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                  color: const Color(0x24000000)),
              // ignore: unnecessary_const
              const BoxShadow(
                  offset: const Offset(3.0, 1.0),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                  color: const Color(0x1f000000))
            ],
            image: new DecorationImage(
                fit: BoxFit.cover,
                image: new NetworkImage(widget.berserk.imageUrl ?? ''))),
      ),
    );
  }

  Widget get rating {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
          Icons.star,
          size: 40.0,
          color: Colors.black,
        ),
        new Text('${widget.berserk.rating}/10',
            style: TextStyle(
                color: Colors.black, fontFamily: 'Skranji', fontSize: 30.0))
      ],
    );
  }

  Widget get berserkProfile {
    return new Container(
      padding: new EdgeInsets.symmetric(vertical: 32.0),
      margin: new EdgeInsets.symmetric(horizontal: 10.0),
      decoration: new BoxDecoration(
        color: Color(0xFFFF6347),
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          berserkImage,
          new Text('${widget.berserk.name}',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Skranji', fontSize: 32.0)),
          new Text('${widget.berserk.race}',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Skranji', fontSize: 20.0)),
          new Text(
            '${widget.berserk.description}',
            style: TextStyle(
                color: Colors.black, fontFamily: 'Skranji', fontSize: 13.0),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 5.0),
            child: rating,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFFF6347),
      appBar: new AppBar(
        //automaticallyImplyLeading: true,
        backgroundColor: Color(0xFFCC0000),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop(main);
              },
            );
          },
        ),
      ),
      body: new ListView(
        children: <Widget>[berserkProfile, addYourRating],
      ),
    );
  }
}
