import 'dart:io';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// The [AppTheme] defines light and dark themes for the app.
///
/// Theme setup for FlexColorScheme package v8.
/// Use same major flex_color_scheme package version. If you use a
/// lower minor version, some properties may not be supported.
/// In that case, remove them after copying this theme to your
/// app or upgrade package to version 8.0.0-dev.2.
///
/// Use in [MaterialApp] like this:
///
/// MaterialApp(
///  theme: AppTheme.light,
///  darkTheme: AppTheme.dark,
///  :
/// );
///
///
TextTheme _textTheme = TextTheme(
  displayLarge: TextStyle(fontSize: 57),
  displayMedium: Platform.isIOS ? TextStyle(fontSize: 45) : TextStyle(fontSize: 47),
  displaySmall: Platform.isIOS ? TextStyle(fontSize: 36) : TextStyle(fontSize: 38),
  headlineLarge: Platform.isIOS ? TextStyle(fontSize: 32) : TextStyle(fontSize: 34),
  headlineMedium: Platform.isIOS ? TextStyle(fontSize: 28) : TextStyle(fontSize: 30),
  headlineSmall: Platform.isIOS ? TextStyle(fontSize: 24) : TextStyle(fontSize: 26),
  titleLarge: Platform.isIOS ? TextStyle(fontSize: 22) : TextStyle(fontSize: 24),
  titleMedium: Platform.isIOS ? TextStyle(fontSize: 16) : TextStyle(fontSize: 18),
  titleSmall: Platform.isIOS ? TextStyle(fontSize: 14) : TextStyle(fontSize: 16),
  bodyLarge: Platform.isIOS ? TextStyle(fontSize: 16) : TextStyle(fontSize: 18),
  bodyMedium: Platform.isIOS ? TextStyle(fontSize: 14) : TextStyle(fontSize: 16),
  bodySmall: Platform.isIOS ? TextStyle(fontSize: 12) : TextStyle(fontSize: 14),
  labelLarge: Platform.isIOS ? TextStyle(fontSize: 14, letterSpacing: 0.5) : TextStyle(fontSize: 16, letterSpacing: 0.5),
  labelMedium: Platform.isIOS ? TextStyle(fontSize: 12) : TextStyle(fontSize: 15),
  labelSmall: Platform.isIOS ? TextStyle(fontSize: 11) : TextStyle(fontSize: 13),
);

sealed class AppTheme {
  // The defined light theme.
  static ThemeData light = FlexThemeData.light(
    scheme: FlexScheme.blackWhite,
    textTheme: _textTheme,
    primaryTextTheme: _textTheme,
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
  // The defined dark theme.
  static ThemeData dark = FlexThemeData.dark(
    scheme: FlexScheme.blackWhite,
    textTheme: _textTheme,
    primaryTextTheme: _textTheme,
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      blendOnColors: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}
