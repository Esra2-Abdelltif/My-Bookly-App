import 'package:bookly_project/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';
import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:context.height * .3,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {

                },
                child: const CustomBookImage(
                  imageUrl:
                      '',
                ),
              ),
            );
          }),
    );
  }
}