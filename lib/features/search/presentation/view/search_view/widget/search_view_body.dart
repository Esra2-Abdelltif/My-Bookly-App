import 'package:animate_do/animate_do.dart';
import 'package:bookly_project/core/utils/constants/app_strings.dart';
import 'package:bookly_project/core/utils/extension/screen_padding.dart';
import 'package:bookly_project/core/utils/styles/text_style.dart';
import 'package:bookly_project/features/search/presentation/manger/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_project/features/search/presentation/view/search_view/widget/custom_search_text_field.dart';
import 'package:bookly_project/features/search/presentation/view/search_view/widget/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBooksCubit(),
      child: BlocBuilder<SearchBooksCubit, SearchBooksState>(
        builder: (context, state) {
          SearchBooksCubit searchBooksCubit = SearchBooksCubit.ofCurrentContext(
              context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInUp(
              from: 50,child:  CustomSearchTextField(
                  controller: searchBooksCubit.controller,
                  onTap: () {
                    searchBooksCubit.fetchSearchBooks();
                  },
                  onChanged: (String value) {
                    searchBooksCubit.searchFun();
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),

              searchBooksCubit.controller.text.isEmpty ? const Center() : Text(
                AppStrings.searchResult,
                style: Styles.textStyle18,
              ),
              const SizedBox(
                height: 16,
              ),
              searchBooksCubit.controller.text.isEmpty
                  ? const Center()
                  : const Expanded(
                child: SearchResultListView(),
              ),
            ],
          );
        },
      ),
    ).addScreenPadding();
  }
}
