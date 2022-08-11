import 'package:http/http.dart' as http;

/// RestfulDataSource
///
/// The base RESTful data source client class.
abstract class RestfulDataSource {
  /// The http client
  final http.Client httpClient;

  /// Constructor
  ///
  /// The [httpClient] is the instance of http client for executing http requests.
  const RestfulDataSource({
    required this.httpClient,
  });

  /// The default headers for every request.
  Map<String, String> get defaultHeaders =>
      {'Content-Type': 'application/json'};

  /// Sends the http request.
  ///
  /// The [method] is the RESTful method or verb.
  /// The [url] is the endpoint of the request.
  /// The [params] is a key value map for the url params of the request.
  /// The [headers] are the custom or additional headers needed.
  /// The [body] is the body or payload of the request.
  ///     It could be a string or map.
  Future<http.Response> sendRequest({
    required String method,
    required String url,
    Map<String, String>? params,
    Map<String, String>? headers,
    Object? body,
  }) {
    final Map<String, String> requestHeaders = {};
    requestHeaders.addAll(defaultHeaders);

    if (headers != null) {
      // add the additional or custom headers
      requestHeaders.addAll(headers);
    }

    // create the query string
    String queryString = (params != null && params.isNotEmpty)
        ? Uri(queryParameters: params).query
        : '';

    url = '$url?$queryString';

    switch (method.toUpperCase()) {
      case 'POST':
        return httpClient.post(
          Uri.parse(url),
          headers: requestHeaders,
          body: body,
        );

      case 'PUT':
        return httpClient.put(
          Uri.parse(url),
          headers: requestHeaders,
          body: body,
        );

      default:
        return httpClient.get(
          Uri.parse(url),
          headers: requestHeaders,
        );
    }
  }
}
