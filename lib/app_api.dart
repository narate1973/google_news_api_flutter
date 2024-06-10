import 'dart:io';
import 'package:google_new_api_test/src/article/data/responses/responses.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final appApiProvider = Provider<AppApi>((ref) {
  return _AppApiImpl();
});

abstract class AppApi {
  Future<ArticleResponse> getNews({required String category});
}

class _AppApiImpl implements AppApi {
  @override
  Future<ArticleResponse> getNews({required String category}) async {
    final uri = Uri.https('google-news13.p.rapidapi.com', '/${category.toLowerCase()}', {'lr': 'en-US'});
    final request = http.Request('GET', uri);
    request.headers.addAll({
      'User-Agent': 'Mozilla/5.1',
      'x-rapidapi-host': 'google-news13.p.rapidapi.com',
      'x-rapidapi-key': 'd090948b5cmshcfbab20c3ff3f93p11ed25jsne768051e2aff',
    });
    final response = await request.send();
    return _handleResponse(response).then(articleResponseFromJson);
  }

  Future<String> _handleResponse(http.StreamedResponse response) async {
    final data = await response.stream.bytesToString();
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else if (response.statusCode >= 300 && response.statusCode < 400) {
      throw HttpException(
        data,
        uri: response.request?.url,
      );
    } else {
      throw HttpException(
        data,
        uri: response.request?.url,
      );
    }
  }
}

