import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:google_new_api_test/core/app_dart_define.dart';
import 'package:google_new_api_test/core/app_http_client.dart';
import 'package:google_new_api_test/core/app_store.dart';
import 'package:google_new_api_test/src/article/data/responses/responses.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final newsRepoProvider = Provider<NewsRepo>((ref) {
  if (AppDartDefine.useMockData) {
    return const _NewsMockRepo();
  }
  return NewsRemoteRepo(ref.watch(appHttpProvider));
});

abstract class NewsRepo {
  const NewsRepo();

  Future<ArticleResponse> getNewsByCategory({required String category});
}

class _NewsMockRepo implements NewsRepo {
  const _NewsMockRepo();

  @override
  Future<ArticleResponse> getNewsByCategory({required String category}) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final response = await rootBundle.loadString('asset/mock_data/${category.toLowerCase()}_data.json');
    return ArticleResponse.fromJson(jsonDecode(response));
  }
}

class NewsRemoteRepo implements NewsRepo {
  final AppHttpClient appHttpClient;

  const NewsRemoteRepo(
    this.appHttpClient,
  );

  @override
  Future<ArticleResponse> getNewsByCategory({required String category}) async {
    try {
      final response = await appHttpClient.get(path: '/${category.toLowerCase()}', query: {'lr': 'en-US'});
      return ArticleResponse.fromJson(jsonDecode(response));
    } catch (e) {
      if (e is HttpException) {
        final message = jsonDecode(e.message)['message'] as String?;
        if (message?.contains('exceeded') == true) {
          throw const AppExceptions('API limit exceeded, please review your plan');
        }

        if (message != null) {
          throw AppExceptions(message);
        }
        rethrow;
      }
      rethrow;
    }
  }
}
