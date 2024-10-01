import 'package:bookly_project/core/errors/exceptions/server_exceptions/server_exceptions.dart';
import 'package:bookly_project/core/services/remote/api/api_helper.dart';
import 'package:bookly_project/core/services/remote/api/books_api_constantace.dart';
import 'package:bookly_project/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_project/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
class HomeRepoImpl implements HomeRepo {
  final ApiHelper apiHelper;

  HomeRepoImpl({required this.apiHelper});
  @override
  Future<Either<ServerExceptions, List<BookModel>>> fetchNewsetBooks() async {
    try {
      var data = await apiHelper.get(endPoint: BooksApiConstance.nowBooksPath);
      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          books.add(BookModel.fromJson(item));
        }
      }

      return right(books);
    } on ServerExceptions  catch (e) {
      return left(e);
    }

  }

  @override
  Future<Either<ServerExceptions, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiHelper.get(endPoint: BooksApiConstance.featuredBooksPath);
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } on ServerExceptions  catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerExceptions, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiHelper.get(endPoint: BooksApiConstance.similarBooksPath);
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } on ServerExceptions  catch (e) {
      return left(e);
    }
  }
}