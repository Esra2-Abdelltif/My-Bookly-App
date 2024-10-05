
import 'package:bookly_project/core/errors/exceptions/server_exceptions/failure.dart';
import 'package:dartz/dartz.dart';


abstract class BaseLangRepository {
  Future<Either<Failure, bool>> changeLang({required String langCode});
  Future<Either<Failure, String>> getSavedLang();
}