import '../entities/passage_search.dart';
import '../repositories/esv_bible_repository.dart';
import '../../esv_bible.dart';

class GetPassageSearch extends GetPassage {
  final EsvBibleRepository esvBibleRepository;

  GetPassageSearch(this.esvBibleRepository);

  @override
  Future<PassageSearch> call(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) {
    return esvBibleRepository.getPassageSearch(queryPassage);
  }
}
