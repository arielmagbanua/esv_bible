library esv_bible;

import 'package:http/http.dart' as http;
import 'package:esv_bible/data/data_sources/esv_remote_api_data_source.dart';
import 'package:esv_bible/data/repositories/esv_bible_repository.dart';
import 'package:esv_bible/domain/use_cases/passage_text.dart';

abstract class GetPassage {
  const GetPassage();

  factory GetPassage.text() {
    final dataSource = EsvRemoteDataSourceImplementation(
      httpClient: http.Client(),
      apiKey: 'adf6689e8a9a0ad80364ed1a1cb2f30a682f46fd',
    );
    final esvBibleRepository = EsvBibleRepository(dataSource);

    return GetPassageText(esvBibleRepository);
  }

  Future<dynamic> call(
    String queryPassage, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  });
}

void main() async {
  final getPassageText = GetPassage.text();
  final data = await getPassageText('John 3:16');

  print(data);
}
