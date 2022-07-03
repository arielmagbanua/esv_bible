import 'package:esv_bible/data/data_sources/passage_search.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

const samplePassageSearch = '''
{
    "page": 1,
    "total_results": 3,
    "results": [
        {
            "reference": "Numbers 11:4",
            "content": "Now the rabble that was among them had a strong craving. And the people of Israel also wept again and said, \\u201cOh that we had meat to eat!"
        },
        {
            "reference": "Job 30:12",
            "content": "On my right hand the rabble rise; they push away my feet; they cast up against me their ways of destruction."
        },
        {
            "reference": "Acts 17:5",
            "content": "But the Jews were jealous, and taking some wicked men of the rabble, they formed a mob, set the city in an uproar, and attacked the house of Jason, seeking to bring them out to the crowd."
        }
    ],
    "total_pages": 1
}
''';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

void main() {
  late MockHttpClient mockedHttpClient;

  setUp(() {
    mockedHttpClient = MockHttpClient();
  });

  test('Test passage search', () async {
    const query = 'rabble';

    final correctUri = Uri.parse(
      'https://api.esv.org/v3/passage/search?q=$query',
    );

    final response = MockResponse();

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token TEST'
    };

    when(() => response.statusCode).thenReturn(200);
    when(() => response.body).thenReturn(samplePassageSearch);
    when(() => mockedHttpClient.get(correctUri, headers: headers)).thenAnswer(
      (_) => Future<http.Response>.value(response),
    );

    final passageSearch = PassageSearch(
      httpClient: mockedHttpClient,
      apiKey: 'TEST',
    );

    final passageData = await passageSearch(query);

    final results = passageData!['results'];

    expect(passageData['page'], 1);
    expect(passageData['total_results'], 3);
    expect(passageData['total_pages'], 1);
    expect(results[0]['reference'], 'Numbers 11:4');
    expect(
      results[0]['content'],
      'Now the rabble that was among them had a strong craving. And the people of Israel also wept again and said, \u201cOh that we had meat to eat!',
    );
  });
}
