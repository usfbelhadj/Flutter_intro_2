import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

Widget mainWidget = MediaQuery(
    data: const MediaQueryData(),
    child: MaterialApp(
        title: 'Breaking Bad',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: const HomeScreen(
          key: Key('home'),
        )));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (mainWidget);
  }
}
