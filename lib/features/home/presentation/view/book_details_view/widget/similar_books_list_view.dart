import 'package:bookly_project/features/home/presentation/view/shared_widget/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';


class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .15,
      child: ListView.builder(
          itemCount: 7,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: CustomBookImage(
                imageUrl:
                '',
              ),
            );
          }),
    );
  }
}