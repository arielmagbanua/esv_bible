import '../../domain/entities/passage_search.dart' as entity;

class PassageSearchModel extends entity.PassageSearch {
  const PassageSearchModel({
    required super.page,
    required super.totalResults,
    required super.results,
    required super.totalPages,
  });

  factory PassageSearchModel.fromJson(Map<String, dynamic> json) {
    return PassageSearchModel(
      page: json['page'] ?? -1,
      totalResults: json['total_results'] ?? -1,
      results: json['results'] ?? [],
      totalPages: json['total_pages'] ?? -1,
    );
  }
}
