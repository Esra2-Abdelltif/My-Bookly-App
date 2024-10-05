import 'package:bookly_project/config/locales/app_localizations.dart';
import 'package:bookly_project/config/routes/app_routes.dart';
import 'package:bookly_project/core/utils/constants/app_images.dart';
import 'package:bookly_project/features/book_app/presentation/manger/books_app_cubit/books_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( bottom: 20,right: 30,left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppImagePaths.logoImage,
            height: 18,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kSearchView);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 22,
                  )),
              IconButton(
                  onPressed: () {
                    if (AppLocalizations.of(context)!.isEnLocale) {
                      BlocProvider.of<LocaleCubit>(context).toArabic();
                    } else {
                      BlocProvider.of<LocaleCubit>(context).toEnglish();
                    }
                  },
                  icon: const Icon(
                    Icons.translate_outlined,
                    size: 22,
                  )),
            ],
          )
        ],
      ),
    );
  }
}