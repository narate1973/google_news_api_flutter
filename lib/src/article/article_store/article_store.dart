import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_new_api_test/core/app_store.dart';
import 'package:google_new_api_test/src/article/data/news_repo.dart';
import 'package:google_new_api_test/core/app_shared_preference.dart';
import 'package:google_new_api_test/src/article/data/responses/responses.dart';

part 'article_viewState.dart';

part 'article_event.dart';

part 'article_store.freezed.dart';

const _categories = [
  'Latest',
  'Entertainment',
  'World',
  'Business',
  'Health',
  'Sport',
  'Science',
  'Technology',
];

final articleStoreProvider = AutoDisposeAppStateNotifierProvider<ArticleStore, ArticleViewState>((ref) {
  return ArticleStore(
    newsRepo: ref.watch(newsRepoProvider),
    appSharedPreference: ref.watch(appSharedPreferenceProvider),
  );
});

class ArticleStore extends AppStateNotifier<ArticleEvent, ArticleViewState> {
  final NewsRepo newsRepo;
  final AppSharedPreference appSharedPreference;

  ArticleStore({
    required this.newsRepo,
    required this.appSharedPreference,
  }) : super(const ArticleViewState());

  @override
  AppStateNotifierResult mapIntentToState(ArticleEvent intent) async {
    switch (intent) {
      case ArticleInitialized():
        final cachedFavoriteArticle = appSharedPreference.favoriteArticle;
        final cachedArticles = appSharedPreference.cachedArticles;
        state = state.copyWith(
          favoriteArticle: cachedFavoriteArticle,
          articleCategories: _categories,
          articleMap: cachedArticles,
        );
        final articles = await newsRepo.getNewsByCategory(category: _categories[0]);
        final newArticles = Map<String, List<ArticleItem>?>.from(state.articleMap)..[_categories[0]] = articles.items;
        state = state.copyWith(articleMap: newArticles);
        await appSharedPreference.setCachedArticles(state.articleMap);
        break;

      case ArticleFetchedByCategory():
        final articles = await newsRepo.getNewsByCategory(category: intent.categorySlug);
        final newArticles = Map<String, List<ArticleItem>?>.from(state.articleMap)
          ..[intent.categorySlug] = articles.items;
        state = state.copyWith(articleMap: newArticles);
        await appSharedPreference.setCachedArticles(state.articleMap);
        break;

      case ArticleFavoriteToggled():
        final favoriteArticle = state.favoriteArticle.toList();
        if (favoriteArticle.contains(intent.article)) {
          favoriteArticle.remove(intent.article);
        } else {
          favoriteArticle.add(intent.article);
        }
        await appSharedPreference.setFavoriteArticle(favoriteArticle);
        state = state.copyWith(favoriteArticle: favoriteArticle);
        break;
    }
  }
}
