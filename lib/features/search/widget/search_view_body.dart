import 'package:bookly_project/core/utils/extension/screen_padding.dart';
import 'package:bookly_project/features/search/widget/custom_search_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody  extends StatelessWidget {
  const SearchViewBody ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomSearchTextField()
      ],
    ).addScreenPadding();
  }
}
