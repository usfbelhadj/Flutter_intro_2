// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:breaking_bad/models.dart';
import 'package:flutter/material.dart';
import 'character_title.dart';

class Wrapper extends StatelessWidget {
  final List<Character> data;
  const Wrapper({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1),
      itemCount: data.length,
      itemBuilder: (BuildContext ctx, index) {
        return CharacterTile(character: data[index]);
      },
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      reverse: false,
    );
  }
}
