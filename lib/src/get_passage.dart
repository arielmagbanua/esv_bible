import 'package:http/http.dart' as http;
import 'data/data_sources/esv_remote_api_data_source.dart';
import 'data/repositories/esv_bible_repository.dart';
import 'domain/use_cases/get_passage_text.dart';
import 'domain/use_cases/get_passage_html.dart';
import 'domain/use_cases/get_passage_search.dart';

/// GetPassage
///
/// The base use case class or the use case factory class
/// for different passages.
abstract class GetPassage {
  const GetPassage();

  /// The factory method for creating PassageText instance.
  ///
  /// The [key] is the esv API key.
  factory GetPassage.text(String key) {
    final dataSource = EsvRemoteDataSourceImplementation(
      httpClient: http.Client(),
      apiKey: key,
    );
    final esvBibleRepository = EsvBibleRepository(dataSource);

    return GetPassageText(esvBibleRepository);
  }

  /// The factory method for creating PassageHtml instance.
  ///
  /// The [key] is the esv API key.
  factory GetPassage.html(String key) {
    final dataSource = EsvRemoteDataSourceImplementation(
      httpClient: http.Client(),
      apiKey: key,
    );
    final esvBibleRepository = EsvBibleRepository(dataSource);

    return GetPassageHtml(esvBibleRepository);
  }

  /// The factory method for creating PassageSearch instance.
  ///
  /// The [key] is the esv API key.
  factory GetPassage.search(String key) {
    final dataSource = EsvRemoteDataSourceImplementation(
      httpClient: http.Client(),
      apiKey: key,
    );
    final esvBibleRepository = EsvBibleRepository(dataSource);

    return GetPassageSearch(esvBibleRepository);
  }

  /// This enables any instance of this class to be callable.
  ///
  /// The [queryPassage] is the requested passage.
  /// The [params] is a key value map as url params.
  /// The [headers] is a map that contains the headers of the request.
  Future<dynamic> call(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  });
}
