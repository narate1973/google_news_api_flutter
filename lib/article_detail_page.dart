import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_new_api_test/article_store/article_store.dart';
import 'package:google_new_api_test/responses/responses.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class ArticleDetailPage extends HookConsumerWidget {
  final ArticleItem item;

  const ArticleDetailPage({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleViewState = ref.watch(articleStoreProvider);
    final isFavorite = articleViewState.favoriteArticle.any((element) => element == item);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  maxHeightDiskCache: 600,
                  maxWidthDiskCache: 600,
                  imageUrl: item.images?.thumbnail ?? '',
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  placeholder: (context, url) {
                    return const SizedBox(width: double.infinity, height: 200);
                  },
                  errorWidget: (context, url, error) {
                    return ClipRRect(
                      child: Shimmer.fromColors(
                        baseColor: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
                        highlightColor: Theme.of(context).colorScheme.secondaryContainer,
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          color: Theme.of(context).colorScheme.secondaryContainer,
                        ),
                      ),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, right: 8),
                    child: IconButton(
                      onPressed: () {
                        HapticFeedback.mediumImpact();
                        ref.read(articleStoreProvider.notifier).toggleFavorite(item);
                      },
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.fromBorderSide(BorderSide(color: Colors.black)),
                        ),
                        child: isFavorite
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                              ),
                      ),
                    ),
                  ),
                )
              ],
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
                    '20/05/1999',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
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
