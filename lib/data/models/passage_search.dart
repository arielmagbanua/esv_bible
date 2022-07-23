import '../../domain/entities/passage_search.dart' as entities;

class PassageSearch extends entities.PassageSearch {
  const PassageSearch({
    required super.page,
    required super.totalResults,
    required super.results,
    required super.totalPages,
  });

  factory PassageSearch.fromJson(Map<String, dynamic> json) {
    final jsonResults = (json['results'] as List<dynamic>)
        .map((item) => item as Map<String, dynamic>?)
        .toList();

    final results = List<Map<String, dynamic>?>.from(
      jsonResults,
    ).toList();

    return PassageSearch(
      page: json['page'] == null ? -1 : json['page'] as int,
      totalResults:
          json['total_results'] == null ? -1 : json['total_results'] as int,
      results: results,
      totalPages: json['total_pages'] == null ? -1 : json['total_pages'] as int,
    );
  }
}
