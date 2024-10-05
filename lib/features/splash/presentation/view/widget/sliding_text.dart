import 'package:bookly_project/core/utils/constants/app_strings.dart';
import 'package:bookly_project/core/utils/extension/translator_extension.dart';
import 'package:flutter/material.dart';


class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child:  Text(
              context.translate(AppStrings.readFreeBooks),
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}