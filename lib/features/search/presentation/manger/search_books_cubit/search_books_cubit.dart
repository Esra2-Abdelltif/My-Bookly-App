import 'dart:async';

import 'package:bookly_project/core/errors/exceptions/server_exceptions/failure.dart';
import 'package:bookly_project/core/services/singletones/registered_singletones.dart';
import 'package:bookly_project/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_project/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit() : super(SearchBooksInitial());

  static SearchBooksCubit ofCurrentContext(context) => BlocProvider.of<SearchBooksCubit>(context);

  final TextEditingController controller = TextEditingController();
  Failure? serverException;
  late List<BookModel> books=[];
  Timer? debounce;

  Future<void> fetchSearchBooks() async {
    emit(SearchBooksLoading());
    await getIt<SearchRepo>().searchBooks(query: controller.text).then((value) {
      value.fold((feature) {
        serverException = feature;
        emit(SearchBooksFailure());
      }, (booksList) {
        books = booksList;
        emit(SearchBooksSuccess());
      });
    });
  }
  void searchFun() {
    controller.addListener(() {
      if (debounce?.isActive ?? false) {
        debounce?.cancel();
      }
      debounce = Timer(const Duration(milliseconds: 100), () async {
        if (controller.text.isEmpty ||controller.text=='') {
          controller.clear();
        }
        fetchSearchBooks();
        emit(SearchBooks());

      });
    });
// TODO: implement onChange

  }
}
