import 'package:bookly_project/core/widgets/custom_error_widget.dart';
import 'package:bookly_project/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_project/features/home/presentation/view/home_view/widget/best_seller_widgets/best_seller_list_view_item.dart';
import 'package:bookly_project/features/search/presentation/manger/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SearchResultListView extends StatelessWidget {

  const SearchResultListView({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        SearchBooksCubit searchBooksCubit=SearchBooksCubit.ofCurrentContext(context);

        if (state is SearchBooksSuccess) {
          return          ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: searchBooksCubit.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(bookModel:searchBooksCubit. books[index],),
                // child: Text('data'),
              );
            },
          );
        } else if (state is SearchBooksFailure) {
          return CustomErrorWidget(errMessage: searchBooksCubit.serverException!.errorMessage!);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}