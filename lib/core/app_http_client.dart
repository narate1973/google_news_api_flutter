import 'dart:convert';
import 'dart:io';
import 'package:google_new_api_test/core/app_dart_define.dart';
import 'package:google_new_api_test/core/app_shared_preference.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final appHttpProvider = Provider(
  (ref) => _AppHttpClientImpl(
    appSharedPreference: ref.watch(appSharedPreferenceProvider),
  ),
);

class LocalHttpsOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

abstract class AppHttpClient {
  Future<String> get({
    String? baseUrl,
    required String path,
    Map<String, dynamic>? query,
  });

  Future<String> delete({
    String? baseUrl,
    required String path,
    dynamic body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  });

  Future<String> post({
    String? baseUrl,
    required String path,
    dynamic body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  });

  Future<String> patch({
    String? baseUrl,
    required String path,
    dynamic body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  });
}

class _AppHttpClientImpl implements AppHttpClient {
  final AppSharedPreference appSharedPreference;

  static final Map<String, String> _baseHeader = {
    HttpHeaders.contentTypeHeader: 'application/json',
    'User-Agent': 'Mozilla/5.1',
    'x-rapidapi-host': 'google-news13.p.rapidapi.com',
    'x-rapidapi-key': AppDartDefine.rapidApiKey,
  };

  _AppHttpClientImpl({required this.appSharedPreference});

  Map<String, String> buildHeader([Map<String, String>? addOn]) {
    return Map<String, String>.from(_baseHeader)..addAll(addOn ?? {});
  }

  @override
  Future<String> get({
    String? baseUrl,
    required String path,
    Map<String, dynamic>? query,
  }) async {
    final url = baseUrl ?? AppDartDefine.googleNewsDomain;
    final uri = Uri.https(url, path, query);

    final request = http.Request('GET', uri);
    request.headers.addAll(buildHeader());
    final response = await request.send();
    return _handleResponse(response);
  }

  @override
  Future<String> delete({
    String? baseUrl,
    required String path,
    dynamic body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  }) async {
    headers = buildHeader(headers);
    final url = baseUrl ?? AppDartDefine.googleNewsDomain;
    final uri = Uri.https(url, path, query);
    body = () {
      if (body is Map<String, dynamic>) {
        return jsonEncode(body);
      }
      return body;
    }();
    final response = await http.delete(
      uri,
      body: body,
      headers: headers,
    );

    return _handleImageResponse(response);
  }

  @override
  Future<String> post({
    String? baseUrl,
    required String path,
    dynamic body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  }) async {
    headers = buildHeader(headers);
    final url = baseUrl ?? AppDartDefine.googleNewsDomain;
    final uri = Uri.https(url, path, query);
    body = () {
      if (body is Map<String, dynamic>) {
        return jsonEncode(body);
      }
      return body;
    }();
    final response = await http.post(
      uri,
      body: body,
      headers: headers,
    );

    return _handleImageResponse(response);
  }

  @override
  Future<String> patch({
    String? baseUrl,
    required String path,
    dynamic body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  }) async {
    final url = baseUrl ?? AppDartDefine.googleNewsDomain;
    final uri = Uri.https(url, path, query);
    final request = http.Request('PATCH', uri);
    request.body = () {
      if (body is Map<String, dynamic>) {
        return json.encode(body);
      }
      return body;
    }();
    request.headers.addAll(buildHeader(headers));
    final response = await request.send();
    return _handleResponse(response);
  }

  Future<String> _handleImageResponse(http.Response response) async {
    final data = response.body;
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
