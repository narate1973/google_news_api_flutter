import 'package:flutter/material.dart';
import 'package:google_new_api_test/article_detail_page.dart';
import 'package:google_new_api_test/article_store/article_store.dart';
import 'package:google_new_api_test/components/article_card.dart';
import 'package:google_new_api_test/main_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteArticleListTab extends HookConsumerWidget {
  const FavoriteArticleListTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainPageIndexValueNotifier = ref.watch(mainPageIndexValueNotifierProvider);
    final articleViewState = ref.watch(articleStoreProvider);
    final favoriteArticle = articleViewState.favoriteArticle;

    return NestedScrollView(
      headerSliverBuilder: (context, _) {
        return <Widget>[
          SliverAppBar(
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: false,
            title: Text(
              'Favorite Articles',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            floating: true,
            pinned: true,
            snap: true,
            elevation: 0,
            centerTitle: false,
          ),
        ];
      },
      body: Builder(builder: (context) {
        if (favoriteArticle.isEmpty) {
          return Center(
            child: OutlinedButton(
              onPressed: () {
                mainPageIndexValueNotifier.value = 0;
              },
              child: Text(
                'Browse articles',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: favoriteArticle.length,
          itemBuilder: (context, index) {
            final article = favoriteArticle[index];
            return ArticleCard(
              item: article,
              openBuilder: (context, onTap) {
                return ArticlePageView(
                  articles: favoriteArticle,
                  article: article,
                );
              },
            );
          },
        );
      }),
    );
  }
}
