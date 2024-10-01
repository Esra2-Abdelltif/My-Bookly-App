
import 'package:bookly_project/core/errors/exceptions/server_exceptions/server_exceptions.dart';
import 'package:bookly_project/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<ServerExceptions, List<BookModel>>> fetchNewsetBooks();
  Future<Either<ServerExceptions, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<ServerExceptions, List<BookModel>>> fetchSimilarBooks({required String category});
}