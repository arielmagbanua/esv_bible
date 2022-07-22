import '../entities/passage_text.dart';
import '../repositories/esv_bible_repository.dart';
import '../../get_passage.dart';

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
