import 'package:equatable/equatable.dart';

/// PassageText
///
/// The entity class for PassageText data response.
class PassageText extends Equatable {
  final String query;
  final String canonical;
  final List<List<dynamic>?> parsed;
  final List<Map<String, dynamic>?> passageMeta;
  final List<String> passages;

  const PassageText({
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
