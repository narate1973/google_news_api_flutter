import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_new_api_test/core/app_http_client.dart';
import 'package:google_new_api_test/core/app_store.dart';
import 'package:google_new_api_test/src/article/data/news_repo.dart';
import 'package:google_new_api_test/src/article/data/responses/responses.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<AppHttpClient>()])
import 'news_repo_test.mocks.dart';

void main() {
  late MockAppHttpClient mockAppHttpClient;
  late NewsRemoteRepo newsRemoteRepo;

  setUp(() {
    mockAppHttpClient = MockAppHttpClient();
    newsRemoteRepo = NewsRemoteRepo(mockAppHttpClient);
  });

  group('NewsRepo', () {
    final rawResponse = jsonEncode({
      "status": "success",
      "items": [
        {
          "title": "Roaring Kitty's shares GME rally, BTC open interest soars: Hodler's Digest, June 2–8",
          "snippet":
              "GameStop trader Roaring Kitty sees his GME stake rise to  billion, Bitcoin open interest spikes and new U.S. laws target digital assets.",
          "publisher": "Cointelegraph",
          "timestamp": "1717879008000",
          "newsUrl":
              "https://cointelegraph.com/magazine/roaring-kittys-shares-1b-gme-rally-btc-open-interest-soars-hodlers-digest-june-2-8/",
          "images": {
            "thumbnail":
                "https://news.google.com/api/attachments/CC8iK0NnNUdNams1Wm1KS01HNVZTa1ZLVFJDZkF4ampCU2dLTWdhQk1ZakNTZ1E=-w280-h168-p-df-rw",
            "thumbnailProxied":
                "https://i.zedtranslate.com/newsimage/CC8iK0NnNUdNams1Wm1KS01HNVZTa1ZLVFJDZkF4ampCU2dLTWdhQk1ZakNTZ1E"
          },
          "hasSubnews": true,
        },
        {
          "title": "Norwegian wealth fund to vote against Elon Musk's Tesla pay package",
          "snippet":
              "Norway's sovereign wealth fund managed by Norges Bank Investment Management said Saturday it will vote against Elon Musk's hefty CEO compensation package ...",
          "publisher": "ABC News",
          "timestamp": "1717859840000",
          "newsUrl": "https://abcnews.go.com/US/wireStory/norwegian-wealth-fund-vote-elon-musks-tesla-pay-110954403",
          "images": {
            "thumbnail":
                "https://news.google.com/api/attachments/CC8iK0NnNW5TMVJEU1ZSRmFrVmFhR3BRVFJDb0FSaXNBaWdCTWdhbGRZYk1OUVU=-w280-h168-p-df-rw",
            "thumbnailProxied":
                "https://i.zedtranslate.com/newsimage/CC8iK0NnNW5TMVJEU1ZSRmFrVmFhR3BRVFJDb0FSaXNBaWdCTWdhbGRZYk1OUVU"
          },
          "hasSubnews": true
        }
      ]
    });
    final articleResponse = ArticleResponse.fromJson(jsonDecode(rawResponse));

    test('getNewsByCategory', () async {
      when(mockAppHttpClient.get(path: '/business', query: {'lr': 'en-US'})).thenAnswer((_) async => rawResponse);
      final result = await newsRemoteRepo.getNewsByCategory(category: 'Business');
      expect(result, articleResponse);
    });

    test('should throw exceed limit when message contain exceed', () async {
      when(mockAppHttpClient.get(path: '/business', query: {'lr': 'en-US'})).thenThrow(const HttpException(
        '{"message": "API limit exceeded, please review your plan"}',
      ));
      final result = newsRemoteRepo.getNewsByCategory(category: 'Business');
      expect(result, throwsA(const AppExceptions('API limit exceeded, please review your plan')));
    });

    test('should throw api message when message is not about exceed', () async {
      when(mockAppHttpClient.get(path: '/business', query: {'lr': 'en-US'})).thenThrow(const HttpException(
        '{"message": "Too many requests"}',
      ));
      final result = newsRemoteRepo.getNewsByCategory(category: 'Business');
      expect(result, throwsA(isA<AppExceptions>()));
    });
  });
}
