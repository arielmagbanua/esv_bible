import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:esv_bible/data/data_sources/remote_api_data_source.dart';

class RemoteAPIDataSourceImplementation extends RemoteAPIDataSource {
  final String apiKey;

  RemoteAPIDataSourceImplementation({
    required http.Client httpClient,
    required this.apiKey,
  }) : super(httpClient: httpClient);

  @override
  Future<List<String>?> getPassageText(String queryPassage) async {
    final responseData = await rawPassageText(queryPassage);

    if (responseData != null) {
      return (responseData['passages'] as List<dynamic>)
          .map((item) => item as String)
          .toList();
    }

    return null;
  }

  @override
  Future<Map<dynamic, dynamic>?> rawPassageText(String queryPassage) async {
    final response = await sendRequest(
        method: 'GET',
        url: RemoteAPIDataSource.passageEndpoint,
        customHeaders: {'Authorization': 'Token $apiKey'});

    final responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return responseData;
    }

    return null;
  }
}
