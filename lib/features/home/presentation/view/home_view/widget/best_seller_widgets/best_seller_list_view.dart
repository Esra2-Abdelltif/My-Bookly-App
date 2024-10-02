
import 'package:bookly_project/core/utils/extension/screen_padding.dart';
import 'package:bookly_project/core/widgets/custom_error_widget.dart';
import 'package:bookly_project/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_project/features/home/presentation/manger/newest_books_cubit/newset_books_cubit.dart';
import 'package:bookly_project/features/home/presentation/view/home_view/widget/best_seller_widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        NewsetBooksCubit newsetBooksCubit=NewsetBooksCubit.ofCurrentContext(context);

        if (state is NewsetBooksSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: newsetBooksCubit.books.length,
            itemBuilder: (context, index) {
              return BookListViewItem(
                bookModel: newsetBooksCubit.books[index],
              ).paddingBottom(20);
            },
          ).addScreenPadding();
        } else if (state is NewsetBooksFailure) {
          return CustomErrorWidget(errMessage: newsetBooksCubit.serverException!.errorMessage!);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );

  }
}