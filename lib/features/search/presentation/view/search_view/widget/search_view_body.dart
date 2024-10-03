import 'package:bookly_project/core/utils/constants/app_text.dart';
import 'package:bookly_project/core/utils/extension/screen_padding.dart';
import 'package:bookly_project/core/utils/styles/text_style.dart';
import 'package:bookly_project/features/search/presentation/view/search_view/widget/custom_search_text_field.dart';
import 'package:bookly_project/features/search/presentation/view/search_view/widget/search_result_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSearchTextField(),
        const SizedBox(
          height: 16,
        ),
        Text(
          AppConstantText.searchResult,
          style: Styles.textStyle18,
        ),
        const SizedBox(
          height: 16,
        ),
        const Expanded(
          child: SearchResultListView(),
        ),
      ],
    ).addScreenPadding();
  }
}
