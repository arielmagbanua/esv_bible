import 'dart:convert';
import 'package:test/test.dart';
import 'package:esv_bible/src/data/models/passage_search.dart' as models;

import '../../../test_data.dart' show samplePassageSearch;

void main() {
  // convert sample data to map
  final samplePassageSearchMap =
      json.decode(samplePassageSearch) as Map<String, dynamic>;

  test('Should be able to instantiate PassageSearch model', () {
    final jsonResults = (samplePassageSearchMap['results'] as List<dynamic>)
        .map((item) => item as Map<String, dynamic>?)
        .toList();

    final results = List<Map<String, dynamic>?>.from(
      jsonResults,
    ).toList();

    final passageSearch = models.PassageSearch(
      page: samplePassageSearchMap['page'] as int,
      totalResults: samplePassageSearchMap['total_results'] as int,
      results: results,
      totalPages: samplePassageSearchMap['total_pages'] as int,
    );

    expect(passageSearch.page, 1);
    expect(passageSearch.totalResults, 3);
    expect(passageSearch.results, isNotEmpty);
    expect(passageSearch.totalPages, 1);
  });

  test('Should be able to instantiate PassageText model via factory', () {
    final passageSearch = models.PassageSearch.fromJson(samplePassageSearchMap);

    expect(passageSearch.page, 1);
    expect(passageSearch.totalResults, 3);
    expect(passageSearch.results, isNotEmpty);
    expect(passageSearch.totalPages, 1);
  });
}
