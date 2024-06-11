part of 'article_store.dart';

sealed class ArticleEvent extends AppEvent {
  const ArticleEvent();
}

class ArticleInitialized extends ArticleEvent {
  const ArticleInitialized();

  @override
  List<Object?> get props => [];
}

class ArticleFetchedByCategory extends ArticleEvent {
  final String categorySlug;

  const ArticleFetchedByCategory(this.categorySlug);

  @override
  List<Object?> get props => [categorySlug];
}

class ArticleFavoriteToggled extends ArticleEvent {
  final ArticleItem article;

  const ArticleFavoriteToggled(this.article);

  @override
  List<Object?> get props => [article];
}