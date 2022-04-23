// ignore_for_file: non_constant_identifier_names, unused_local_variable, invalid_use_of_protected_member, prefer_const_constructors, avoid_print

import 'package:breaking_bad/home_screen.dart';
import 'package:breaking_bad/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:breaking_bad/models.dart';
import 'package:mockito/annotations.dart';

Widget testWidget = const MediaQuery(
    data: MediaQueryData(),
    child: MaterialApp(
        home: HomeScreen(
      key: Key('home'),
    )));
@GenerateMocks([HomeScreen])
void main() {
  testWidgets('MyWidget has a Appbar and scafold', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.

    await tester.pumpWidget(testWidget);
    // find.byType(SliverList);
    // print(find.byType(SliverList).runtimeType);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets(
    'Testing Scafold Text',
    (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      final child =
          find.descendant(of: find.byType(AppBar), matching: find.byType(Text));
      expect(child, findsOneWidget);
      for (final i in child.allCandidates) {
        expect(find.text("Breaking Bad Quotes"), findsOneWidget);
      }
    },
  );

  testWidgets('Testing Build', (WidgetTester tester) async {
    await tester.pumpWidget(testWidget);

    final child =
        find.byType(FutureBuilder<List<Character>>, skipOffstage: true);
    expect(child, findsOneWidget);
    final Finder Builde = find.byType(Builder);
    // for(var el in Builde.allCandidates){
    //   print(el.widget.toString());
    //   print("\n");

    // }
    tester.pump(Duration(seconds: 2));
    final d = find.byType(Builder);
    for (var el in d.allCandidates) {
      print(el.widget.toString());
      print("\n");
    }
  });

  testWidgets('resync stateful widget', (WidgetTester tester) async {
    const Key innerKey = Key('home');
    const HomeScreen testWidget = HomeScreen(key: innerKey);
    await tester.pumpWidget(mainWidget);
    final StatefulElement innerElement = tester.element(find.byKey(innerKey));
    expect(innerKey, innerElement.widget.key);
    expect(innerElement.widget.toString(), "HomeScreen-[<'home'>]");

    final HomeScreenState innerElementState =
        innerElement.state as HomeScreenState;
    // expect(innerElementState.widget, equals(test_widget)); # need to fix
    expect(innerElementState.didInitState, isTrue);
    // print(await innerElementState.listCharacter);

    // print(el.runtimeType);
    expect(innerElement.renderObject!.attached, isTrue);
    // expect(find.byType(Wrapper), findsOneWidget);
  });

  testWidgets('loop through widget widget', (WidgetTester tester) async {
    await tester.pumpWidget(mainWidget);

    var data = find.byType(AppBar);
    for (var el in data.allCandidates) {
      print(el.renderObject);
    }
  });
}
