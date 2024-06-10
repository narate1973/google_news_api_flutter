import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'responses.freezed.dart';
part 'responses.g.dart';

ArticleResponse articleResponseFromJson(String str) => ArticleResponse.fromJson(json.decode(str));

String articleResponseToJson(ArticleResponse data) => json.encode(data.toJson());

@freezed
class ArticleResponse with _$ArticleResponse {
  const factory ArticleResponse({
    required String status,
    required List<ArticleItem> items,
  }) = _ArticleResponse;

  factory ArticleResponse.fromJson(Map<String, dynamic> json) => _$ArticleResponseFromJson(json);
}

@freezed
class ArticleItem with _$ArticleItem {
  const factory ArticleItem({
    required String title,
    required String snippet,
    required String publisher,
    required String timestamp,
    required String newsUrl,
    required Images? images,
    // required bool hasSubnews,
    // required List<Item> subnews,
  }) = _ArticleItem;

  factory ArticleItem.fromJson(Map<String, dynamic> json) => _$ArticleItemFromJson(json);
}

@freezed
class Images with _$Images {
  const factory Images({
    required String thumbnail,
    required String thumbnailProxied,
  }) = _Images;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}
