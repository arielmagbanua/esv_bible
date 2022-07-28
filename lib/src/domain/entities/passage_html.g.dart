// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passage_html.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PassageHtml _$PassageHtmlFromJson(Map<String, dynamic> json) => PassageHtml(
      query: json['query'] as String,
      canonical: json['canonical'] as String,
      parsed: (json['parsed'] as List<dynamic>)
          .map((e) => e as List<dynamic>?)
          .toList(),
      passageMeta: (json['passage_meta'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>?)
          .toList(),
      passages:
          (json['passages'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PassageHtmlToJson(PassageHtml instance) =>
    <String, dynamic>{
      'query': instance.query,
      'canonical': instance.canonical,
      'parsed': instance.parsed,
      'passage_meta': instance.passageMeta,
      'passages': instance.passages,
    };
