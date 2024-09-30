import 'package:bookly_project/config/routes/app_routes.dart';
import 'package:bookly_project/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../core/widgets/custom_book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30-8),
      child: SizedBox(
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
                    GoRouter.of(context).push(AppRouter.kBookDetailsView);
                  },
                  child: const CustomBookImage(
                    imageUrl:
                        '',
                  ),
                ),
              );
            }),
      ),
    );
  }
}