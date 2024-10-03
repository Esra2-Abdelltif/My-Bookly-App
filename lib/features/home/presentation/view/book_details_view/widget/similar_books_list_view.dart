import 'package:bookly_project/config/routes/app_routes.dart';
import 'package:bookly_project/core/utils/extension/screen_padding.dart';
import 'package:bookly_project/core/widgets/custom_error_widget.dart';
import 'package:bookly_project/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_project/features/home/presentation/view/shared_widget/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        SimilarBooksCubit similarBooksCubit= SimilarBooksCubit.ofCurrentContext(context);
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
                key: PageStorageKey<String>(similarBooksCubit.books[0].volumeInfo.title!) ,
                itemCount: similarBooksCubit.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pushReplacement(AppRouter.kBookDetailsView,extra:   similarBooksCubit.books[index]);
                    },
                    child: CustomBookImage(
                      imageUrl:
                      similarBooksCubit.books[index].volumeInfo.imageLinks?.thumbnail ??
                          '',
                    ).paddingHorizontal(5),
                  );
                }),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errMessage:similarBooksCubit.serverException!.errorMessage!);
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const CustomBookImageAnimation().paddingHorizontal(5);
                }),
          );
        }
      },
    );

  }
}