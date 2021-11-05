// ignore_for_file: unnecessary_new, avoid_print, unnecessary_null_comparison

import 'dart:convert';
import 'dart:io';
import 'dart:async';

class BerserkCharacter {
  final String name;
  String? imageUrl = "";
  String apiname = "";
  String race;
  String description;

  int rating = 10;

  BerserkCharacter(this.name, this.imageUrl, this.race, this.description);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = new HttpClient();
    try {
      apiname = name.toLowerCase();
      var uri =
          new Uri.https('digimon-api.vercel.app', '/api/digimon/name/$apiname');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();

      List data = json.decode(responseBody);
      imageUrl = data[0]["img"];
      race = data[0]["race"];

      print(race);
    } catch (exception) {
      print(exception);
    }
  }
}
