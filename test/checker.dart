// ignore_for_file: file_names

import 'package:breaking_bad/models.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

// ignore: non_constant_identifier_names
Future<List<Character>> api_loader() async {
  List<Character> characList = [];

  final response = await http.get(
    Uri.parse('https://www.breakingbadapi.com/api/characters'),
  );
  var resJson = jsonDecode(response.body);
  for (var i = 0; i < resJson.length; i++) {
    final char = Character.fromJson(resJson[i]);
    characList.add(char);
  }

  return (characList);
}
Future<List<Character>> simulator() async {
  return [];
}
