import '../../domain/entities/passage_search.dart' as entities;

/// PassageSearch
///
/// The model class for PassageSearch data response.
class PassageSearch extends entities.PassageSearch {
  const PassageSearch({
    required super.page,
    required super.totalResults,
    required super.results,
    required super.totalPages,
  });

  /// The factory constructor which creates a new instance of PassageSearch
  /// from a [json] data.
  factory PassageSearch.fromJson(Map<String, dynamic> json) {
    // convert data to a correct types
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
