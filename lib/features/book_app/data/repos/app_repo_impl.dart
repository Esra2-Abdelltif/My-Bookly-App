import 'package:bookly_project/core/errors/exceptions/server_exceptions/failure.dart';
import 'package:bookly_project/core/utils/constants/app_strings.dart';
import 'package:bookly_project/features/book_app/data/repos/app_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LangRepositoryImpl implements BaseLangRepository {
  final SharedPreferences sharedPreferences;

  LangRepositoryImpl({required this.sharedPreferences});

  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final langIsChanged =
          await sharedPreferences.setString(AppStrings.locale, langCode);
      return Right(langIsChanged);
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langCode = sharedPreferences.containsKey(AppStrings.locale)
          ? sharedPreferences.getString(AppStrings.locale)!
          : AppStrings.englishCode;
      return Right(langCode);
    } on Failure catch (e) {
      return left(e);
    }
  }
}
