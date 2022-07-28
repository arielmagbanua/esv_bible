import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'passage_search.g.dart';

/// PassageSearch
///
/// The entity class for PassageSearch data response.
@JsonSerializable()
class PassageSearch extends Equatable {
  final int page;

  @JsonKey(name: 'total_results')
  final int totalResults;

  final List<Map<String, dynamic>?> results;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  const PassageSearch({
    required this.page,
    required this.totalResults,
    required this.results,
    required this.totalPages,
  });

  /// Generates [PassageSearch] object from [json] map object.
  factory PassageSearch.fromJson(Map<String, dynamic> json) =>
      _$PassageSearchFromJson(json);

  /// Converts this object to a json map object
  Map<String, dynamic> toJson() => _$PassageSearchToJson(this);

  @override
  List<Object?> get props => [
        page,
        totalResults,
        results,
        totalPages,
      ];
}
