import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'passage_text.g.dart';

/// PassageText
///
/// The entity class for PassageText data response.
@JsonSerializable()
class PassageText extends Equatable {
  final String query;

  final String canonical;

  final List<List<dynamic>?> parsed;

  @JsonKey(name: 'passage_meta')
  final List<Map<String, dynamic>?> passageMeta;

  final List<String> passages;

  const PassageText({
    required this.query,
    required this.canonical,
    required this.parsed,
    required this.passageMeta,
    required this.passages,
  });

  /// Generates [PassageText] object from [json] map object.
  factory PassageText.fromJson(Map<String, dynamic> json) =>
      _$PassageTextFromJson(json);

  /// Converts this object to a json map object
  Map<String, dynamic> toJson() => _$PassageTextToJson(this);

  @override
  List<Object?> get props => [
        query,
        canonical,
        parsed,
        passageMeta,
        passages,
      ];
}
