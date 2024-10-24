import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeState extends Notifier {
  @override
  build() => false;

  void setTheme() {
    state = !state;
  }
}

final themeStateProvider = NotifierProvider(() {
  return ThemeState();
});
