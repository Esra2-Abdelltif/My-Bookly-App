import 'package:bookly_project/core/utils/constants/app_images.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(AppImagePaths.testImage)),
            ),
          )
          ),
    );
  }
}
// child: CachedNetworkImage(
//   fit: BoxFit.fill,
//   imageUrl: imageUrl,
//   errorWidget: (context, url, error) => const Icon(
//     Icons.error,
//   ),
// ),
