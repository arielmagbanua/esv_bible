import '../entities/passage_text.dart';
import '../repositories/esv_bible_repository.dart';
import '../../get_passage.dart';

/// GetPassageText
///
/// The use case class for PassageText
class GetPassageText extends GetPassage {
  final EsvBibleRepository esvBibleRepository;

  const GetPassageText(this.esvBibleRepository);

  /// This enables any instance of this class to be callable.
  ///
  /// The [queryPassage] is the requested passage.
  /// The [params] is a key value map as url params.
  /// The [headers] is a map that contains the headers of the request.
  @override
  Future<PassageText> call(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) {
    return esvBibleRepository.getPassageText(queryPassage);
  }
}
