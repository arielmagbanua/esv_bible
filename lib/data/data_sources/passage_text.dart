import 'package:esv_bible/data/data_sources/remote_api_data_source.dart';

/// PassageText
///
/// The passage text data source.
class PassageText extends RemoteAPIDataSource {
  @override
  String get url => 'https://api.esv.org/v3/passage/text';

  PassageText({
    required super.httpClient,
    required super.apiKey,
  });

  /// This enables the object to be callable.
  ///
  /// The [queryPassage] is the requested passage.
  /// The [params] is a key value map as url params.
  /// The [headers] is a map that contains the headers of the request.
  @override
  Future<Map<String, dynamic>?> call(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) async {
    return await query(query: queryPassage);
  }
}
