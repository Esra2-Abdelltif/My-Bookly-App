import 'package:animate_do/animate_do.dart';
import 'package:bookly_project/core/utils/extension/screen_padding.dart';
import 'package:bookly_project/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_project/features/home/presentation/view/book_details_view/widget/books_details_section.dart';
import 'package:bookly_project/features/home/presentation/view/book_details_view/widget/custom_book_details_app_bar.dart';
import 'package:bookly_project/features/home/presentation/view/book_details_view/widget/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {

   return  CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child:  Column(
            children: [
              FadeInUp(
                  from: 20,child: const CustomBookDetailsAppBar()),
              BookDetailsSection(book: bookModel,),
               const Expanded(
                child: SizedBox(
                  height: 50,
                ),
              ),
               const SimilarBooksSection(),
               const SizedBox(
                height: 40,
              ),


            ],
          ).addScreenPadding(),
        ),
      ],
    );
}

}
