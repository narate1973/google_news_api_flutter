import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:google_new_api_test/responses/responses.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final newsRepoProvider = Provider<NewsRepo>((ref) {
  return const _NewsLocalRepo();
});

abstract class NewsRepo {
  const NewsRepo();

  Future<ArticleResponse> getNews({required String category});
}

class _NewsLocalRepo implements NewsRepo {

  const _NewsLocalRepo();

  @override
  Future<ArticleResponse> getNews({required String category}) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final response = await rootBundle.loadString('asset/mock_data/${category.toLowerCase()}_data.json');
    return ArticleResponse.fromJson(jsonDecode(response));
  }
}

class _NewsRemoteRepo implements NewsRepo {

  _NewsRemoteRepo();

  @override
  Future<ArticleResponse> getNews({required String category}) {
    // TODO: implement getNews
    throw UnimplementedError();
  }
}