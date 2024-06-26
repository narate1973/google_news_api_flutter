import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_new_api_test/core/app_store.dart';
import 'package:google_new_api_test/src/article/article_detail_page.dart';
import 'package:google_new_api_test/src/article/article_store/article_store.dart';
import 'package:google_new_api_test/src/article/widget/article_card.dart';
import 'package:google_new_api_test/core/components/setting_dialog.dart';
import 'package:google_new_api_test/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticleListTabPage extends AppHookConsumerWidget<ArticleStore, ArticleViewState> {
  const ArticleListTabPage({super.key});

  @override
  AutoDisposeAppStateNotifierProvider<ArticleStore, ArticleViewState> get stateNotifierProvider => articleStoreProvider;

  @override
  Widget buildWidget(
    BuildContext context,
    WidgetRef ref,
    ArticleViewState state,
    StoreDispatch dispatch,
  ) {
    final themeNotifier = ref.watch(themeValueNotifierProvider);
    final seedColor = ref.watch(seedColorValueNotifierProvider);
    final categories = state.articleCategories;
    final tabController = useTabController(initialLength: categories.length);

    useEffect(() {
      tabController.addListener(() async {
        await dispatch(ArticleFetchedByCategory(categories[tabController.index]));
      });
      return null;
    }, []);

    return NestedScrollView(
      headerSliverBuilder: (context, _) {
        return <Widget>[
          SliverAppBar(
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: false,
            title: Text(
              'Articles',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            floating: true,
            pinned: true,
            snap: true,
            elevation: 0,
            centerTitle: false,
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  showSettingDialog(
                    context,
                    themeNotifier: themeNotifier,
                    seedColor: seedColor,
                  );
                },
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 48.0),
              child: TabBar(
                controller: tabController,
                tabAlignment: TabAlignment.start,
                automaticIndicatorColorAdjustment: false,
                labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
                isScrollable: true,
                tabs: List.generate(categories.length, (index) {
                  return Tab(text: categories[index]);
                }),
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: tabController,
        children: List.generate(
          categories.length,
          (index) {
            final category = categories[index];
            final article = state.articleMap[category];
            if (article?.isNotEmpty == true) {
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: article!.length,
                itemBuilder: (context, index) {
                  final item = article[index];

                  return ArticleCard(
                    item: item,
                    openBuilder: (context, VoidCallback onOpen) {
                      return ArticleDetailPage(
                        key: ValueKey(item.timestamp),
                        article: item,
                        articles: article,
                      );
                    },
                  );
                },
              );
            }

            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ArticleCard.skeleton;
              },
            );
          },
        ),
      ),
    );
  }
}

