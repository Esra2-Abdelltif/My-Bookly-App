import 'package:bookly_project/core/errors/exceptions/server_exceptions/failure.dart';
import 'package:bookly_project/core/services/remote/api/api_helper.dart';
import 'package:bookly_project/core/services/remote/api/books_api_constantace.dart';
import 'package:bookly_project/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

import 'search_repo.dart';
class SearchRepoImpl implements SearchRepo {
  final ApiHelper apiHelper;

  SearchRepoImpl({required this.apiHelper});


  @override
  Future<Either<Failure, List<BookModel>>> searchBooks({required String query}) async{
    try {
      var data = await apiHelper.get(endPoint: BooksApiConstance.searchBooksPath(query: query));
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } on Failure  catch (e) {
      return left(e);
    }
  }
}