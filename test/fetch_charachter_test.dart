import 'dart:convert';
import 'package:breaking_bad/util.dart';
import 'package:http/http.dart' as http;
import 'package:breaking_bad/models.dart';
import 'package:test/test.dart';

Future<List<Character>> fecthsolution() async {
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

void main() {
  test("Test : fetch characters ", () async {
    var sol = await fecthsolution();
    var user = await fetchBbCharacters();

    expect(sol.length, user.length);
  });
}
