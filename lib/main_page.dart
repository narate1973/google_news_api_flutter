import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_new_api_test/article_list_tab.dart';
import 'package:google_new_api_test/article_store/article_store.dart';
import 'package:google_new_api_test/components/animated_fade_index_stack.dart';
import 'package:google_new_api_test/favorite_article_list_tab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainPage extends HookConsumerWidget {
  final ValueNotifier<ThemeMode> themeNotifier;
  final ValueNotifier<Color> seedColor;

  const MainPage({
    super.key,
    required this.themeNotifier,
    required this.seedColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleStore = ref.watch(articleStoreProvider.notifier);
    final articleViewState = ref.watch(articleStoreProvider);
    final categories = articleViewState.articleCategories;
    final pageIndex = useState(0);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await articleStore.init();
      });
      return null;
    }, []);

    if (categories.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: AnimatedFadeIndexedStack(
        duration: const Duration(milliseconds: 300),
        index: pageIndex.value,
        children: [
          ArticleListTab(themeNotifier: themeNotifier, seedColor: seedColor),
          FavoriteArticleListTab(
            onBrowseArticle: () {
              pageIndex.value = 0;
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        currentIndex: pageIndex.value,
        onTap: (index) {
          pageIndex.value = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books_rounded),
            label: 'news',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'favorites',
          ),
        ],
      ),
    );
  }
}
