import 'package:bloc/bloc.dart';
import 'package:bookly_project/core/errors/exceptions/server_exceptions/failure.dart';
import 'package:bookly_project/core/services/singletones/registered_singletones.dart';
import 'package:bookly_project/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_project/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit() : super(NewsetBooksInitial());
  static NewsetBooksCubit ofCurrentContext(context) =>
      BlocProvider.of<NewsetBooksCubit>(context);

  Failure? serverException;
  late List<BookModel> books;

  Future<void> fetchNewestBooks() async {
    emit(NewsetBooksLoading());

    await getIt<HomeRepo>().fetchNewsetBooks().then((value) {
      value.fold((feature) {
        serverException = feature;
        emit(NewsetBooksFailure());
      }, (booksList) {
        books = booksList;
        emit(NewsetBooksSuccess());
      });
    });
  }
}
