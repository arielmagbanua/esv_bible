import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'passage_html.g.dart';

/// PassageHtml
///
/// The entity class for PassageHtml data response.
@JsonSerializable()
class PassageHtml extends Equatable {
  /// The query term used.
  final String query;

  final String canonical;

  final List<List<dynamic>?> parsed;

  @JsonKey(name: 'passage_meta')
  final List<Map<String, dynamic>?> passageMeta;

  final List<String> passages;

  const PassageHtml({
    required this.query,
    required this.canonical,
    required this.parsed,
    required this.passageMeta,
    required this.passages,
  });

  /// Generates [PassageHtml] object from [json] map object.
  factory PassageHtml.fromJson(Map<String, dynamic> json) =>
      _$PassageHtmlFromJson(json);

  /// Converts this object to a json map object
  Map<String, dynamic> toJson() => _$PassageHtmlToJson(this);

  /// Retrieves all properties of this class.
  @override
  List<Object?> get props => [
        query,
        canonical,
        parsed,
        passageMeta,
        passages,
      ];
}
