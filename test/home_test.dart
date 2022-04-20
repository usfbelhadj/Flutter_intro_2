import 'package:breaking_bad/home_screen.dart';
import 'package:breaking_bad/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:breaking_bad/util.dart';
import 'package:breaking_bad/models.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  testWidgets('MyWidget has a Appbar and scafold', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    Widget testWidget = new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(home: new HomeScreen()));
    await tester.pumpWidget(testWidget);
    // find.byType(SliverList);
    // print(find.byType(SliverList).runtimeType);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets(
    'Testing Scafold Text',
    (WidgetTester tester) async {
      Widget testWidget = new MediaQuery(
          data: new MediaQueryData(),
          child: new MaterialApp(home: new HomeScreen()));

      await tester.pumpWidget(testWidget);
      final child =
          find.descendant(of: find.byType(AppBar), matching: find.byType(Text));
      expect(child, findsOneWidget);
      for (final i in child.allCandidates) {
        expect(find.text("Breaking Bad"), findsOneWidget);
      }
    },
  );

  testWidgets(
    'Testing Build',
    (WidgetTester tester) async {
      
      Widget testWidget = new MediaQuery(
          data: new MediaQueryData(),
          child: new MaterialApp(home: new HomeScreen()));
      await tester.pumpWidget(testWidget);
    
       final child = find.byType(FutureBuilder<List<Character>>, skipOffstage: false);
       expect(child, findsOneWidget);
      
       print(child.first);

      //  print(child);
      // find.descendant(
      //     of: ), matching: find.byType(Builder));

      // expect(child, findsOneWidget);
      // for (final i in child.allCandidates) {
      //   print(i);
      }
    // },
  );
}
