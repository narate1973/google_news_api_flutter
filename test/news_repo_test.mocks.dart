// Mocks generated by Mockito 5.4.4 from annotations
// in google_new_api_test/test/news_repo_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:google_new_api_test/core/app_http_client.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [AppHttpClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppHttpClient extends _i1.Mock implements _i2.AppHttpClient {
  @override
  _i3.Future<String> get({
    String? baseUrl,
    required String? path,
    Map<String, dynamic>? query,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [],
          {
            #baseUrl: baseUrl,
            #path: path,
            #query: query,
          },
        ),
        returnValue: _i3.Future<String>.value(_i4.dummyValue<String>(
          this,
          Invocation.method(
            #get,
            [],
            {
              #baseUrl: baseUrl,
              #path: path,
              #query: query,
            },
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<String>.value(_i4.dummyValue<String>(
          this,
          Invocation.method(
            #get,
            [],
            {
              #baseUrl: baseUrl,
              #path: path,
              #query: query,
            },
          ),
        )),
      ) as _i3.Future<String>);

  @override
  _i3.Future<String> delete({
    String? baseUrl,
    required String? path,
    dynamic body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [],
          {
            #baseUrl: baseUrl,
            #path: path,
            #body: body,
            #query: query,
            #headers: headers,
          },
        ),
        returnValue: _i3.Future<String>.value(_i4.dummyValue<String>(
          this,
          Invocation.method(
            #delete,
            [],
            {
              #baseUrl: baseUrl,
              #path: path,
              #body: body,
              #query: query,
              #headers: headers,
            },
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<String>.value(_i4.dummyValue<String>(
          this,
          Invocation.method(
            #delete,
            [],
            {
              #baseUrl: baseUrl,
              #path: path,
              #body: body,
              #query: query,
              #headers: headers,
            },
          ),
        )),
      ) as _i3.Future<String>);

  @override
  _i3.Future<String> post({
    String? baseUrl,
    required String? path,
    dynamic body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [],
          {
            #baseUrl: baseUrl,
            #path: path,
            #body: body,
            #query: query,
            #headers: headers,
          },
        ),
        returnValue: _i3.Future<String>.value(_i4.dummyValue<String>(
          this,
          Invocation.method(
            #post,
            [],
            {
              #baseUrl: baseUrl,
              #path: path,
              #body: body,
              #query: query,
              #headers: headers,
            },
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<String>.value(_i4.dummyValue<String>(
          this,
          Invocation.method(
            #post,
            [],
            {
              #baseUrl: baseUrl,
              #path: path,
              #body: body,
              #query: query,
              #headers: headers,
            },
          ),
        )),
      ) as _i3.Future<String>);

  @override
  _i3.Future<String> patch({
    String? baseUrl,
    required String? path,
    dynamic body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [],
          {
            #baseUrl: baseUrl,
            #path: path,
            #body: body,
            #query: query,
            #headers: headers,
          },
        ),
        returnValue: _i3.Future<String>.value(_i4.dummyValue<String>(
          this,
          Invocation.method(
            #patch,
            [],
            {
              #baseUrl: baseUrl,
              #path: path,
              #body: body,
              #query: query,
              #headers: headers,
            },
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<String>.value(_i4.dummyValue<String>(
          this,
          Invocation.method(
            #patch,
            [],
            {
              #baseUrl: baseUrl,
              #path: path,
              #body: body,
              #query: query,
              #headers: headers,
            },
          ),
        )),
      ) as _i3.Future<String>);
}
