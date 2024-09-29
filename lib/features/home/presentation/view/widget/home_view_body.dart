import 'package:bookly_project/features/home/presentation/view/widget/custom_app_bar.dart';
import 'package:bookly_project/features/home/presentation/view/widget/featured_list_view.dart';
import 'package:flutter/cupertino.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,),
      child: Column(
        children: [
          CustomAppBar(),
          FeaturedBooksListView(),
        ],
      ),
    );
  }
}
