import 'package:bookly_project/core/utils/extension/screen_padding.dart';
import 'package:bookly_project/features/search/presentation/view/search_view/widget/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading:IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.close),
        ).addScreenPadding(),
      ),
      body:const SafeArea(
        child: SearchViewBody(),
      ),
    );
  }
}