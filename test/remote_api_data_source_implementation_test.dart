import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:esv_bible/data/data_sources/remote_api_data_source_implementation.dart';
import 'package:esv_bible/data/data_sources/remote_api_data_source.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

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

void main() {
  late MockHttpClient mockedHttpClient;

  setUp(() {
    mockedHttpClient = MockHttpClient();
  });

  test('Test getting of passage text', () async {
    final correctUri = Uri.parse(RemoteAPIDataSource.passageEndpoint);

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

    final remoteAPIDataSource = RemoteAPIDataSourceImplementation(
      apiKey: 'TEST',
      httpClient: mockedHttpClient,
    );

    final passage = await remoteAPIDataSource.getPassageText('John 11:35');

    expect(passage, isNotNull);
    expect(passage!.length, 1);

    final test = passage[0];

    expect(test, 'John 11:35\n\n  [35] Jesus wept. (ESV)');
  });
}
