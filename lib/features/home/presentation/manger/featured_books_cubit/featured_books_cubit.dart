import 'package:bookly_project/core/errors/exceptions/server_exceptions/failure.dart';
import 'package:bookly_project/core/services/singletones/registered_singletones.dart';
import 'package:bookly_project/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_project/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_states.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit() : super(FeaturedBooksInitial());
  static FeaturedBooksCubit ofCurrentContext(context) =>
      BlocProvider.of<FeaturedBooksCubit>(context);

  Failure? serverException;
  late List<BookModel> books;

  Future<void> fetchFeaturedBooks() async {
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
