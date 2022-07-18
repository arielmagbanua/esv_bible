import '../../domain/entities/passage_search.dart' as entity;

class PassageSearch extends entity.PassageSearch {
  const PassageSearch({
    required super.page,
    required super.totalResults,
    required super.results,
    required super.totalPages,
  });
}
