import 'package:bookly_project/core/services/remote/api/api_helper.dart';
import 'package:bookly_project/core/services/remote/api/api_helper_implementation.dart';
import 'package:bookly_project/features/book_app/data/repos/app_repo.dart';
import 'package:bookly_project/features/book_app/data/repos/app_repo_impl.dart';
import 'package:bookly_project/features/home/data/repos/home_repo.dart';
import 'package:bookly_project/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_project/features/search/data/repos/search_repo.dart';
import 'package:bookly_project/features/search/data/repos/search_repo_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
class RegisteredSingleton {
  static Future<void> registerInstances() async {
    getIt.registerLazySingleton<ApiHelper>(() => ApiHelperImplementation()); //Registered the API_HELPER Because we need to use it in to the repositories

    getIt.registerSingleton<HomeRepo>(HomeRepoImpl(apiHelper: getIt<ApiHelper>(),));
    getIt.registerSingleton<SearchRepo>(SearchRepoImpl(apiHelper: getIt<ApiHelper>(),));
    //LangRepositoryImpl
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton(() => sharedPreferences);
    getIt.registerSingleton<BaseLangRepository>(LangRepositoryImpl(sharedPreferences: getIt(),));

  }
}