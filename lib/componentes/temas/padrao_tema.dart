import 'package:flutter/material.dart';
import 'texto_tema.dart';

mixin TemaPadrao {
  static ThemeData get() => ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color.fromARGB(255, 0, 141, 94)),
        textTheme: defaultTextTheme(),
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
            .copyWith(
                secondary: 
                     const Color.fromARGB(255, 0, 255, 170)),
      );
}
