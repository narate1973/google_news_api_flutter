part of 'article_store.dart';

sealed class ArticleEvent extends AppEvent {
  const ArticleEvent();
}

class ArticleInitialized extends ArticleEvent {
  const ArticleInitialized();

  @override
  List<Object?> get props => [];
}

class ArticleFetched extends ArticleEvent {
  final String categorySlug;

  const ArticleFetched(this.categorySlug);

  @override
  List<Object?> get props => [categorySlug];
}

class ArticleFavoriteToggled extends ArticleEvent {
  final ArticleItem article;

  const ArticleFavoriteToggled(this.article);

  @override
  List<Object?> get props => [article];
}