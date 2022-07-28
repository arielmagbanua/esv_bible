import 'dart:convert';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:esv_bible/src/domain/entities/passage_search.dart';
import 'package:esv_bible/src/domain/entities/passage_text.dart';
import 'package:esv_bible/src/domain/entities/passage_html.dart';
import 'package:esv_bible/src/data/repositories/esv_bible_repository.dart';
import 'package:esv_bible/src/data/data_sources/esv_remote_api_data_source.dart';

import '../../../test_data.dart';

class MockEsvRemoteDataSource extends Mock implements EsvRemoteDataSource {}

void main() {
  final mockEsvRemoteDataSource = MockEsvRemoteDataSource();
  const query = 'John 11:35';

  test('test getPassageHtml method', () async {
    // convert sample data to map
    final samplePassageHTMLMap = json.decode(samplePassageHTML);

    when(() => mockEsvRemoteDataSource.getPassageHtml(query)).thenAnswer(
      (_) => Future<Map<String, dynamic>?>.value(
        samplePassageHTMLMap as Map<String, dynamic>?,
      ),
    );

    final repository = EsvBibleRepository(mockEsvRemoteDataSource);
    final passageHtml = await repository.getPassageHtml(query);

    expect(passageHtml, isNotNull);
    expect(passageHtml, const TypeMatcher<PassageHtml>());
    expect(passageHtml.query, 'John 11:35');
    expect(passageHtml.canonical, 'John 11:35');
    expect(passageHtml.passages, isNotEmpty);
    expect(
      passageHtml.passages[0],
      '<h2 class="extra_text">John 11:35 <small class="audio extra_text">(<a class="mp3link" href="https://audio.esv.org/hw/43011035-43011035.mp3" title="John 11:35" type="audio/mpeg">Listen</a>)</small></h2>\n<p id="p43011035_01-1" class="virtual"><b class="verse-num" id="v43011035-1">35 </b>Jesus wept.</p>\n<p>(<a href="http://www.esv.org" class="copyright">ESV</a>)</p>',
    );
  });

  test('test getPassageText method', () async {
    // convert sample data to map
    final samplePassageTextMap = json.decode(samplePassageText);

    when(() => mockEsvRemoteDataSource.getPassageText(query)).thenAnswer(
      (_) => Future<Map<String, dynamic>?>.value(
        samplePassageTextMap as Map<String, dynamic>?,
      ),
    );

    final repository = EsvBibleRepository(mockEsvRemoteDataSource);
    final passageText = await repository.getPassageText(query);

    expect(passageText, isNotNull);
    expect(passageText, const TypeMatcher<PassageText>());
    expect(passageText.query, 'John 11:35');
    expect(passageText.canonical, 'John 11:35');
    expect(passageText.passages, isNotEmpty);
    expect(passageText.passages[0], 'John 11:35\n\n  [35] Jesus wept. (ESV)');
  });

  test('test getPassageSearch method', () async {
    // convert sample data to map
    final samplePassageSearchMap = json.decode(samplePassageSearch);

    when(() => mockEsvRemoteDataSource.getPassageSearch(query)).thenAnswer(
      (_) => Future<Map<String, dynamic>?>.value(
        samplePassageSearchMap as Map<String, dynamic>?,
      ),
    );

    final repository = EsvBibleRepository(mockEsvRemoteDataSource);
    final passageSearch = await repository.getPassageSearch(query);

    expect(passageSearch, isNotNull);
    expect(passageSearch, const TypeMatcher<PassageSearch>());
    expect(passageSearch.page, 1);
    expect(passageSearch.totalResults, 3);
    expect(passageSearch.results, isNotEmpty);
    expect(passageSearch.totalPages, 1);
  });
}
