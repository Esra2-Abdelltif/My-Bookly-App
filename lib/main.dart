import 'package:bookly_project/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/utils/constants/app_colors.dart';
void main() {
  runApp(const MyBooklyApp());
}

class MyBooklyApp extends StatelessWidget {
  const MyBooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
     home: const SplashView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.kPrimaryColor,

    ));
  }
}

