import 'package:bookly_project/core/utils/constants/app_constants.dart';
import 'package:bookly_project/core/utils/constants/app_images.dart';
import 'package:bookly_project/features/home/presentation/view/home_view/home_view.dart';
import 'package:bookly_project/features/splash/presentation/view/widget/sliding_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
   //Be handle rate bt3 tghir values
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AppImagePaths.logoImage),
        const SizedBox(
          height: 4,
        ),
         SlidingText(slidingAnimation:slidingAnimation ,)
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    //by7dd azay animation hyshtghl 3la m7wr x ,y
    slidingAnimation = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero).animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
          () {
        Get.to(() =>  const HomeView(),
            // calculations
            transition: Transition.fade,
            duration: AppConstance.kTranstionDuration);

      },
    );
  }
}
