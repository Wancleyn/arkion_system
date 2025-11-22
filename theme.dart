import 'package:flutter/material.dart';

class ArkionColors {
  static const Color blackQuantum = Color(0xFF050910);
  static const Color blueIon = Color(0xFF00C6FF);
  static const Color blueArkon = Color(0xFF1A6BFF);
  static const Color grafeno = Color(0xFF2E2E35);
  static const Color plasmaWhite = Color(0xFFF0F7FF);
  static const Color purpleQuantum = Color(0xFF7F4CFF);
  static const Color blueDeep = Color(0xFF0A1135);
}

final ThemeData arkionTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: ArkionColors.blackQuantum,
  fontFamily: 'Roboto',
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: ArkionColors.plasmaWhite,
      fontSize: 14,
    ),
  ),
  colorScheme: const ColorScheme.dark(
    primary: ArkionColors.blueIon,
    secondary: ArkionColors.purpleQuantum,
    surface: ArkionColors.grafeno,
  ),
);
