import 'package:bookly_project/core/utils/constants/app_colors.dart';
import 'package:bookly_project/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';


class BooksAction extends StatelessWidget {
  const BooksAction({super.key, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
           Expanded(
              child: CustomButton(
                text: '19.99 💲',
                backgroundColor: Colors.white,
                textColor: AppColors.kBlackColor,
                borderRadius:const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              )),
          Expanded(
              child: CustomButton(
                onPressed: () {
                },
                fontSize: 16,
                text: "Free",
                backgroundColor: AppColors.kSecondryColor,
                textColor: AppColors.kWhiteColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              )),
        ],
      ),
    );
  }


}