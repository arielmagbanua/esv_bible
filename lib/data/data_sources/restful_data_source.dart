import 'package:http/http.dart' as http;

/// RestfulDataSource
///
/// The base RESTful data source client class.
abstract class RestfulDataSource {
  /// The http client
  final http.Client httpClient;

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
  /// The [customHeaders] are the custom or additional headers needed.
  /// The [body] is the body or payload of the request.
  ///     It could be a string or map.
  Future<http.Response> sendRequest({
    required String method,
    required String url,
    Map<String, String>? customHeaders,
    Object? body,
  }) {
    final Map<String, String> headers = {};
    headers.addAll(defaultHeaders);

    if (customHeaders != null) {
      // add the additional or custom headers
      headers.addAll(customHeaders);
    }

    switch (method.toUpperCase()) {
      case 'POST':
        return httpClient.post(
          Uri.parse(url),
          headers: headers,
          body: body,
        );

      case 'PUT':
        return httpClient.put(
          Uri.parse(url),
          headers: headers,
          body: body,
        );

      default:
        return httpClient.get(
          Uri.parse(url),
          headers: headers,
        );
    }
  }
}
