// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ArticleViewState {
  List<String> get articleCategories => throw _privateConstructorUsedError;
  Map<String, List<ArticleItem>?> get articleMap =>
      throw _privateConstructorUsedError;
  List<ArticleItem> get favoriteArticle => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleViewStateCopyWith<ArticleViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleViewStateCopyWith<$Res> {
  factory $ArticleViewStateCopyWith(
          ArticleViewState value, $Res Function(ArticleViewState) then) =
      _$ArticleViewStateCopyWithImpl<$Res, ArticleViewState>;
  @useResult
  $Res call(
      {List<String> articleCategories,
      Map<String, List<ArticleItem>?> articleMap,
      List<ArticleItem> favoriteArticle});
}

/// @nodoc
class _$ArticleViewStateCopyWithImpl<$Res, $Val extends ArticleViewState>
    implements $ArticleViewStateCopyWith<$Res> {
  _$ArticleViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleCategories = null,
    Object? articleMap = null,
    Object? favoriteArticle = null,
  }) {
    return _then(_value.copyWith(
      articleCategories: null == articleCategories
          ? _value.articleCategories
          : articleCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      articleMap: null == articleMap
          ? _value.articleMap
          : articleMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ArticleItem>?>,
      favoriteArticle: null == favoriteArticle
          ? _value.favoriteArticle
          : favoriteArticle // ignore: cast_nullable_to_non_nullable
              as List<ArticleItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticleViewStateImplCopyWith<$Res>
    implements $ArticleViewStateCopyWith<$Res> {
  factory _$$ArticleViewStateImplCopyWith(_$ArticleViewStateImpl value,
          $Res Function(_$ArticleViewStateImpl) then) =
      __$$ArticleViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> articleCategories,
      Map<String, List<ArticleItem>?> articleMap,
      List<ArticleItem> favoriteArticle});
}

/// @nodoc
class __$$ArticleViewStateImplCopyWithImpl<$Res>
    extends _$ArticleViewStateCopyWithImpl<$Res, _$ArticleViewStateImpl>
    implements _$$ArticleViewStateImplCopyWith<$Res> {
  __$$ArticleViewStateImplCopyWithImpl(_$ArticleViewStateImpl _value,
      $Res Function(_$ArticleViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleCategories = null,
    Object? articleMap = null,
    Object? favoriteArticle = null,
  }) {
    return _then(_$ArticleViewStateImpl(
      articleCategories: null == articleCategories
          ? _value._articleCategories
          : articleCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      articleMap: null == articleMap
          ? _value._articleMap
          : articleMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ArticleItem>?>,
      favoriteArticle: null == favoriteArticle
          ? _value._favoriteArticle
          : favoriteArticle // ignore: cast_nullable_to_non_nullable
              as List<ArticleItem>,
    ));
  }
}

/// @nodoc

class _$ArticleViewStateImpl extends _ArticleViewState {
  const _$ArticleViewStateImpl(
      {final List<String> articleCategories = const [],
      final Map<String, List<ArticleItem>?> articleMap = const {},
      final List<ArticleItem> favoriteArticle = const []})
      : _articleCategories = articleCategories,
        _articleMap = articleMap,
        _favoriteArticle = favoriteArticle,
        super._();

  final List<String> _articleCategories;
  @override
  @JsonKey()
  List<String> get articleCategories {
    if (_articleCategories is EqualUnmodifiableListView)
      return _articleCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articleCategories);
  }

  final Map<String, List<ArticleItem>?> _articleMap;
  @override
  @JsonKey()
  Map<String, List<ArticleItem>?> get articleMap {
    if (_articleMap is EqualUnmodifiableMapView) return _articleMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_articleMap);
  }

  final List<ArticleItem> _favoriteArticle;
  @override
  @JsonKey()
  List<ArticleItem> get favoriteArticle {
    if (_favoriteArticle is EqualUnmodifiableListView) return _favoriteArticle;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteArticle);
  }

  @override
  String toString() {
    return 'ArticleViewState(articleCategories: $articleCategories, articleMap: $articleMap, favoriteArticle: $favoriteArticle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleViewStateImpl &&
            const DeepCollectionEquality()
                .equals(other._articleCategories, _articleCategories) &&
            const DeepCollectionEquality()
                .equals(other._articleMap, _articleMap) &&
            const DeepCollectionEquality()
                .equals(other._favoriteArticle, _favoriteArticle));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_articleCategories),
      const DeepCollectionEquality().hash(_articleMap),
      const DeepCollectionEquality().hash(_favoriteArticle));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleViewStateImplCopyWith<_$ArticleViewStateImpl> get copyWith =>
      __$$ArticleViewStateImplCopyWithImpl<_$ArticleViewStateImpl>(
          this, _$identity);
}

abstract class _ArticleViewState extends ArticleViewState {
  const factory _ArticleViewState(
      {final List<String> articleCategories,
      final Map<String, List<ArticleItem>?> articleMap,
      final List<ArticleItem> favoriteArticle}) = _$ArticleViewStateImpl;
  const _ArticleViewState._() : super._();

  @override
  List<String> get articleCategories;
  @override
  Map<String, List<ArticleItem>?> get articleMap;
  @override
  List<ArticleItem> get favoriteArticle;
  @override
  @JsonKey(ignore: true)
  _$$ArticleViewStateImplCopyWith<_$ArticleViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
