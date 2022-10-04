import 'package:flutter/material.dart';

class DefaultTheme {
  static final instance = DefaultTheme._();

  DefaultTheme._();

  ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
  );
}
