import 'package:animate_do/animate_do.dart';
import 'package:bookly_project/core/utils/extension/media_query_values.dart';
import 'package:bookly_project/core/utils/extension/screen_padding.dart';
import 'package:bookly_project/core/utils/styles/text_style.dart';
import 'package:bookly_project/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_project/features/home/presentation/view/book_details_view/widget/books_action.dart';
import 'package:bookly_project/features/home/presentation/view/shared_widget/book_rating.dart';
import 'package:bookly_project/features/home/presentation/view/shared_widget/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInUp(
          from: 30,
          child: CustomBookImage(
            imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
          ).paddingHorizontal(context.width * .2),
        ),
        const SizedBox(
          height: 43,
        ),
        FadeInUp(
          from: 40,
          child: Text(
            book.volumeInfo.title!,
            style: Styles.textStyle30.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        FadeInUp(
          from: 50,
          child: Opacity(
            opacity: .7,
            child: Text(
              book.volumeInfo.authors?[0] ?? '',
              style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        FadeInUp(
          from: 60,
          child: BookRating(
            rating: book.volumeInfo.averageRating ?? 0,
            count: book.volumeInfo.ratingsCount ?? 0,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        const SizedBox(
          height: 37,
        ),
        FadeInUp(
          from: 70,
          child: BooksAction(
            bookModel: book,
          ),
        )
      ],
    );
  }
}
