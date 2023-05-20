import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../enums/app_colors.dart';
import '../providers/controllers/cache_manager_controller.dart';

class CustomPost extends ConsumerWidget {
  final String postDate;
  final String title;
  final String imageUrl;
  final String body;
  final Function()? onTap;

  const CustomPost(
      {super.key,
      required this.postDate,
      required this.title,
      required this.imageUrl,
      required this.body,
      this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
              side: BorderSide.none, borderRadius: BorderRadius.circular(8)),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image
                  CachedNetworkImage(
                    key: UniqueKey(),
                    cacheManager: cacheManagerPostsController,
                    imageUrl: imageUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      width: double.infinity,
                      height: 175,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            //TODO VER CUAL FIT ES MEJOR
                            image: imageProvider, fit: BoxFit.fill),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error, size: 40)),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                    ),
                  ),
                  // Date
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 4, right: 16.0, bottom: 4),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(postDate,
                          style: textTheme.bodyMedium!
                              .copyWith(color: AppColors.black.color.withOpacity(0.5))),
                    ),
                  ),
                  // Title and subtitle
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          title,
                          style: textTheme.titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        // Subtitle
                        Text(
                          body,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          style: textTheme.bodyLarge!,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8)
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16)
      ],
    );
  }
}
