import 'package:bookly_project/core/utils/extension/screen_padding.dart';
import 'package:bookly_project/core/widgets/custom_error_widget.dart';
import 'package:bookly_project/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_project/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_project/features/home/presentation/view/shared_widget/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';


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
                itemCount: similarBooksCubit.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomBookImage(
                      imageUrl:
                      similarBooksCubit.books[index].volumeInfo.imageLinks?.thumbnail ??
                          '',
                    ),
                  );
                }),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errMessage:similarBooksCubit.serverException!.errorMessage!);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
    return SizedBox(
      height: context.height * .15,
      child: ListView.builder(
          itemCount: 7,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return  const CustomBookImage(
              imageUrl:
              '',
            ).paddingHorizontal(5);
          }),
    );
  }
}