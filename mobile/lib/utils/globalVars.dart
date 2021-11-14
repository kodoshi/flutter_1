import 'package:eventify/eventify.dart';
import 'package:flutter_1/utils/translations/english.dart';
import 'package:flutter_1/utils/translations/french.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

/// Package used to make events bubble up to the top of the tree, and trigger certain state rebuilds
final EventEmitter emitter = new EventEmitter(); //one instance to connect all events

int translation = Settings.getValue<int>('key-language', 1); //persisting key to remember language preference

/// getter function to retrieve the translated phrase
String? getText(String element) {
  if (translation == 1) {
    return EnglishTranslation().translationArray[element];
  } else if (translation == 2) {
    return FrenchTranslation().translationArray[element];
  } else {
    return EnglishTranslation().translationArray[element];
  }
}
