import 'package:bookly_project/features/home/presentation/view/home_view/widget/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       body: HomeViewBody(),
    );
  }
}