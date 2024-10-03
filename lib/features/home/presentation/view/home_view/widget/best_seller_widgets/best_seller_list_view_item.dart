import 'package:bookly_project/config/routes/app_routes.dart';
import 'package:bookly_project/core/utils/constants/app_constants.dart';
import 'package:bookly_project/core/utils/constants/app_text.dart';
import 'package:bookly_project/core/utils/extension/media_query_values.dart';
import 'package:bookly_project/core/utils/styles/text_style.dart';
import 'package:bookly_project/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_project/features/home/presentation/view/shared_widget/book_rating.dart';
import 'package:bookly_project/features/home/presentation/view/shared_widget/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView,extra:  bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(
              imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: context.width * .5,
                    child: Text(
                      bookModel.volumeInfo.title ??"",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: AppConstance.kGtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Opacity(
                    opacity: .7,
                    child: Text(
                      bookModel.volumeInfo.authors ==null?"": bookModel.volumeInfo.authors![0],
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle14,
                    ),
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
                      BookRating(
                        rating:
                            bookModel.volumeInfo.averageRating?.round() ?? 0,
                        count: bookModel.volumeInfo.ratingsCount ?? 0,
                      )
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
class BookListViewItemAnimation extends StatelessWidget {
  const BookListViewItemAnimation({super.key, });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          const CustomBookImageAnimation(),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(12)
                    ),
                    color: Colors.grey[850]!,
                  ),
                  height:10,
                  width: context.width*.8,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(12)
                    ),
                    color: Colors.grey[850]!,
                  ),
                  height:10,
                  width: context.width*.6,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      decoration:  BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(12)
                        ),
                        color: Colors.grey[850]!,
                      ),
                      height:10,
                      width: context.width*.3,
                    ),
                    const Spacer(),
                    const BookRating(
                      rating: 0,
                      count: 0,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
