// ignore_for_file: avoid_print

import 'package:breaking_bad/models.dart';
import 'package:breaking_bad/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// @GenerateMocks([Wrapper])
void main() async {
  testWidgets("first check", (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    // expect(Wrapper(data: [Character("name", "https://m.media-amazon.com/images/M/MV5BMTkwMTkxNjUzM15BMl5BanBnXkFtZTgwMTg5MTczMTE@._V1_UY317_CR175,0,214,317_AL_.jpg", 1)]), isA<Wrapper>());
    final data = Wrapper(data: [
      Character(
          "name",
          "https://m.media-amazon.com/images/M/MV5BMTkwMTkxNjUzM15BMl5BanBnXkFtZTgwMTg5MTczMTE@._V1_UY317_CR175,0,214,317_AL_.jpg",
          1)
    ]);
    print(data.data.first.name);
    await tester.pumpWidget(MaterialApp(
      home: data,
    ));
    expect(find.byElementType(GridView), findsOneWidget);
    final StatelessElement innerElement = tester.element(find.byType(Wrapper));
    print(innerElement.debugDescribeChildren()[0].toString());
  });
  testWidgets("test builder", (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    // expect(Wrapper(data: [Character("name", "https://m.media-amazon.com/images/M/MV5BMTkwMTkxNjUzM15BMl5BanBnXkFtZTgwMTg5MTczMTE@._V1_UY317_CR175,0,214,317_AL_.jpg", 1)]), isA<Wrapper>());
    final data = Wrapper(data: [
      Character(
          "name",
          "https://m.media-amazon.com/images/M/MV5BMTkwMTkxNjUzM15BMl5BanBnXkFtZTgwMTg5MTczMTE@._V1_UY317_CR175,0,214,317_AL_.jpg",
          1)
    ]);
    print(data.data.first.name);
    await tester.pumpWidget(MaterialApp(
      home: data,
    ));
    expect(find.byElementType(GridView), findsOneWidget);
    final StatelessElement innerElement = tester.element(find.byType(Wrapper));
    print(innerElement.debugDescribeChildren()[0].toString());
  });
}
