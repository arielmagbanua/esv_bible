import 'package:esv_bible/data/data_sources/passage_html.dart';
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

const samplePassageHTML = '''
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
    "<h2 class=\\"extra_text\\">John 11:35 <small class=\\"audio extra_text\\">(<a class=\\"mp3link\\" href=\\"https://audio.esv.org/hw/43011035-43011035.mp3\\" title=\\"John 11:35\\" type=\\"audio/mpeg\\">Listen</a>)</small></h2>\\n<p id=\\"p43011035_01-1\\" class=\\"virtual\\"><b class=\\"verse-num\\" id=\\"v43011035-1\\">35 </b>Jesus wept.</p>\\n<p>(<a href=\\"http://www.esv.org\\" class=\\"copyright\\">ESV</a>)</p>"
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

  group('Passage Text', () {
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
  });

  group('Passage HTML', () {
    test('Test getting of html passage.', () async {
      final correctUri = Uri.parse(
        'https://api.esv.org/v3/passage/html?q=John+11%3A35',
      );

      final response = MockResponse();

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Token TEST'
      };

      when(() => response.statusCode).thenReturn(200);
      when(() => response.body).thenReturn(samplePassageHTML);
      when(() => mockedHttpClient.get(correctUri, headers: headers)).thenAnswer(
            (_) => Future<http.Response>.value(response),
      );

      final passageHtml = PassageHtml(
        httpClient: mockedHttpClient,
        apiKey: 'TEST',
      );

      final passageData = await passageHtml('John 11:35');

      expect(passageData, isNotNull);
      expect(passageData!['query'], 'John 11:35');
      expect(passageData['canonical'], 'John 11:35');
      expect((passageData['passages'] as List<dynamic>).length, 1);
      expect(
        (passageData['passages'] as List<dynamic>)[0],
        '<h2 class="extra_text">John 11:35 <small class="audio extra_text">(<a class="mp3link" href="https://audio.esv.org/hw/43011035-43011035.mp3" title="John 11:35" type="audio/mpeg">Listen</a>)</small></h2>\n<p id="p43011035_01-1" class="virtual"><b class="verse-num" id="v43011035-1">35 </b>Jesus wept.</p>\n<p>(<a href="http://www.esv.org" class="copyright">ESV</a>)</p>',
      );
    });
  });
}
