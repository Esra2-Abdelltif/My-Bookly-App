import 'package:bookly_project/core/utils/constants/app_constants.dart';
import 'package:bookly_project/core/utils/constants/app_text.dart';
import 'package:bookly_project/core/utils/styles/text_style.dart';
import 'package:bookly_project/features/home/presentation/view/home_view/widget/best_seller_widgets/book_rating.dart';
import 'package:bookly_project/features/home/presentation/view/home_view/widget/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            const CustomBookImage(imageUrl: "",),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text("Harry Potter and the Goblet of Fire",
                       maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily:AppConstance. kGtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "J.K. Rowling",
                    overflow: TextOverflow.ellipsis,

                    style: Styles.textStyle14.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 3,
                  ),

                  Row(
                    children: [
                      Text(
                        AppConstantText.free,
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRating()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
