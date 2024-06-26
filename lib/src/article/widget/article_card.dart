import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_new_api_test/core/components/app_network_image.dart';
import 'package:google_new_api_test/src/article/data/responses/responses.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class ArticleCard extends StatelessWidget {
  final ArticleItem item;
  final Widget Function(BuildContext, void Function({Object? returnValue})) openBuilder;

  static const skeleton = _ArticleCardSkeleton();

  const ArticleCard({
    super.key,
    required this.item,
    required this.openBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: OpenContainer(
          transitionType: ContainerTransitionType.fade,
          tappable: false,
          openBuilder: openBuilder,
          closedShape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          openColor: Theme.of(context).colorScheme.surface,
          closedColor: Theme.of(context).colorScheme.surface,
          closedBuilder: (BuildContext context, VoidCallback openContainer) {
            return Card.outlined(
              margin: EdgeInsets.zero,
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
              child: InkWell(
                onTap: openContainer,
                borderRadius: BorderRadius.circular(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: AppNetworkImage(imageUrl: item.images?.thumbnail ?? '', height: 200),
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
                          Text(
                            DateFormat('dd/MM/yyyy').format(
                              DateTime.fromMillisecondsSinceEpoch(int.parse(item.timestamp)),
                            ),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
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
          },
        ),
      ),
    );
  }
}

class _ArticleCardSkeleton extends StatelessWidget {
  const _ArticleCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: Theme.of(context).colorScheme.surfaceContainerLowest,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
              highlightColor: Theme.of(context).colorScheme.secondaryContainer,
              child: Container(
                height: 200,
                width: double.infinity,
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
                  highlightColor: Theme.of(context).colorScheme.secondaryContainer,
                  child: Container(
                    height: 20,
                    width: 100,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
                const SizedBox(height: 2),
                Shimmer.fromColors(
                  baseColor: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
                  highlightColor: Theme.of(context).colorScheme.secondaryContainer,
                  child: Container(
                    height: 20,
                    width: 30,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
                const SizedBox(height: 12),
                Shimmer.fromColors(
                  baseColor: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
                  highlightColor: Theme.of(context).colorScheme.secondaryContainer,
                  child: Container(
                    height: 20,
                    width: double.infinity,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
