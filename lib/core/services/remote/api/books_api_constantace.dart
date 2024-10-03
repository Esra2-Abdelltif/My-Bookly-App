class BooksApiConstance{
  static const String baseUrl='https://www.googleapis.com/books/v1/volumes';
  static const String appKey= "AIzaSyCup09B7Weg3w7HbTqY0HXL9KBbGj_eM18";
  static const String nowBooksPath ="$baseUrl?Filtering=free-ebooks&Sorting=newest&q=computer science&key=$appKey";

  static const String featuredBooksPath ="$baseUrl?Filtering=free-ebooks&q=subject:Programming&key=$appKey";
  static const String similarBooksPath ="$baseUrl?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming&key=$appKey";
  static   String searchBooksPath({required String query}) {
    return 'https://www.googleapis.com/books/v1/volumes?q=$query&key=$appKey';
  }

}
const int badRequestStatusCode = 400;
const int unAuthorizedStatusCode = 401;
const int forbiddenStatusCode = 403;

const int conflictStatusCode = 409;
const int timeoutStatusCode = 408;
const int notFoundStatusCode = 408;

const int internalServerErrorStatusCode = 500;
const int noInternetStatusCode = 12163;
