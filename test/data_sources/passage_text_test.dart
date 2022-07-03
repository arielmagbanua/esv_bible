import 'package:esv_bible/data/data_sources/passage_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

const samplePassageText = '''
{
  "query": "John 11:35",
  "canonical": "John 11:35",
  "parsed": [
    [
      43011035,
      43011035
    ]
  ],
  "passage_meta": [
    {
      "canonical": "John 11:35",
      "chapter_start": [
        43011001,
        43011057
      ],
      "chapter_end": [
        43011001,
        43011057
      ],
      "prev_verse": 43011034,
      "next_verse": 43011036,
      "prev_chapter": [
        43010001,
        43010042
      ],
      "next_chapter": [
        43012001,
        43012050
      ]
    }
  ],
  "passages": [
    "John 11:35\\n\\n  [35] Jesus wept. (ESV)"
  ]
}
''';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

void main() {
  late MockHttpClient mockedHttpClient;

  setUp(() {
    mockedHttpClient = MockHttpClient();
  });

  test('Test getting of text passage.', () async {
    final correctUri = Uri.parse(
      'https://api.esv.org/v3/passage/text?q=John+11%3A35',
    );

    final response = MockResponse();

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token TEST'
    };

    when(() => response.statusCode).thenReturn(200);
    when(() => response.body).thenReturn(samplePassageText);
    when(() => mockedHttpClient.get(correctUri, headers: headers)).thenAnswer(
          (_) => Future<http.Response>.value(response),
    );

    final passageText = PassageText(
      httpClient: mockedHttpClient,
      apiKey: 'TEST',
    );

    final passageData = await passageText('John 11:35');

    expect(passageData, isNotNull);
    expect(passageData!['query'], 'John 11:35');
    expect(passageData['canonical'], 'John 11:35');
    expect((passageData['passages'] as List<dynamic>).length, 1);
    expect(
      (passageData['passages'] as List<dynamic>)[0],
      'John 11:35\n\n  [35] Jesus wept. (ESV)',
    );
  });
}
