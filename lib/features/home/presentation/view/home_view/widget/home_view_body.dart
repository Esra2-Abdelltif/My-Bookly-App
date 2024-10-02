import 'package:bookly_project/core/utils/constants/app_text.dart';
import 'package:bookly_project/core/utils/extension/screen_padding.dart';
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
              const CustomAppBar(),
              const FeaturedBooksListView(),
              Text(
                AppConstantText.bestSeller,
                style: Styles.textStyle18,
              ).paddingAll(30),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          //This approach ensures that only the visible items are rendered
          (BuildContext context, int index) {
            return const BestSellerListView();
          },
          childCount: 1,
        )),
        // const SliverFillRemaining(child: BestSellerListView()),
      ],
    );
  }
}
