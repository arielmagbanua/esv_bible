import '../../domain/entities/passage_html.dart' as entities;

class PassageHtml extends entities.PassageHtml {
  const PassageHtml({
    required super.query,
    required super.canonical,
    required super.parsed,
    required super.passageMeta,
    required super.passages,
  });

  factory PassageHtml.fromJson(Map<String, dynamic> json) {
    final parsed = List<List<dynamic>?>.from(
      json['parsed'],
    ).toList();
    final passageMeta = List<Map<String, dynamic>?>.from(
      json['passage_meta'],
    ).toList();
    final passages = List<String>.from(
      json['passages'],
    ).toList();

    return PassageHtml(
      query: json['query'] ?? '',
      canonical: json['canonical'] ?? '',
      parsed: parsed,
      passageMeta: passageMeta,
      passages: passages,
    );
  }
}
