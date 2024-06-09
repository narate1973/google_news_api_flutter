import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_new_api_test/news_repo.dart';
import 'package:google_new_api_test/responses/responses.dart';
import 'package:google_new_api_test/utils/app_shared_preference.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'article_viewState.dart';

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

final articleStoreProvider = StateNotifierProvider<ArticleStore, ArticleViewState>((ref) {
  return ArticleStore(
    newsRepo: ref.watch(newsRepoProvider),
    appSharedPreference: ref.watch(appSharedPreferenceProvider),
  );
});

class ArticleStore extends StateNotifier<ArticleViewState> {
  final NewsRepo newsRepo;
  final AppSharedPreference appSharedPreference;

  ArticleStore({
    required this.newsRepo,
    required this.appSharedPreference,
  }) : super(const ArticleViewState());

  Future<void> init() async {
    final favoriteArticle = appSharedPreference.favoriteArticle;
    final cachedArticles = appSharedPreference.cachedArticles;
    state = state.copyWith(
      favoriteArticle: favoriteArticle,
      articleCategories: _categories,
      articleMap: cachedArticles,
    );
    try {
      final articles = await newsRepo.getNews(category: _categories[0]);
      final newArticles = Map<String, List<ArticleItem>?>.from(state.articleMap)..[_categories[0]] = articles.items;
      state = state.copyWith(articleMap: newArticles);
      await appSharedPreference.setCachedArticles(state.articleMap);
    } catch (e, s) {}
  }

  Future<void> fetchArticle({required String categorySlug}) async {
    final articles = await newsRepo.getNews(category: categorySlug);
    final newArticles = Map<String, List<ArticleItem>?>.from(state.articleMap)..[categorySlug] = articles.items;

    state = state.copyWith(articleMap: newArticles);
    await appSharedPreference.setCachedArticles(state.articleMap);
  }

  Future<void> toggleFavorite(ArticleItem item) async {
    try {
      final favoriteArticle = state.favoriteArticle.toList();
      if (favoriteArticle.contains(item)) {
        favoriteArticle.remove(item);
      } else {
        favoriteArticle.add(item);
      }
      await appSharedPreference.setFavoriteArticle(favoriteArticle);
      state = state.copyWith(favoriteArticle: favoriteArticle);
    } catch (e, s) {
      print(e);
    }
  }
}
