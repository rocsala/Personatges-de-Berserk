// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, prefer_const_constructors

import 'package:we_rate_berserk/berserk_model.dart';
import 'package:flutter/material.dart';

class AddBerserkFormPage extends StatefulWidget {
  @override
  _AddBerserkFormPageState createState() => new _AddBerserkFormPageState();
}

class _AddBerserkFormPageState extends State<AddBerserkFormPage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController raceController = new TextEditingController();
  TextEditingController descController = new TextEditingController();

  void submitPup(BuildContext context) {
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        backgroundColor: Colors.redAccent,
        content: new Text('S´ha de registrar un nom!'),
      ));
    } else {
      var newCharacter = new BerserkCharacter(
          nameController.text,
          "https://thumbs.dreamstime.com/b/icono-del-vector-de-la-persona-en-nuevo-estilo-plano-usuario-s%C3%ADmbolo-humano-con-sombra-larga-ejemplo-internet-horas-servicio-141808591.jpg",
          raceController.text,
          descController.text);
      Navigator.of(context).pop(newCharacter);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Afegeix un nou personatge',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Skranji',
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFCC0000),
      ),
      body: new Container(
        color: Color(0xFFFF6347),
        child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: new Column(children: [
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: nameController,
                cursorColor: Color(0xFFCC0000),
                style: TextStyle(
                    decoration: TextDecoration.none, color: Colors.black),
                //onChanged: (v) => nameController.text = v,
                decoration: new InputDecoration(
                  labelText: 'Nom:',
                  labelStyle:
                      TextStyle(fontFamily: 'Skranji', color: Colors.black),
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: raceController,
                cursorColor: Color(0xFFCC0000),
                style: TextStyle(
                    decoration: TextDecoration.none, color: Colors.black),
                //onChanged: (v) => nameController.text = v,
                decoration: new InputDecoration(
                  labelText: 'Raça:',
                  labelStyle:
                      TextStyle(fontFamily: 'Skranji', color: Colors.black),
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: descController,
                cursorColor: Color(0xFFCC0000),
                style: TextStyle(
                    decoration: TextDecoration.none, color: Colors.black),
                //onChanged: (v) => nameController.text = v,
                decoration: new InputDecoration(
                  labelText: 'Descripció:',
                  labelStyle:
                      TextStyle(fontFamily: 'Skranji', color: Colors.black),
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Builder(
                builder: (context) {
                  return new ElevatedButton(
                    onPressed: () => submitPup(context),
                    child: new Text('Enviar'),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFFCC0000),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        textStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Skranji',
                            fontWeight: FontWeight.bold)),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
