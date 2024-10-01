import 'package:bookly_project/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/utils/constants/app_colors.dart';
import 'package:device_preview/device_preview.dart';
void main() {
  runApp((DevicePreview(
    enabled: true,
    builder: (context) => const MyBooklyApp(),
  )));


}

class MyBooklyApp extends StatelessWidget {
  const MyBooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
     // home: const SplashView(),
        routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.kPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
    ));
  }
}

