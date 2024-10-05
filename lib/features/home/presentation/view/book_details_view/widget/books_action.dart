import 'package:bookly_project/core/utils/constants/app_strings.dart';
import 'package:bookly_project/core/utils/extension/translator_extension.dart';
import 'package:bookly_project/core/utils/function/launch_url.dart';
import 'package:bookly_project/core/widgets/custom_button.dart';
import 'package:bookly_project/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';


class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
             Expanded(
                child: CustomButton(
                  text: context.translate(AppStrings.free),
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                )),
            Expanded(
                child: CustomButton(
                  onPressed: () {
                    launchCustomUr(context, bookModel.volumeInfo.previewLink);
                  },
                  fontSize: 16,
                  text: getText(bookModel,context),
                  backgroundColor: const Color(0xffEF8262),
                  textColor: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  String getText(BookModel bookModel,BuildContext context) {
    if (bookModel.volumeInfo.previewLink == null) {
      return context.translate(AppStrings.free);
    } else {
      return context.translate(AppStrings.preview);
    }
  }
}