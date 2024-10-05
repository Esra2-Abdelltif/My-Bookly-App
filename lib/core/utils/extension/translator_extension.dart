import 'package:bookly_project/config/locales/app_localizations.dart';
import 'package:flutter/cupertino.dart';


extension Translate on BuildContext {
  String translate(  String key) {
    return AppLocalizations.of(this)!.translate(key)!;
  }


}

