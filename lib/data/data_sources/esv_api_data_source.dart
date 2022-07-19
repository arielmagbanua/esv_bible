import 'dart:convert';
import 'package:esv_bible/data/data_sources/restful_data_source.dart';
import 'package:http/http.dart' as http;

/// RemoteAPIDataSource
///
/// The base Remote API Data Source class.
abstract class EsvRemoteAPIDataSource extends RestfulDataSource {
  final String apiKey;

  static const baseEndpoint = 'https://api.esv.org';
  static const apiVersion = 'v3';

  /// Constructor
  ///
  /// The [httpClient] is the instance of http client for executing http requests.
  /// The [apiKey] is the API Key for each request.
  const EsvRemoteAPIDataSource({
    required http.Client httpClient,
    required this.apiKey,
  }) : super(httpClient: httpClient);

  /// Executes the query API
  ///
  /// The [query] is the requested passage.
  /// Example values:
  /// ```
  /// * `John 1:1`
  /// * `jn11.35`
  /// * `Genesis 1-3`
  /// * `43011035`
  /// * `01001001-01011032`
  /// * `John1.1;Genesis1.1`
  /// * `19001001-19001006,19003001-19003008`
  /// ```
  ///
  /// The [params] is a key value map as url params.
  /// The [headers] is a map that contains the headers of the request.
  Future<Map<String, dynamic>?> query({
    required String endpoint,
    String? query,
    Map<String, String>? params,
    Map<String, String>? headers,
  }) async {
    params = params ?? {};
    headers = headers ?? {};

    if (query != null) {
      // add the query as part of params
      params['q'] = query;
    }

    // set the authorization header
    headers['Authorization'] = 'Token $apiKey';
    // set the content type header
    headers['Content-Type'] = 'application/json';

    String queryString =
        params.isNotEmpty ? Uri(queryParameters: params).query : '';

    String url = '$baseEndpoint/$apiVersion/$endpoint';

    final response = await sendRequest(
      method: 'GET',
      url: '$url?$queryString',
      customHeaders: headers,
    );

    final responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return responseData;
    }

    return null;
  }

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
  }) async {
    return await query(
      endpoint: 'passage/html',
      query: queryPassage,
    );
  }

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
      }) async {
    return await query(
      endpoint: 'passage/text',
      query: queryPassage,
    );
  }

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
      }) async {
    return await query(
      endpoint: 'passage/search',
      query: queryPassage,
    );
  }
}
