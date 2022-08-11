import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'passage_search.g.dart';

/// PassageSearch
///
/// The entity class for PassageSearch data response.
@JsonSerializable()
class PassageSearch extends Equatable {
  /// The page of the result.
  final int page;

  /// Total number of results
  @JsonKey(name: 'total_results')
  final int totalResults;

  /// The list of results
  final List<Map<String, dynamic>?> results;

  /// The total number of pages.
  @JsonKey(name: 'total_pages')
  final int totalPages;

  /// Constructor
  ///
  /// The [page] is the page of the result.
  /// The [totalResults] is the total number of results.
  /// The [results] is the list of results.
  /// The [totalPages] is the total number of pages.
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

  /// Retrieves all properties of this class.
  @override
  List<Object?> get props => [
        page,
        totalResults,
        results,
        totalPages,
      ];
}
