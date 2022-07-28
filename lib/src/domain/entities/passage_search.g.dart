// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passage_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PassageSearch _$PassageSearchFromJson(Map<String, dynamic> json) =>
    PassageSearch(
      page: json['page'] as int,
      totalResults: json['total_results'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>?)
          .toList(),
      totalPages: json['total_pages'] as int,
    );

Map<String, dynamic> _$PassageSearchToJson(PassageSearch instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_results': instance.totalResults,
      'results': instance.results,
      'total_pages': instance.totalPages,
    };
