import 'package:http/http.dart' as http;

import 'data/data_sources/esv_remote_data_source_implementation.dart';
import 'data/repositories/esv_bible_repository.dart' as implementations;
import 'domain/repositories/esv_bible_repository.dart' as contracts;
import 'domain/entities/passage_audio.dart';
import 'domain/entities/passage_html.dart';
import 'domain/entities/passage_search.dart';
import 'domain/entities/passage_text.dart';

/// Passage
///
/// The class for retrieving passage data from ESV API.
class Passage {
  /// The api key
  final String apiKey;

  /// The ESV bible repository instance
  final contracts.EsvBibleRepository esvBibleRepository;

  Passage(
    this.apiKey, {
    contracts.EsvBibleRepository? esvBibleRepository,
  }) : esvBibleRepository = esvBibleRepository ??
            implementations.EsvBibleRepository(
              EsvRemoteDataSourceImplementation(
                httpClient: http.Client(),
                apiKey: apiKey,
              ),
            );

  /// Retrieves a passage text data from ESV API.
  ///
  /// The [queryPassage] is the requested passage.
  /// The [params] is a key value map as url params.
  /// The [headers] is a map that contains the headers of the request.
  Future<PassageText> text(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) {
    return esvBibleRepository.getPassageText(queryPassage);
  }

  /// Retrieves a passage html data from ESV API.
  ///
  /// The [queryPassage] is the requested passage.
  /// The [params] is a key value map as url params.
  /// The [headers] is a map that contains the headers of the request.
  Future<PassageHtml> html(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) {
    return esvBibleRepository.getPassageHtml(queryPassage);
  }

  /// Retrieves a passage search data from ESV API.
  ///
  /// The [queryPassage] is the requested passage.
  /// The [params] is a key value map as url params.
  /// The [headers] is a map that contains the headers of the request.
  Future<PassageSearch> search(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) {
    return esvBibleRepository.getPassageSearch(queryPassage);
  }

  /// Retrieves passage audio file from ESV API.
  ///
  /// The [queryPassage] is the requested passage.
  Future<PassageAudio> audio(String queryPassage) {
    return esvBibleRepository.getPassageAudio(queryPassage);
  }
}
