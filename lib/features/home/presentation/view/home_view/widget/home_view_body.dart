import 'package:animate_do/animate_do.dart';
import 'package:bookly_project/core/utils/constants/app_strings.dart';
import 'package:bookly_project/core/utils/extension/screen_padding.dart';
import 'package:bookly_project/core/utils/extension/translator_extension.dart';
import 'package:bookly_project/core/utils/styles/text_style.dart';
import 'package:bookly_project/features/home/presentation/view/home_view/widget/best_seller_widgets/best_seller_list_view.dart';
import 'package:bookly_project/features/home/presentation/view/home_view/widget/custom_app_bar.dart';
import 'package:bookly_project/features/home/presentation/view/home_view/widget/featured_books_widgets/featured_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInUp(
                  from: 20,child: const CustomAppBar()),
              FadeInUp(
                  from: 30,child: const FeaturedBooksListView()),
              FadeInUp(
                from: 40,
                child: Text(
                  context.translate( AppStrings.bestSeller),
                  style: Styles.textStyle18,
                ).paddingAll(30),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return FadeInUp(
                from: 50,child: const BestSellerListView());
          },
          childCount: 1,
        )),
        // const SliverFillRemaining(child: BestSellerListView()),
      ],
    );
  }
}
