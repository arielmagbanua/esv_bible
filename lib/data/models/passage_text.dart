import '../../domain/entities/passage_text.dart' as entities;

class PassageText extends entities.PassageText {
  const PassageText({
    required super.query,
    required super.canonical,
    required super.parsed,
    required super.passageMeta,
    required super.messages,
  });

  factory PassageText.fromJson(Map<String, dynamic> json) {
    return PassageText(
      query: json['query'] ?? '',
      canonical: json['canonical'] ?? '',
      parsed: json['parsed'] ?? [],
      passageMeta: json['passage_meta'] ?? [],
      messages: json['messages'] ?? [],
    );
  }
}
