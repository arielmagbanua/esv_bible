import '../data_sources/esv_remote_api_data_source.dart';
import '../../domain/repositories/esv_bible_repository.dart' as contracts;
import '../models/passage_html.dart';
import '../models/passage_text.dart';
import '../models/passage_search.dart';

/// EsvBibleRepository
///
/// It is responsible for abstracting the underlying implementation
/// of getting bible passages from ESV API.
class EsvBibleRepository extends contracts.EsvBibleRepository {
  final EsvRemoteAPIDataSource esvRemoteDataSource;

  EsvBibleRepository(this.esvRemoteDataSource);

  /// Get passage html
  ///
  /// The [queryPassage] is the requested passage.
  /// The [params] is a key value map as url params.
  /// The [headers] is a map that contains the headers of the request.
  @override
  Future<PassageHtml> getPassageHtml(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) async {
    final data = await esvRemoteDataSource.getPassageHtml(
      queryPassage,
      params: params,
      headers: headers,
    );

    return data != null
        ? PassageHtml.fromJson(data)
        : PassageHtml.fromJson(const {});
  }

  /// Get passage text
  ///
  /// The [queryPassage] is the requested passage.
  /// The [params] is a key value map as url params.
  /// The [headers] is a map that contains the headers of the request.
  @override
  Future<PassageSearch> getPassageSearch(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) async {
    final data = await esvRemoteDataSource.getPassageSearch(
      queryPassage,
      params: params,
      headers: headers,
    );

    return data != null
        ? PassageSearch.fromJson(data)
        : PassageSearch.fromJson(const {});
  }

  /// Get passage search
  ///
  /// The [queryPassage] is the requested passage.
  /// The [params] is a key value map as url params.
  /// The [headers] is a map that contains the headers of the request.
  @override
  Future<PassageText> getPassageText(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) async {
    final data = await esvRemoteDataSource.getPassageSearch(
      queryPassage,
      params: params,
      headers: headers,
    );

    return data != null
        ? PassageText.fromJson(data)
        : PassageText.fromJson(const {});
  }
}
