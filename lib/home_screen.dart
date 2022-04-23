import 'package:breaking_bad/wrapper.dart';
import 'package:flutter/material.dart';
import 'models.dart';
import 'util.dart';
import 'package:http/http.dart' as htttp;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late Future<List<Character>> listCharacter;
  // ignore: unused_field
  bool didInitState = false;

  @override
  void initState() {
    super.initState();
    didInitState = true;
    // initial load
    listCharacter = fetchBbCharacters(htttp.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Breaking Bad Quotes")),
        body: FutureBuilder(
          future: listCharacter,
          builder:
              (BuildContext context, AsyncSnapshot<List<Character>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData) {
              return (Center(
                child: Text('Error: ${snapshot.error}'),
              ));
            } else {
              final items = snapshot.data ?? <Character>[];
              return (Wrapper(
                data: items,
              ));
            }
          },
        ));
  }
}
