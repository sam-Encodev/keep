import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeState extends Notifier {
  @override
  build() {
    return ThemeMode.system;
  }

  void setTheme(value) {
    state = value;
  }
}

final themeStateProvider = NotifierProvider(() {
  return ThemeState();
});
