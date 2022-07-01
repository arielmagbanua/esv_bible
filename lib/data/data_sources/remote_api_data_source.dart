import 'dart:convert';
import 'package:esv_bible/data/data_sources/restful_data_source.dart';
import 'package:http/http.dart' as http;

/// RemoteAPIDataSource
///
/// The base Remote API Data Source class.
abstract class RemoteAPIDataSource extends RestfulDataSource {
  final String apiKey;

  /// The url of the data source
  String get url;

  /// Constructor
  ///
  /// The [httpClient] is the instance of http client for executing http requests.
  /// The [apiKey] is the API Key for each request.
  const RemoteAPIDataSource({
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
  Future<Map<String, dynamic>?>query({
    String? query,
    Map<String, String>? params,
    Map<String, String>? headers,
  }) async {
    params = params ?? (params = {});

    if (query != null) {
      // add the query as part of params
      params['q'] = query;
    }

    String queryString = params.isNotEmpty ? Uri(queryParameters: params).query : '';

    final response = await sendRequest(
        method: 'GET',
        url: '$url?$queryString',
        customHeaders: {'Authorization': 'Token $apiKey'});

    final responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return responseData;
    }

    return null;
  }

  /// This enables the object to be callable.
  ///
  /// The [queryPassage] is the requested passage.
  /// The [params] is a key value map as url params.
  /// The [headers] is a map that contains the headers of the request.
  Future<Map<String, dynamic>?> call(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  });
}
