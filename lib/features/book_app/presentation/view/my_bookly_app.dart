import 'package:bookly_project/config/locales/app_localizations_setup.dart';
import 'package:bookly_project/config/routes/app_routes.dart';
import 'package:bookly_project/config/themes/app_dark_themes.dart';
import 'package:bookly_project/features/book_app/presentation/manger/books_app_cubit/books_app_cubit.dart';
import 'package:bookly_project/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_project/features/home/presentation/manger/newest_books_cubit/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBooklyApp extends StatelessWidget {
  const MyBooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit()..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewsetBooksCubit()..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) => NewsetBooksCubit()..fetchNewestBooks(),
        ),
        BlocProvider(create: (context) => LocaleCubit()..getSavedLang()),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previousState, currentState) {
          return previousState != currentState;
        },
        builder: (context, state) {
          return MaterialApp.router(
            // home: const SplashView(),
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme:getThemeDataDark(),
            locale: state.locale,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
          );
        },
      ),
    );
  }
}
