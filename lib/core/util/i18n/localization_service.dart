// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pragati/res/i18n/lang/as.dart';
// import 'package:pragati/res/i18n/lang/en_US.dart';
// import 'package:pragati/res/i18n/lang/hi_IN.dart';
//
// class LocalizationService extends Translations {
//   static final local = Locale("en", "US");
//   static final fallbackLocal = Locale("en", "US");
//   static final langs = ["English", "Hindi (हिंदी)", "Assamese (অসমীয়া)"];
//   static final locales = [
//     Locale("en", "US"),
//     Locale("hi", "IN"),
//     Locale("as", "IN"),
//   ];
//
//   @override
//   // TODO: implement keys
//   Map<String, Map<String, String>> get keys =>
//       {"en_US": enUS, "hi_IN": hiIN, "as": as};
//
//   Locale getLocaleFromLanguage(String lang) {
//     for (int i = 0; i < langs.length; i++) {
//       if (lang == langs[i]) return locales[i];
//     }
//     return Get.locale;
//   }
//
//   void changeLanguage(String lang) {
//     final locale = getLocaleFromLanguage(lang);
//     Get.updateLocale(locale);
//   }
// }
