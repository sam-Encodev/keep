import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:keep/models/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeState extends Notifier {
  @override
  build() {
    return Themer(
      theme: ThemeMode.system,
      isDark: getThemeState(),
    );
  }

  void setTheme() {
    if (state.isDark == !getThemeState()) {
      state = Themer(theme: ThemeMode.dark, isDark: true);
    } else {
      state = Themer(theme: ThemeMode.light, isDark: false);
    }
  }

  bool getThemeState() {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark;
  }
}

final themeStateProvider = NotifierProvider(() {
  return ThemeState();
});
