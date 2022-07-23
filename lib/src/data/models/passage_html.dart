import '../../domain/entities/passage_html.dart' as entities;

/// PassageHtml
///
/// The model class for PassageHtml data response.
class PassageHtml extends entities.PassageHtml {
  const PassageHtml({
    required super.query,
    required super.canonical,
    required super.parsed,
    required super.passageMeta,
    required super.passages,
  });

  /// The factory constructor which creates a new instance of PassageHtml
  /// from a [json] data.
  factory PassageHtml.fromJson(Map<String, dynamic> json) {
    // convert data to a correct types
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

    return PassageHtml(
      query: json['query'] == null ? '' : json['query'].toString(),
      canonical: json['canonical'] == null ? '' : json['canonical'].toString(),
      parsed: parsed,
      passageMeta: passageMeta,
      passages: passages,
    );
  }
}
