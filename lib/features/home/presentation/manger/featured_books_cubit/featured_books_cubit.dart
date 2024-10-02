import 'package:bloc/bloc.dart';
import 'package:bookly_project/core/errors/exceptions/server_exceptions/failure.dart';
import 'package:bookly_project/core/services/singletones/registered_singletones.dart';
import 'package:bookly_project/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_project/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_states.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit() : super(FeaturedBooksInitial());

  Failure? serverException;
  late List<BookModel> books;
  Future<void> fetchFeaturedBooks() async {
    try {
      await _fetchFeaturedBooks();
    } catch (e) {
      emit(NoInternetConnectionState());
    }
  }
  Future<void> _fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    await getIt<HomeRepo>().fetchFeaturedBooks().then((value) {
      value.fold((feature) {
        serverException = feature;
        emit(FeaturedBooksFailure());
      }, (booksList) {
        books = booksList;
        emit(FeaturedBooksSuccess());
      });
    });
  }
}
