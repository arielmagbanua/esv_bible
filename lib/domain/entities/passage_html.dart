import 'package:equatable/equatable.dart';

/// PassageHtml
///
/// The entity class for PassageHtml data response.
class PassageHtml extends Equatable {
  final String query;
  final String canonical;
  final List<List<dynamic>?> parsed;
  final List<Map<String, dynamic>?> passageMeta;
  final List<String> passages;

  const PassageHtml({
    required this.query,
    required this.canonical,
    required this.parsed,
    required this.passageMeta,
    required this.passages,
  });

  @override
  List<Object?> get props => [
        query,
        canonical,
        parsed,
        passageMeta,
        passages,
      ];
}
