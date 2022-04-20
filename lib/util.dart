import 'models.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
