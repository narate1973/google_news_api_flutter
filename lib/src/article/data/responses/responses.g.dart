// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleResponseImpl _$$ArticleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ArticleResponseImpl(
      status: json['status'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => ArticleItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ArticleResponseImplToJson(
        _$ArticleResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'items': instance.items,
    };

_$ArticleItemImpl _$$ArticleItemImplFromJson(Map<String, dynamic> json) =>
    _$ArticleItemImpl(
      title: json['title'] as String,
      snippet: json['snippet'] as String,
      publisher: json['publisher'] as String,
      timestamp: json['timestamp'] as String,
      newsUrl: json['newsUrl'] as String,
      images: json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ArticleItemImplToJson(_$ArticleItemImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'snippet': instance.snippet,
      'publisher': instance.publisher,
      'timestamp': instance.timestamp,
      'newsUrl': instance.newsUrl,
      'images': instance.images,
    };

_$ImagesImpl _$$ImagesImplFromJson(Map<String, dynamic> json) => _$ImagesImpl(
      thumbnail: json['thumbnail'] as String,
      thumbnailProxied: json['thumbnailProxied'] as String,
    );

Map<String, dynamic> _$$ImagesImplToJson(_$ImagesImpl instance) =>
    <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'thumbnailProxied': instance.thumbnailProxied,
    };
