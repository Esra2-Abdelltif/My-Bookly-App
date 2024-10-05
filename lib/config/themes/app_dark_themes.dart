import 'package:bookly_project/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


ThemeData getThemeDataDark() => ThemeData(
  iconTheme: const IconThemeData(
    color: Colors.white
  ),
  scaffoldBackgroundColor: AppColors.kPrimaryColor,
  appBarTheme: AppBarTheme(backgroundColor: AppColors.kPrimaryColor),
  textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
);