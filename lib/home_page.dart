import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_new_api_test/app_api.dart';
import 'package:google_new_api_test/components/setting_dialog.dart';
import 'package:google_new_api_test/responses/responses.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const categories = [
  'Latest',
  'Entertainment',
  'World',
  'Business',
  'Health',
  'Sport',
  'Science',
  'Technology',
];

class MyHomePage extends HookConsumerWidget {
  final ValueNotifier<ThemeMode> themeNotifier;
  final ValueNotifier<Color> seedColor;

  const MyHomePage({
    super.key,
    required this.themeNotifier,
    required this.seedColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleList = useState(<ArticleResponse>[]);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final appApi = ref.read(appApiProvider);
        var list = <ArticleResponse>[];
        // for (final category in categories) {
        final response = await appApi.getNews(category: categories[4]);
        await Future.delayed(const Duration(seconds: 1));
        list.add(response);
        // }
        articleList.value = list;
      });
      return null;
    });

    return DefaultTabController(
      length: categories.length,
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            title: Text(
              'Google News API',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
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
              preferredSize: const Size.fromHeight(48),
              child: TabBar(
                tabAlignment: TabAlignment.start,
                automaticIndicatorColorAdjustment: false,
                labelStyle:
                    Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.primary),
                unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
                isScrollable: true,
                tabs: categories.map((category) => Tab(text: category)).toList(),
              ),
            ),
          ),
          body: TabBarView(
            children: categories.map((category) {
              return ListView.builder(
                itemCount: articleList.value.length,
                itemBuilder: (context, index) {
                  final article = articleList.value[index];
                  return Column(
                    children: article.items.map((item) {
                      return Card.outlined(
                        color: Theme.of(context).colorScheme.surfaceContainerLowest,
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(12),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  item.images?.thumbnail ?? '',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 200,
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return SizedBox(
                                      height: 200,
                                      width: double.infinity,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: Theme.of(context).textTheme.titleLarge,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 2),
                                    Text('20/03/1999', style: Theme.of(context).textTheme.bodyLarge),
                                    const SizedBox(height: 12),
                                    Text(
                                      item.snippet,
                                      style: Theme.of(context).textTheme.bodySmall,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                      return ListTile(
                        title: Text(item.title),
                        subtitle: Text(item.snippet),
                      );
                    }).toList(),
                  );
                },
              );
            }).toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.surface,
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
      }),
    );
  }
}
