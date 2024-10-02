import 'package:bookly_project/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_project/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_project/features/home/presentation/view/book_details_view/book_details_view.dart';
import 'package:bookly_project/features/home/presentation/view/home_view/home_view.dart';
import 'package:bookly_project/features/search/search_view.dart';
import 'package:bookly_project/features/splash/presentation/view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),

      GoRoute(
        path: kSearchView,
        builder: (context, state) =>const SearchView(),
      ),

    ],
  );
}