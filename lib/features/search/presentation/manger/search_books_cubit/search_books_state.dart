part of 'search_books_cubit.dart';

abstract class SearchBooksState extends Equatable {
  const SearchBooksState();

  @override
  List<Object> get props => [];
}

class SearchBooksInitial extends SearchBooksState {}

class SearchBooksFailure extends SearchBooksState {}

class SearchBooksSuccess extends SearchBooksState {}

class SearchBooksLoading extends SearchBooksState {}