import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:esv_bible/data/data_sources/remote_api_data_source.dart';

class RemoteAPIDataSourceImplementation extends RemoteAPIDataSource {
  RemoteAPIDataSourceImplementation({required http.Client client})
      : super(client: client);

  @override
  Future<String?> getPassageText(String queryPassage) async {
    final responseData = await rawPassageText(queryPassage);

    if (responseData != null) {
      return responseData['passages'];
    }

    return null;
  }

  @override
  Future<Map<dynamic, dynamic>?> rawPassageText(String queryPassage) async {
    final response = await sendRequest(method: 'GET', url: RemoteAPIDataSource.passageEndpoint, customHeaders: {
      'Authorization': 'Token TOKEN_HERE'
    });

    final responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return responseData;
    }

    return null;
  }
}
