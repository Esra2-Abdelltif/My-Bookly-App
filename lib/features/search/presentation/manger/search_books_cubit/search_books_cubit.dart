import 'package:bookly_project/core/errors/exceptions/server_exceptions/failure.dart';
import 'package:bookly_project/core/services/singletones/registered_singletones.dart';
import 'package:bookly_project/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_project/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends  Cubit<SearchBooksState> {
  SearchBooksCubit() : super(SearchBooksInitial());

  static SearchBooksCubit ofCurrentContext(context) =>
      BlocProvider.of<SearchBooksCubit>(context);

  Failure? serverException;
  late List<BookModel> books;


  Future<void> fetchSearchBooks({required String query}) async {
    emit(SearchBooksLoading());
    await getIt<SearchRepo>().searchBooks(query: query).then((value) {
      value.fold((feature) {
        serverException = feature;
        emit(SearchBooksFailure());
      }, (booksList) {
        books = booksList;
        emit(SearchBooksSuccess());
      });
    });

  }

}
