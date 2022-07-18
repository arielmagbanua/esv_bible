import 'package:esv_bible/data/data_sources/esv_api_data_source.dart';

/// PassageText
///
/// The passage text data source.
class PassageAudio extends EsvRemoteAPIDataSource {
  @override
  String get url => 'https://api.esv.org/v3/passage/audio';

  PassageAudio({
    required super.httpClient,
    required super.apiKey,
  });
}
