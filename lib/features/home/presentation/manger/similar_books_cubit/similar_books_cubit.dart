import 'package:bloc/bloc.dart';
import 'package:bookly_project/core/errors/exceptions/server_exceptions/failure.dart';
import 'package:bookly_project/core/services/singletones/registered_singletones.dart';
import 'package:bookly_project/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_project/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends  Cubit<SimilarBooksState> {
  SimilarBooksCubit() : super(SimilarBooksInitial());

  static SimilarBooksCubit ofCurrentContext(context) =>
      BlocProvider.of<SimilarBooksCubit>(context);

  Failure? serverException;
  late List<BookModel> books;

  Future<void> fetchSimilarBooks({required String category}) async {
    try {
      await _fetchSimilarBooks(category: category);
    } catch (e) {
      emit(NoInternetConnectionState());
    }
  }

  Future<void> _fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    await getIt<HomeRepo>().fetchFeaturedBooks().then((value) {
      value.fold((feature) {
        serverException = feature;
        emit(SimilarBooksFailure());
      }, (booksList) {
        books = booksList;
        emit(SimilarBooksSuccess());
      });
    });

  }

}
