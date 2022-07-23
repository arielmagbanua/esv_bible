import '../../domain/entities/passage_text.dart' as entities;

class PassageText extends entities.PassageText {
  const PassageText({
    required super.query,
    required super.canonical,
    required super.parsed,
    required super.passageMeta,
    required super.passages,
  });

  factory PassageText.fromJson(Map<String, dynamic> json) {
    final jsonParsed = (json['parsed'] as List<dynamic>)
        .map((item) => item as List<dynamic>?)
        .toList();

    final jsonPassageMeta = (json['passage_meta'] as List<dynamic>)
        .map((item) => item as Map<String, dynamic>?)
        .toList();

    final jsonMessages = (json['passages'] as List<dynamic>)
        .map((item) => item as String?)
        .toList();

    final parsed = List<List<dynamic>?>.from(
      jsonParsed,
    ).toList();
    final passageMeta = List<Map<String, dynamic>?>.from(
      jsonPassageMeta,
    ).toList();
    final passages = List<String>.from(
      jsonMessages,
    ).toList();

    return PassageText(
      query: json['query'] == null ? '' : json['query'].toString(),
      canonical: json['canonical'] == null ? '' : json['canonical'].toString(),
      parsed: parsed,
      passageMeta: passageMeta,
      passages: passages,
    );
  }
}
