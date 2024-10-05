
import 'package:bookly_project/core/utils/constants/app_strings.dart';
import 'package:bookly_project/core/utils/styles/text_style.dart';
import 'package:bookly_project/features/home/presentation/view/book_details_view/widget/similar_books_list_view.dart';
import 'package:flutter/material.dart';


class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
    AppStrings.youCanAlsoLike,
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
         const SimilarBooksListview(),
      ],
    );
  }
}