import '../entities/passage_text.dart';
import '../repositories/esv_bible_repository.dart';
import '../../esv_bible.dart';

class GetPassageText extends GetPassage {
  final EsvBibleRepository esvBibleRepository;

  GetPassageText(this.esvBibleRepository);

  @override
  Future<PassageText> call(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) {
    return esvBibleRepository.getPassageText(queryPassage);
  }
}
