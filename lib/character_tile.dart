import 'package:breaking_bad/quotes_screen.dart';
import 'package:flutter/material.dart';
import 'models.dart';

class CharacterTile extends StatelessWidget {
  final Character character;
  const CharacterTile({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          const ValueKey("testing");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      QuotesScreen(id: character.id, name: character.name)));
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(character.img),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              character.name,
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ));
  }
}
