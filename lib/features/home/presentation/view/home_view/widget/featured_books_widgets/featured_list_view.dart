import 'package:bookly_project/config/routes/app_routes.dart';
import 'package:bookly_project/core/utils/extension/media_query_values.dart';
import 'package:bookly_project/core/utils/extension/screen_padding.dart';
import 'package:bookly_project/core/widgets/custom_error_widget.dart';
import 'package:bookly_project/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_project/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../shared_widget/custom_book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        FeaturedBooksCubit featuredBooksCubit =FeaturedBooksCubit.ofCurrentContext(context);
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height:context.height * .3,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount:  featuredBooksCubit.books.length,
                scrollDirection: Axis.horizontal,

                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kBookDetailsView);
                      },
                      child:  CustomBookImage(
                        imageUrl:
                        featuredBooksCubit.books[index].volumeInfo.imageLinks
                            ?.thumbnail ??
                            '',
                      ),
                    ),
                  );
                }),
          ).paddingLeft(30-8);
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: featuredBooksCubit.serverException!.errorMessage!);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
