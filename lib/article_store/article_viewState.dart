part of 'article_store.dart';

@freezed
class ArticleViewState with _$ArticleViewState {
  const ArticleViewState._();

  const factory ArticleViewState({
    @Default([]) List<String> articleCategories,
    @Default({}) Map<String, List<ArticleItem>?> articleMap,
    @Default([]) List<ArticleItem> favoriteArticle
  }) = _ArticleViewState;
}