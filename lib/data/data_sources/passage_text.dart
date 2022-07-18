import 'package:esv_bible/data/data_sources/esv_api_data_source.dart';

/// PassageText
///
/// The passage text data source.
class PassageText extends EsvRemoteAPIDataSource {
  @override
  String get url => 'https://api.esv.org/v3/passage/text';

  PassageText({
    required super.httpClient,
    required super.apiKey,
  });
}
