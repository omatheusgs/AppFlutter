import 'package:flutter/material.dart';

TextTheme defaultTextTheme() => const TextTheme(
      displaySmall: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 45,
        color: Color.fromARGB(255, 0, 255, 170),
      ),
      labelLarge: TextStyle(
        fontFamily: 'OpenSans',
      ),
      bodySmall: TextStyle(
        fontFamily: 'NotoSans',
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Color.fromARGB(255, 0, 141, 94),
      ),
      displayLarge: TextStyle(fontFamily: 'Quicksand'),
      displayMedium: TextStyle(fontFamily: 'Quicksand'),
      headlineMedium: TextStyle(fontFamily: 'Quicksand'),
      headlineSmall: TextStyle(fontFamily: 'NotoSans'),
      titleLarge: TextStyle(fontFamily: 'NotoSans'),
      titleMedium: TextStyle(fontFamily: 'NotoSans'),
      bodyLarge: TextStyle(fontFamily: 'NotoSans'),
      bodyMedium: TextStyle(fontFamily: 'NotoSans'),
      titleSmall: TextStyle(fontFamily: 'NotoSans'),
      labelSmall: TextStyle(fontFamily: 'NotoSans'),
    );
