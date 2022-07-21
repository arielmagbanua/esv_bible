import '../../domain/entities/passage_search.dart' as entities;

class PassageSearch extends entities.PassageSearch {
  const PassageSearch({
    required super.page,
    required super.totalResults,
    required super.results,
    required super.totalPages,
  });

  factory PassageSearch.fromJson(Map<String, dynamic> json) {
    return PassageSearch(
      page: json['page'] ?? -1,
      totalResults: json['total_results'] ?? -1,
      results: json['results'] ?? [],
      totalPages: json['total_pages'] ?? -1,
    );
  }
}
