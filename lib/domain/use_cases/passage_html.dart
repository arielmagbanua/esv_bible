import '../entities/passage_html.dart';
import '../repositories/esv_bible_repository.dart';
import '../../esv_bible.dart';

class GetPassageHtml extends GetPassage {
  final EsvBibleRepository esvBibleRepository;

  GetPassageHtml(this.esvBibleRepository);

  @override
  Future<PassageHtml> call(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) {
    return esvBibleRepository.getPassageHtml(queryPassage);
  }
}
