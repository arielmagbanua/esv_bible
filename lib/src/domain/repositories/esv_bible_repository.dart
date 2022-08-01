import '../entities/passage_audio.dart';
import '../entities/passage_html.dart';
import '../entities/passage_text.dart';
import '../entities/passage_search.dart';

/// EsvBibleRepository
///
/// It is the contract / interface for abstracting the underlying implementation
/// of getting different bible passages from ESV API
abstract class EsvBibleRepository {
  /// Get passage html
  ///
  /// The [queryPassage] is the requested passage.
  /// The [params] is a key value map as url params.
  /// The [headers] is a map that contains the headers of the request.
  Future<PassageHtml> getPassageHtml(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  });

  /// Get passage text
  ///
  /// The [queryPassage] is the requested passage.
  /// The [params] is a key value map as url params.
  /// The [headers] is a map that contains the headers of the request.
  Future<PassageText> getPassageText(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  });

  /// Get passage search
  ///
  /// The [queryPassage] is the requested passage.
  /// The [params] is a key value map as url params.
  /// The [headers] is a map that contains the headers of the request.
  Future<PassageSearch> getPassageSearch(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  });

  /// Get passage audio
  ///
  /// The [queryPassage] is the requested passage.
  /// The [params] is a key value map as url params.
  /// The [headers] is a map that contains the headers of the request.
  /// The [filePath] is the file path where to save the mpe audio.
  Future<PassageAudio> getPassageAudio(
    String queryPassage, {
    String? filePath,
  });
}
