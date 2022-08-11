import 'package:http/http.dart' as http;

import 'restful_data_source.dart';

/// EsvRemoteDataSource
///
/// The abstraction for ESV API resources.
abstract class EsvRemoteDataSource extends RestfulDataSource {
  /// The api base point
  get baseEndpoint;

  /// The api version
  get apiVersion;

  /// Constructor
  ///
  /// The [httpClient] is the instance of http client for executing http requests.
  const EsvRemoteDataSource({required super.httpClient});

  /// Get passage html
  ///
  /// https://api.esv.org/docs/passage-html/
  ///
  /// The [queryPassage] is the requested passage.
  /// The [params] is a key value map as url params.
  /// The [headers] is a map that contains the headers of the request.
  Future<Map<String, dynamic>?> getPassageHtml(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  });

  /// Get passage text
  ///
  /// https://api.esv.org/docs/passage-text/
  ///
  /// The [queryPassage] is the requested passage.
  /// The [params] is a key value map as url params.
  /// The [headers] is a map that contains the headers of the request.
  Future<Map<String, dynamic>?> getPassageText(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  });

  /// Get passage search
  ///
  /// https://api.esv.org/docs/passage-search/
  ///
  /// The [queryPassage] is the requested passage.
  /// The [params] is a key value map as url params.
  /// The [headers] is a map that contains the headers of the request.
  Future<Map<String, dynamic>?> getPassageSearch(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  });

  /// Get passage audio
  ///
  /// https://api.esv.org/docs/passage-audio/
  ///
  /// The [queryPassage] is the requested passage.
  Future<http.Response> getPassageAudio(String queryPassage);
}
