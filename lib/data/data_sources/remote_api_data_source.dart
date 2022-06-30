import 'package:esv_bible/data/data_sources/restful_data_source.dart';
import 'package:http/http.dart' as http;

abstract class RemoteAPIDataSource extends RestfulDataSource {
  static const passageEndpoint = 'static const https://api.esv.org/v3/passage/text/';

  const RemoteAPIDataSource({
    required http.Client client,
  }) : super(client: client);

  Future<Map<dynamic, dynamic>?> rawPassageText(String queryPassage);

  Future<String?> getPassageText(String queryPassage);
}
