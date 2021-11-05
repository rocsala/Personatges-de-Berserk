// ignore_for_file: prefer_const_constructors, no_logic_in_create_state, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, annotate_overrides, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:we_rate_berserk/berserk_model.dart';
import 'berserk_detail_page.dart';
import 'package:flutter/material.dart';

class BerserkCard extends StatefulWidget {
  final BerserkCharacter berserk;

  BerserkCard(this.berserk);

  @override
  _BerserkCardState createState() => _BerserkCardState(berserk);
}

class _BerserkCardState extends State<BerserkCard> {
  BerserkCharacter berserk;
  String? renderUrl = "";

  _BerserkCardState(this.berserk);

  VoidCallback? manualUpdateCard() {
    setState(() {});
  }

  void initState() {
    super.initState();
    renderBerserkPic();
  }

  Widget get berserkImage {
    var berserkAvatar = Hero(
      tag: berserk,
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(renderUrl ?? ''))),
      ),
    );

    var placeholder = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black54, Colors.black, Colors.red])),
      alignment: Alignment.center,
      child: Text(
        'BERSERK',
        textAlign: TextAlign.center,
      ),
    );

    var crossFade = AnimatedCrossFade(
      firstChild: placeholder,
      secondChild: berserkAvatar,
      crossFadeState: renderUrl == null
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 1000),
    );

    return crossFade;
  }

  void renderBerserkPic() async {
    await berserk.getImageUrl();
    if (mounted) {
      setState(() {
        renderUrl = berserk.imageUrl;
      });
    }
  }

  Widget get berserkCard {
    return new Positioned(
      right: 0.0,
      child: new Container(
        width: 290,
        height: 150,
        child: new Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: Color(0xFFE9967A),
          child: new Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 64),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Row(children: <Widget>[
                  new Text(
                    widget.berserk.name,
                    style: TextStyle(
                        color: Color(0xFF000600),
                        fontFamily: 'Skranji',
                        fontSize: 27.0),
                  ),
                ]),
                new Row(
                  children: <Widget>[
                    new Icon(Icons.star, color: Color(0xFF000600)),
                    new Text(': ${widget.berserk.rating}/10',
                        style: TextStyle(
                            color: Color(0xFF000600),
                            fontFamily: 'Skranji',
                            fontSize: 14.0)),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFCC0000),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            textStyle: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Skranji',
                                fontWeight: FontWeight.bold)),
                        onPressed: () => manualUpdateCard(),
                        child: new Text('Actualitza')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showBerserkDetailPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return BerserkDetailPage(berserk);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showBerserkDetailPage(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        child: Container(
          height: 165.0,
          child: Stack(
            children: <Widget>[
              berserkCard,
              Positioned(top: 7.5, child: berserkImage),
            ],
          ),
        ),
      ),
    );
  }
}
