import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import 'package:esv_bible/src/data/data_sources/esv_remote_data_source_implementation.dart';

import '../../../test_data.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

void main() {
  late MockHttpClient mockedHttpClient;
  late MockResponse mockResponse;

  setUp(() {
    mockedHttpClient = MockHttpClient();
    mockResponse = MockResponse();
  });

  test('Test getting of text passage.', () async {
    final correctUri = Uri.parse(
      'https://api.esv.org/v3/passage/text?q=John+11%3A35',
    );

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token TEST'
    };

    when(() => mockResponse.statusCode).thenReturn(200);
    when(() => mockResponse.body).thenReturn(samplePassageText);
    when(() => mockedHttpClient.get(correctUri, headers: headers)).thenAnswer(
      (_) => Future<http.Response>.value(mockResponse),
    );

    final remoteDataSource = EsvRemoteDataSourceImplementation(
      httpClient: mockedHttpClient,
      apiKey: 'TEST',
    );

    final passageData = await remoteDataSource.getPassageText('John 11:35');

    expect(passageData, isNotNull);
    expect(passageData!['query'], 'John 11:35');
    expect(passageData['canonical'], 'John 11:35');
    expect((passageData['passages'] as List<dynamic>).length, 1);
    expect(
      (passageData['passages'] as List<dynamic>)[0],
      'John 11:35\n\n  [35] Jesus wept. (ESV)',
    );
  });

  test('Test getting of html passage.', () async {
    final correctUri = Uri.parse(
      'https://api.esv.org/v3/passage/html?q=John+11%3A35',
    );

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token TEST'
    };

    when(() => mockResponse.statusCode).thenReturn(200);
    when(() => mockResponse.body).thenReturn(samplePassageHTML);
    when(() => mockedHttpClient.get(correctUri, headers: headers)).thenAnswer(
      (_) => Future<http.Response>.value(mockResponse),
    );

    final remoteDataSource = EsvRemoteDataSourceImplementation(
      httpClient: mockedHttpClient,
      apiKey: 'TEST',
    );

    final passageData = await remoteDataSource.getPassageHtml('John 11:35');

    expect(passageData, isNotNull);
    expect(passageData!['query'], 'John 11:35');
    expect(passageData['canonical'], 'John 11:35');
    expect((passageData['passages'] as List<dynamic>).length, 1);
    expect(
      (passageData['passages'] as List<dynamic>)[0],
      '<h2 class="extra_text">John 11:35 <small class="audio extra_text">(<a class="mp3link" href="https://audio.esv.org/hw/43011035-43011035.mp3" title="John 11:35" type="audio/mpeg">Listen</a>)</small></h2>\n<p id="p43011035_01-1" class="virtual"><b class="verse-num" id="v43011035-1">35 </b>Jesus wept.</p>\n<p>(<a href="http://www.esv.org" class="copyright">ESV</a>)</p>',
    );
  });

  test('Test passage search', () async {
    const query = 'rabble';

    final correctUri = Uri.parse(
      'https://api.esv.org/v3/passage/search?q=$query',
    );

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token TEST'
    };

    when(() => mockResponse.statusCode).thenReturn(200);
    when(() => mockResponse.body).thenReturn(samplePassageSearch);
    when(() => mockedHttpClient.get(correctUri, headers: headers)).thenAnswer(
      (_) => Future<http.Response>.value(mockResponse),
    );

    final remoteDataSource = EsvRemoteDataSourceImplementation(
      httpClient: mockedHttpClient,
      apiKey: 'TEST',
    );

    final passageData = await remoteDataSource.getPassageSearch(query);

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
