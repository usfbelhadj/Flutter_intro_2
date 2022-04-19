// ignore_for_file: avoid_print

import 'package:breaking_bad/character_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import 'models.dart';
import 'quotes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<List<Character>> fetchBbCharacters() async {
    List<Character> characList = [];
    final response = await http.get(
      Uri.parse('https://www.breakingbadapi.com/api/characters'),
    );
    var resJson = jsonDecode(response.body);
    for (var i = 0; i < resJson.length; i++) {
      final char = Character.fromJson(resJson[i]);
      characList.add(char);
    }
    return characList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Breaking Bad"),
      ),
      body: FutureBuilder(
        future: fetchBbCharacters(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const SizedBox(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            default:
              if (snapshot.hasError) {
                print(snapshot);
                return Text('Error: ${snapshot.error}');
              } else {
                print(snapshot.data);
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return CharacterTile(character: snapshot.data[index]);
                  },
                  padding: const EdgeInsets.all(10),
                  shrinkWrap: true,
                  reverse: false,
                );
              }
          }
        },
      ),
    );
  }
}
