import 'package:bookly_project/core/services/singletones/registered_singletones.dart';
import 'package:bookly_project/core/utils/constants/app_strings.dart';
import 'package:bookly_project/features/book_app/data/repos/app_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'books_app_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(const ChangeLocaleState(Locale(AppStrings.englishCode)));

  String currentLangCode = AppStrings.englishCode;

  Future<void> getSavedLang() async {
    final response = await getIt<BaseLangRepository>().getSavedLang();
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = value;
      emit(ChangeLocaleState(Locale(currentLangCode)));
    });
  }

  Future<void> _changeLang(String langCode) async {
    final response =
        await getIt<BaseLangRepository>().changeLang(langCode: langCode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = langCode;
      emit(ChangeLocaleState(Locale(currentLangCode)));
    });
  }

  void toEnglish() => _changeLang(AppStrings.englishCode);

  void toArabic() => _changeLang(AppStrings.arabicCode);
}
