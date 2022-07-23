import 'package:equatable/equatable.dart';

/// PassageSearch
///
/// The entity class for PassageSearch data response.
class PassageSearch extends Equatable {
  final int page;
  final int totalResults;
  final List<Map<String, dynamic>?> results;
  final int totalPages;

  const PassageSearch({
    required this.page,
    required this.totalResults,
    required this.results,
    required this.totalPages,
  });

  @override
  List<Object?> get props => [
        page,
        totalResults,
        results,
        totalPages,
      ];
}
