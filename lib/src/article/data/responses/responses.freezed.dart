// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'responses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArticleResponse _$ArticleResponseFromJson(Map<String, dynamic> json) {
  return _ArticleResponse.fromJson(json);
}

/// @nodoc
mixin _$ArticleResponse {
  String get status => throw _privateConstructorUsedError;
  List<ArticleItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleResponseCopyWith<ArticleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleResponseCopyWith<$Res> {
  factory $ArticleResponseCopyWith(
          ArticleResponse value, $Res Function(ArticleResponse) then) =
      _$ArticleResponseCopyWithImpl<$Res, ArticleResponse>;
  @useResult
  $Res call({String status, List<ArticleItem> items});
}

/// @nodoc
class _$ArticleResponseCopyWithImpl<$Res, $Val extends ArticleResponse>
    implements $ArticleResponseCopyWith<$Res> {
  _$ArticleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ArticleItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticleResponseImplCopyWith<$Res>
    implements $ArticleResponseCopyWith<$Res> {
  factory _$$ArticleResponseImplCopyWith(_$ArticleResponseImpl value,
          $Res Function(_$ArticleResponseImpl) then) =
      __$$ArticleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, List<ArticleItem> items});
}

/// @nodoc
class __$$ArticleResponseImplCopyWithImpl<$Res>
    extends _$ArticleResponseCopyWithImpl<$Res, _$ArticleResponseImpl>
    implements _$$ArticleResponseImplCopyWith<$Res> {
  __$$ArticleResponseImplCopyWithImpl(
      _$ArticleResponseImpl _value, $Res Function(_$ArticleResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? items = null,
  }) {
    return _then(_$ArticleResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ArticleItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticleResponseImpl implements _ArticleResponse {
  const _$ArticleResponseImpl(
      {required this.status, required final List<ArticleItem> items})
      : _items = items;

  factory _$ArticleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleResponseImplFromJson(json);

  @override
  final String status;
  final List<ArticleItem> _items;
  @override
  List<ArticleItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ArticleResponse(status: $status, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleResponseImplCopyWith<_$ArticleResponseImpl> get copyWith =>
      __$$ArticleResponseImplCopyWithImpl<_$ArticleResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleResponseImplToJson(
      this,
    );
  }
}

abstract class _ArticleResponse implements ArticleResponse {
  const factory _ArticleResponse(
      {required final String status,
      required final List<ArticleItem> items}) = _$ArticleResponseImpl;

  factory _ArticleResponse.fromJson(Map<String, dynamic> json) =
      _$ArticleResponseImpl.fromJson;

  @override
  String get status;
  @override
  List<ArticleItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$ArticleResponseImplCopyWith<_$ArticleResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArticleItem _$ArticleItemFromJson(Map<String, dynamic> json) {
  return _ArticleItem.fromJson(json);
}

/// @nodoc
mixin _$ArticleItem {
  String get title => throw _privateConstructorUsedError;
  String get snippet => throw _privateConstructorUsedError;
  String get publisher => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;
  String get newsUrl => throw _privateConstructorUsedError;
  Images? get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleItemCopyWith<ArticleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleItemCopyWith<$Res> {
  factory $ArticleItemCopyWith(
          ArticleItem value, $Res Function(ArticleItem) then) =
      _$ArticleItemCopyWithImpl<$Res, ArticleItem>;
  @useResult
  $Res call(
      {String title,
      String snippet,
      String publisher,
      String timestamp,
      String newsUrl,
      Images? images});

  $ImagesCopyWith<$Res>? get images;
}

/// @nodoc
class _$ArticleItemCopyWithImpl<$Res, $Val extends ArticleItem>
    implements $ArticleItemCopyWith<$Res> {
  _$ArticleItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? snippet = null,
    Object? publisher = null,
    Object? timestamp = null,
    Object? newsUrl = null,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      snippet: null == snippet
          ? _value.snippet
          : snippet // ignore: cast_nullable_to_non_nullable
              as String,
      publisher: null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      newsUrl: null == newsUrl
          ? _value.newsUrl
          : newsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as Images?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImagesCopyWith<$Res>? get images {
    if (_value.images == null) {
      return null;
    }

    return $ImagesCopyWith<$Res>(_value.images!, (value) {
      return _then(_value.copyWith(images: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArticleItemImplCopyWith<$Res>
    implements $ArticleItemCopyWith<$Res> {
  factory _$$ArticleItemImplCopyWith(
          _$ArticleItemImpl value, $Res Function(_$ArticleItemImpl) then) =
      __$$ArticleItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String snippet,
      String publisher,
      String timestamp,
      String newsUrl,
      Images? images});

  @override
  $ImagesCopyWith<$Res>? get images;
}

/// @nodoc
class __$$ArticleItemImplCopyWithImpl<$Res>
    extends _$ArticleItemCopyWithImpl<$Res, _$ArticleItemImpl>
    implements _$$ArticleItemImplCopyWith<$Res> {
  __$$ArticleItemImplCopyWithImpl(
      _$ArticleItemImpl _value, $Res Function(_$ArticleItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? snippet = null,
    Object? publisher = null,
    Object? timestamp = null,
    Object? newsUrl = null,
    Object? images = freezed,
  }) {
    return _then(_$ArticleItemImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      snippet: null == snippet
          ? _value.snippet
          : snippet // ignore: cast_nullable_to_non_nullable
              as String,
      publisher: null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      newsUrl: null == newsUrl
          ? _value.newsUrl
          : newsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as Images?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticleItemImpl implements _ArticleItem {
  const _$ArticleItemImpl(
      {required this.title,
      required this.snippet,
      required this.publisher,
      required this.timestamp,
      required this.newsUrl,
      required this.images});

  factory _$ArticleItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleItemImplFromJson(json);

  @override
  final String title;
  @override
  final String snippet;
  @override
  final String publisher;
  @override
  final String timestamp;
  @override
  final String newsUrl;
  @override
  final Images? images;

  @override
  String toString() {
    return 'ArticleItem(title: $title, snippet: $snippet, publisher: $publisher, timestamp: $timestamp, newsUrl: $newsUrl, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleItemImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.snippet, snippet) || other.snippet == snippet) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.newsUrl, newsUrl) || other.newsUrl == newsUrl) &&
            (identical(other.images, images) || other.images == images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, snippet, publisher, timestamp, newsUrl, images);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleItemImplCopyWith<_$ArticleItemImpl> get copyWith =>
      __$$ArticleItemImplCopyWithImpl<_$ArticleItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleItemImplToJson(
      this,
    );
  }
}

abstract class _ArticleItem implements ArticleItem {
  const factory _ArticleItem(
      {required final String title,
      required final String snippet,
      required final String publisher,
      required final String timestamp,
      required final String newsUrl,
      required final Images? images}) = _$ArticleItemImpl;

  factory _ArticleItem.fromJson(Map<String, dynamic> json) =
      _$ArticleItemImpl.fromJson;

  @override
  String get title;
  @override
  String get snippet;
  @override
  String get publisher;
  @override
  String get timestamp;
  @override
  String get newsUrl;
  @override
  Images? get images;
  @override
  @JsonKey(ignore: true)
  _$$ArticleItemImplCopyWith<_$ArticleItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return _Images.fromJson(json);
}

/// @nodoc
mixin _$Images {
  String get thumbnail => throw _privateConstructorUsedError;
  String get thumbnailProxied => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImagesCopyWith<Images> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesCopyWith<$Res> {
  factory $ImagesCopyWith(Images value, $Res Function(Images) then) =
      _$ImagesCopyWithImpl<$Res, Images>;
  @useResult
  $Res call({String thumbnail, String thumbnailProxied});
}

/// @nodoc
class _$ImagesCopyWithImpl<$Res, $Val extends Images>
    implements $ImagesCopyWith<$Res> {
  _$ImagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnail = null,
    Object? thumbnailProxied = null,
  }) {
    return _then(_value.copyWith(
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailProxied: null == thumbnailProxied
          ? _value.thumbnailProxied
          : thumbnailProxied // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImagesImplCopyWith<$Res> implements $ImagesCopyWith<$Res> {
  factory _$$ImagesImplCopyWith(
          _$ImagesImpl value, $Res Function(_$ImagesImpl) then) =
      __$$ImagesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String thumbnail, String thumbnailProxied});
}

/// @nodoc
class __$$ImagesImplCopyWithImpl<$Res>
    extends _$ImagesCopyWithImpl<$Res, _$ImagesImpl>
    implements _$$ImagesImplCopyWith<$Res> {
  __$$ImagesImplCopyWithImpl(
      _$ImagesImpl _value, $Res Function(_$ImagesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnail = null,
    Object? thumbnailProxied = null,
  }) {
    return _then(_$ImagesImpl(
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailProxied: null == thumbnailProxied
          ? _value.thumbnailProxied
          : thumbnailProxied // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImagesImpl implements _Images {
  const _$ImagesImpl({required this.thumbnail, required this.thumbnailProxied});

  factory _$ImagesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImagesImplFromJson(json);

  @override
  final String thumbnail;
  @override
  final String thumbnailProxied;

  @override
  String toString() {
    return 'Images(thumbnail: $thumbnail, thumbnailProxied: $thumbnailProxied)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagesImpl &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.thumbnailProxied, thumbnailProxied) ||
                other.thumbnailProxied == thumbnailProxied));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, thumbnail, thumbnailProxied);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagesImplCopyWith<_$ImagesImpl> get copyWith =>
      __$$ImagesImplCopyWithImpl<_$ImagesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImagesImplToJson(
      this,
    );
  }
}

abstract class _Images implements Images {
  const factory _Images(
      {required final String thumbnail,
      required final String thumbnailProxied}) = _$ImagesImpl;

  factory _Images.fromJson(Map<String, dynamic> json) = _$ImagesImpl.fromJson;

  @override
  String get thumbnail;
  @override
  String get thumbnailProxied;
  @override
  @JsonKey(ignore: true)
  _$$ImagesImplCopyWith<_$ImagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
