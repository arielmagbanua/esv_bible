import '../../domain/entities/passage_text.dart' as entity;

class PassageTextModel extends entity.PassageText {
  const PassageTextModel({
    required super.query,
    required super.canonical,
    required super.parsed,
    required super.passageMeta,
    required super.messages,
  });

  factory PassageTextModel.fromJson(Map<String, dynamic> json) {
    return PassageTextModel(
      query: json['query'] ?? '',
      canonical: json['canonical'] ?? '',
      parsed: json['parsed'] ?? [],
      passageMeta: json['passage_meta'] ?? [],
      messages: json['messages'] ?? [],
    );
  }
}
