import 'package:bookly_project/bloc_observer.dart';
import 'package:bookly_project/config/routes/app_routes.dart';
import 'package:bookly_project/core/services/singletones/registered_singletones.dart';
import 'package:bookly_project/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_project/features/home/presentation/manger/newest_books_cubit/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/utils/constants/app_colors.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await RegisteredSingleton.registerInstances();
  Bloc.observer = MyBlocObserver();
  runApp((DevicePreview(
    enabled: true,
    builder: (context) => const MyBooklyApp(),
  )));
}

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

      ],
      child: MaterialApp.router(
        // home: const SplashView(),
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,

        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.kPrimaryColor,
          appBarTheme: AppBarTheme(backgroundColor: AppColors.kPrimaryColor),
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
