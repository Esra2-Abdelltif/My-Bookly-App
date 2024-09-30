import 'package:bookly_project/features/home/presentation/view/book_details_view/widget/books_details_section.dart';
import 'package:bookly_project/features/home/presentation/view/book_details_view/widget/custom_book_details_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {

   return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                CustomBookDetailsAppBar(),
                BookDetailsSection()

              ],
            ),
          ),
        ),
      ],
    );
}

}
