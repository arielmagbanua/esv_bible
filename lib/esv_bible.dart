library esv_bible;

import 'package:http/http.dart' as http;
import 'data/data_sources/esv_remote_api_data_source.dart';
import 'data/repositories/esv_bible_repository.dart';
import 'domain/use_cases/passage_text.dart';
import 'domain/use_cases/passage_html.dart';
import 'domain/use_cases/passage_search.dart';

abstract class GetPassage {
  const GetPassage();

  factory GetPassage.text(String key) {
    final dataSource = EsvRemoteDataSourceImplementation(
      httpClient: http.Client(),
      apiKey: key,
    );
    final esvBibleRepository = EsvBibleRepository(dataSource);

    return GetPassageText(esvBibleRepository);
  }

  factory GetPassage.html(String key) {
    final dataSource = EsvRemoteDataSourceImplementation(
      httpClient: http.Client(),
      apiKey: key,
    );
    final esvBibleRepository = EsvBibleRepository(dataSource);

    return GetPassageHtml(esvBibleRepository);
  }

  factory GetPassage.search(String key) {
    final dataSource = EsvRemoteDataSourceImplementation(
      httpClient: http.Client(),
      apiKey: key,
    );
    final esvBibleRepository = EsvBibleRepository(dataSource);

    return GetPassageSearch(esvBibleRepository);
  }

  Future<dynamic> call(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  });
}
