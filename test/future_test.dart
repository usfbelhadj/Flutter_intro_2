// ignore_for_file: non_constant_identifier_names

import 'package:breaking_bad/models.dart';
import 'package:breaking_bad/util.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'future_test.mocks.dart';
import 'checker.dart';

@GenerateMocks([http.Client])
void main() async{

  List<Character> data = await api_loader();
  // ignore: avoid_print
  print(data);
  group('fetchAlbum', () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client
              .get(Uri.parse('https://www.breakingbadapi.com/api/characters')))
          .thenAnswer((_) async => http.Response('${simulator()}', 304));

      expect(await fetchBbCharacters(client), isA<List<Character>>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client
              .get(Uri.parse('https://www.breakingbadapi.com/api/characters')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchBbCharacters(client), throwsException);
    });
  });
}
