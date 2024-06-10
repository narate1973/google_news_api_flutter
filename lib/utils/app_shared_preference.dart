import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_new_api_test/responses/responses.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appSharedPreferenceProvider = Provider<AppSharedPreference>((ref) {
  return AppSharedPreference();
});

class AppSharedPreference extends AppSharedPreferenceBase {
  AppSharedPreference() : super();

  Map<String, List<ArticleItem>?> get cachedArticles {
    final articlesJson = getString('articles');
    if (articlesJson == null) {
      return {};
    }
    final articles = (jsonDecode(articlesJson) as Map<String, dynamic>).map((key, value) {
      return MapEntry(key, (value as List<dynamic>).map((value) => ArticleItem.fromJson(value as Map<String, dynamic>)).toList());
    });
    return articles;
  }

  Future<void> setCachedArticles(Map<String, List<ArticleItem>?> articlesMap) async {
    final articlesJson = articlesMap.map((key, article) {
      return MapEntry(key, article?.map((value) => value.toJson()).toList());
    });
    return await setString('articles', value: jsonEncode(articlesJson));
  }

  List<ArticleItem> get favoriteArticle {
    final articlesJson = getString('favorite_articles');
    if (articlesJson == null) {
      return [];
    }
    final articles =
        List<ArticleItem>.from((jsonDecode(articlesJson)['articles'] as List).map((e) {
      return ArticleItem.fromJson(e);
    }).toList());
    return articles;
  }

  Future<void> setFavoriteArticle(List<ArticleItem> articles) async {
    final articlesJson = {
      'articles': articles.map((e) => e.toJson()).toList(),
    };
    return await setString('favorite_articles', value: jsonEncode(articlesJson));
  }
}

abstract class AppSharedPreferenceBase {
  static final _storage = Platform.isAndroid
      ? const FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true))
      : const FlutterSecureStorage();

  Map<String, String> _cachedPreference = {};

  Future<void> reload() async {
    _cachedPreference = await _storage.readAll();
  }

  AppSharedPreferenceBase();

  String? getString(String key, {String? defaultValue}) {
    return _cachedPreference[key] ?? defaultValue;
  }

  bool? getBool(String key, {bool? defaultValue}) {
    final String? value = _cachedPreference[key];
    if (value == null) {
      return defaultValue;
    }
    return value == 'true' ? true : false;
  }

  int? getInt(String key, {int? defaultValue}) {
    final value = _cachedPreference[key];
    return int.tryParse(value ?? '0') ?? defaultValue;
  }

  double? getDouble(String key, {double? defaultValue}) {
    final value = _cachedPreference[key];
    return double.tryParse(value ?? '0.0') ?? defaultValue;
  }

  Future<void> setString(String key, {required String? value}) async {
    if (value == null) {
      _cachedPreference.remove(key);
      return await _storage.delete(key: key);
    }
    _cachedPreference[key] = value;
    return await _storage.write(key: key, value: value);
  }

  Future<void> setInt(String key, {required int? value}) async {
    if (value == null) {
      _cachedPreference.remove(key);
      return await _storage.delete(key: key);
    }
    _cachedPreference[key] = value.toString();
    return await _storage.write(key: key, value: value.toString());
  }

  Future<void> setDouble(String key, {required double? value}) async {
    if (value == null) {
      _cachedPreference.remove(key);
      return await _storage.delete(key: key);
    }
    _cachedPreference[key] = value.toString();
    return await _storage.write(key: key, value: value.toString());
  }

  Future<void> setBool(String key, {required bool? value}) async {
    if (value == null) {
      _cachedPreference.remove(key);
      return await _storage.delete(key: key);
    }
    _cachedPreference[key] = value.toString();
    return await _storage.write(key: key, value: value.toString());
  }
}
