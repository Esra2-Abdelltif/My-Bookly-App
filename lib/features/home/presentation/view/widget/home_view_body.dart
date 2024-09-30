import 'package:bookly_project/core/utils/constants/app_text.dart';
import 'package:bookly_project/core/utils/styles/text_style.dart';
import 'package:bookly_project/features/home/presentation/view/widget/custom_app_bar.dart';
import 'package:bookly_project/features/home/presentation/view/widget/featured_list_view.dart';
import 'package:flutter/cupertino.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const  CustomAppBar(),
        const  FeaturedBooksListView(),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,),
          child: Text(
            AppConstantText.bestSeller,
            style: Styles.textStyle18,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
