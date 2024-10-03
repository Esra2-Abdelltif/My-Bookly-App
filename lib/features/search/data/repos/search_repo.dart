
import 'package:bookly_project/core/errors/exceptions/server_exceptions/failure.dart';
import 'package:bookly_project/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> searchBooks(String query);

}