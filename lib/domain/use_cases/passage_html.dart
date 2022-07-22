import '../entities/passage_html.dart';
import '../repositories/esv_bible_repository.dart';
import '../../get_passage.dart';

class GetPassageHtml extends GetPassage {
  final EsvBibleRepository esvBibleRepository;

  const GetPassageHtml(this.esvBibleRepository);

  /// This enables any instance of this class to be callable.
  ///
  /// The [queryPassage] is the requested passage.
  /// The [params] is a key value map as url params.
  /// The [headers] is a map that contains the headers of the request.
  @override
  Future<PassageHtml> call(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) {
    return esvBibleRepository.getPassageHtml(queryPassage);
  }
}
