import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_swipe_tutorial/flutter_swipe_tutorial.dart';
import 'package:google_new_api_test/core/app_shared_preference.dart';
import 'package:google_new_api_test/core/app_store.dart';
import 'package:google_new_api_test/core/components/app_network_image.dart';
import 'package:google_new_api_test/src/article/article_store/article_store.dart';
import 'package:google_new_api_test/src/article/data/responses/responses.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ArticleDetailPage extends HookConsumerWidget {
  final List<ArticleItem> articles;
  final ArticleItem article;

  const ArticleDetailPage({
    super.key,
    required this.articles,
    required this.article,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController(initialPage: articles.indexOf(article));
    final appSharedPreference = ref.watch(appSharedPreferenceProvider);
    final showSwipeTutorial = useState(appSharedPreference.showSwipeTutorial);

    useEffect(() {
      () async {
        if (showSwipeTutorial.value) {
          await Future.delayed(const Duration(seconds: 3));
          await appSharedPreference.setShowSwipeTutorial();
          showSwipeTutorial.value = false;
        }
      } ();
      return null;
    }, []);

    return SwipeTutorial(
      text: 'Swipe to read more articles',
      showTutorial: showSwipeTutorial.value,
      tutorialWidgetAlignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 96),
      child: PageView(
        controller: controller,
        children: articles.map((item) {
          return _ArticleDetailContent(item: item);
        }).toList(),
      ),
    );
  }
}

class _ArticleDetailContent extends AppHookConsumerWidget<ArticleStore, ArticleViewState> {
  final ArticleItem item;

  const _ArticleDetailContent({required this.item});

  @override
  AutoDisposeAppStateNotifierProvider<ArticleStore, ArticleViewState> get stateNotifierProvider => articleStoreProvider;

  @override
  Widget buildWidget(BuildContext context, WidgetRef ref, ArticleViewState state, StoreDispatch dispatch) {
    final articleViewState = ref.watch(articleStoreProvider);
    final isFavorite = articleViewState.favoriteArticle.any((element) => element == item);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _TopSection(
              imageUrl: item.images?.thumbnail,
              isFavorite: isFavorite,
              onFavoritePressed: () async {
                HapticFeedback.mediumImpact();
                await dispatch(ArticleFavoriteToggled(item));
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    DateFormat('dd/MM/yyyy').format(
                      DateTime.fromMillisecondsSinceEpoch(int.parse(item.timestamp)),
                    ),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  Text(
                    item.snippet,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopSection extends StatelessWidget {
  final String? imageUrl;
  final VoidCallback onFavoritePressed;
  final bool isFavorite;

  const _TopSection({
    required this.onFavoritePressed,
    required this.imageUrl,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppNetworkImage(imageUrl: imageUrl),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: IconButton(
              onPressed: onFavoritePressed,
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.fromBorderSide(BorderSide(color: Colors.black)),
                ),
                child: _FavoriteButton(isFavorite: isFavorite),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  final bool isFavorite;

  const _FavoriteButton({
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    if (isFavorite) {
      const Icon(
        Icons.favorite,
        color: Colors.red,
      );
    }
    return const Icon(
      Icons.favorite_border,
      color: Colors.black,
    );
  }
}
