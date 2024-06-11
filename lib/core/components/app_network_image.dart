import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final int maxHeightDiskCache;
  final int maxWidthDiskCache;
  final double height;

  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.height = 300,
    this.maxHeightDiskCache = 600,
    this.maxWidthDiskCache = 600,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      maxHeightDiskCache: maxHeightDiskCache,
      maxWidthDiskCache: maxWidthDiskCache,
      imageUrl: imageUrl ?? '',
      imageBuilder: (context, imageProvider) {
        return Container(
          width: double.infinity,
          height: height,
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
        return SizedBox(width: double.infinity, height: height);
      },
      errorWidget: (context, url, error) {
        return ClipRRect(
          child: Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
            highlightColor: Theme.of(context).colorScheme.secondaryContainer,
            child: Container(
              height: height,
              width: double.infinity,
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
          ),
        );
      },
    );
  }
}
