
import 'package:bookly_project/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_project/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_project/features/home/presentation/view/book_details_view/widget/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    SimilarBooksCubit.ofCurrentContext(context).fetchSimilarBooks(category: widget.bookModel.volumeInfo.categories==null?"":widget.bookModel.volumeInfo.categories![0] );
    super.initState();
  }
 @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: BookDetailsViewBody(bookModel: widget.bookModel,)),
    );
  }
}