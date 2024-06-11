import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_new_api_test/core/app_store.dart';
import 'package:google_new_api_test/src/article/article_store/article_store.dart';
import 'package:google_new_api_test/src/article/article_list_tab_page.dart';
import 'package:google_new_api_test/core/components/animated_fade_index_stack.dart';
import 'package:google_new_api_test/src/article/favorite_article_list_tab_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mainPageIndexValueNotifierProvider = ChangeNotifierProvider.autoDispose<ValueNotifier<int>>((ref) {
  return ValueNotifier(0);
});

class MainPage extends AppHookConsumerWidget<ArticleStore, ArticleViewState> {
  const MainPage({super.key});

  @override
  AutoDisposeAppStateNotifierProvider<ArticleStore, ArticleViewState> get stateNotifierProvider => articleStoreProvider;

  @override
  Widget buildWidget(
    BuildContext context,
    WidgetRef ref,
    ArticleViewState state,
    StoreDispatch dispatch,
  ) {
    final categories = state.articleCategories;
    final pageIndex = ref.watch(mainPageIndexValueNotifierProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        dispatch(const ArticleInitialized());
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
        children: const [
          ArticleListTabPage(),
          FavoriteArticleListTabPage(),
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
