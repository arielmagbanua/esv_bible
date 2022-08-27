import 'dart:io';
import 'package:path/path.dart' show join;

import '../data_sources/esv_remote_data_source.dart';
import '../../domain/repositories/esv_bible_repository.dart' as contracts;
import '../../domain/entities/passage_audio.dart';
import '../../domain/entities/passage_html.dart';
import '../../domain/entities/passage_text.dart';
import '../../domain/entities/passage_search.dart';

/// EsvBibleRepository
///
/// It is responsible for abstracting the underlying implementation
/// of getting bible passages from ESV API.
class EsvBibleRepository implements contracts.EsvBibleRepository {
  /// The ESV data source instance which enables this class to pull data from ESV API server.
  final EsvRemoteDataSource esvRemoteDataSource;

  /// Constructor
  ///
  /// The [esvRemoteDataSource] is the ESV data source instance which enables
  /// this class to pull data from ESV API server.
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
    final data = await esvRemoteDataSource.getPassageText(
      queryPassage,
      params: params,
      headers: headers,
    );

    return data != null
        ? PassageText.fromJson(data)
        : PassageText.fromJson(const {});
  }

  /// Get passage audio
  ///
  /// The [queryPassage] is the requested passage.
  /// The [filePath] is the file path where to save the mpe audio.
  @override
  Future<PassageAudio> getPassageAudio(
    String queryPassage, {
    String? filePath,
  }) async {
    final audioResponse =
        await esvRemoteDataSource.getPassageAudio(queryPassage);

    final tempDirectory = Directory.systemTemp;

    // get the temp directory path if it exists, if not then use the current directory
    String fileDirectoryPath = await tempDirectory.exists()
        ? tempDirectory.path
        : Directory.current.path;
    String audioPath = join(fileDirectoryPath, 'passageAudio.mp3');

    final file = await File(filePath ?? audioPath).writeAsBytes(
      audioResponse.bodyBytes,
    );

    return PassageAudio(query: queryPassage, audio: file);
  }
}
