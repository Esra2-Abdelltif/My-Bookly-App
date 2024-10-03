import 'package:bookly_project/core/utils/constants/app_colors.dart';
import 'package:bookly_project/core/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          placeholder: (context, url) =>  Shimmer.fromColors(
            baseColor: Colors.grey[850]!,
            highlightColor: Colors.grey[800]!,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
          ),
        ),
          ),
    );
  }
}

class CustomBookImageAnimation extends StatelessWidget {
  const CustomBookImageAnimation({super.key});


  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[800]!,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
            aspectRatio: 2.6 / 4,
            child: Container(
              decoration:  BoxDecoration(
                color:AppColors.kPrimaryColor,
                image: const DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(AppImagePaths.testImage)),
              ),
            )
        ),
      ),
    );

  }
}

