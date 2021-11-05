// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_types_as_parameter_names, unnecessary_new, duplicate_ignore

import 'package:we_rate_berserk/berserk_card.dart';
import 'package:flutter/material.dart';
import 'berserk_model.dart';

class BerserkList extends StatelessWidget {
  final List<BerserkCharacter> characters;
  BerserkList(this.characters);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    // ignore: unnecessary_new
    return new ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, int) {
        return new BerserkCard(characters[int]);
      },
    );
  }
}
