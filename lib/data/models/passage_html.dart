

import '../../domain/entities/passage_html.dart';

class PassageHtmlModel extends PassageHtml {
  const PassageHtmlModel({
    required super.query,
    required super.canonical,
    required super.parsed,
    required super.passageMeta,
    required super.messages,
  });

  factory PassageHtmlModel.fromJson(Map<String, dynamic> json) {
    return PassageHtmlModel(
      query: json['query'] ?? '',
      canonical: json['canonical'] ?? '',
      parsed: json['parsed'] ?? [],
      passageMeta: json['passage_meta'] ?? [],
      messages: json['messages'] ?? [],
    );
  }
}
