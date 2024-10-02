import 'package:bookly_project/core/utils/extension/media_query_values.dart';
import 'package:bookly_project/core/utils/extension/screen_padding.dart';
import 'package:bookly_project/core/utils/styles/text_style.dart';
import 'package:bookly_project/features/home/presentation/view/book_details_view/widget/books_action.dart';
import 'package:bookly_project/features/home/presentation/view/shared_widget/book_rating.dart';
import 'package:bookly_project/features/home/presentation/view/shared_widget/custom_book_image.dart';
import 'package:flutter/material.dart';


class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const CustomBookImage(
          imageUrl:'',
        ).paddingHorizontal(context.width * .2),
        const SizedBox(
          height: 43,
        ),
        Text(
         "Harry Potter and the Goblet of Fire",
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            "J.K. Rowling",
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const BookRating(
          count: 0,
          rating: 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
        const BooksAction()

      ],
    );
  }
}