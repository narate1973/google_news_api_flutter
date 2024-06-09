import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_new_api_test/article_detail_page.dart';
import 'package:google_new_api_test/article_store/article_store.dart';
import 'package:google_new_api_test/components/article_card.dart';
import 'package:google_new_api_test/components/setting_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticleListTab extends HookConsumerWidget {
  final ValueNotifier<ThemeMode> themeNotifier;
  final ValueNotifier<Color> seedColor;

  const ArticleListTab({
    super.key,
    required this.themeNotifier,
    required this.seedColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleStore = ref.watch(articleStoreProvider.notifier);
    final articleViewState = ref.watch(articleStoreProvider);
    final categories = articleViewState.articleCategories;
    final tabController = useTabController(initialLength: categories.length);

    useEffect(() {
      tabController.addListener(() async {
        await articleStore.fetchArticle(categorySlug: categories[tabController.index]);
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
            final article = articleViewState.articleMap[category];
            if (article?.isNotEmpty == true) {
              final response = article!;

              return HookBuilder(builder: (context) {
                final scrollController = useScrollController();

                return ListView.builder(
                  controller: scrollController,
                  padding: EdgeInsets.zero,
                  itemCount: response.length,
                  itemBuilder: (context, index) {
                    final item = response[index];

                    return ArticleCard(
                      item: item,
                      openBuilder: (context, VoidCallback onOpen) {
                        return ArticlePageView(
                          key: ValueKey(item.timestamp),
                          article: item,
                          articles: response,
                          scrollController: scrollController,
                        );
                      },
                    );
                  },
                );
              });
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
