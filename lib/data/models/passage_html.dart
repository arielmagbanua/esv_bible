import '../../domain/entities/passage_html.dart' as entities;

class PassageHtml extends entities.PassageHtml {
  const PassageHtml({
    required super.query,
    required super.canonical,
    required super.parsed,
    required super.passageMeta,
    required super.messages,
  });

  factory PassageHtml.fromJson(Map<String, dynamic> json) {
    return PassageHtml(
      query: json['query'] ?? '',
      canonical: json['canonical'] ?? '',
      parsed: json['parsed'] ?? [],
      passageMeta: json['passage_meta'] ?? [],
      messages: json['messages'] ?? [],
    );
  }
}
