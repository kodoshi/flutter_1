import 'package:flutter_1/utils/translations/english.dart';
import 'package:flutter_1/utils/translations/french.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

int translation = Settings.getValue<int>('key-language', 1);

String? getText(String element) {
  if (translation == 1) {
    return EnglishTranslation().translationArray[element];
  } else if (translation == 2) {
    return FrenchTranslation().translationArray[element];
  } else {
    return EnglishTranslation().translationArray[element];
  }
}
