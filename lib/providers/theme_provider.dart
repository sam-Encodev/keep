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

  void setDark() {
    state = Themer(theme: ThemeMode.dark, isDark: true);
    return;
  }

  void setLight() {
    state = Themer(theme: ThemeMode.light, isDark: false);
    return;
  }

  bool getThemeState() {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;

    if (brightness == Brightness.dark) {
      return true;
    } else {
      return false;
    }
  }
}

final themeStateProvider = NotifierProvider(() {
  return ThemeState();
});
