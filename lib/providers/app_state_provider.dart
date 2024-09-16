import 'dart:async';
import 'package:keep/utilities/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppState extends Notifier {
  late final bool _initialized = false;
  late final bool _loggedIn = false;
  late final bool _onboardingComplete = false;

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isOnboardingComplete => _onboardingComplete;

  @override
  build() {
    return _initialized;
  }

  void initializeApp() {
    Timer(
      const Duration(milliseconds: 2000),
      () {
        // _initialized = true;
        Logger.info("initialized");
      },
    );
  }

  void completeOnboarding() {
    Logger.info("onboardingComplete");
    // _onboardingComplete = true;
  }

  void login(String username, String password) {
    Logger.info("loggedIn");
    // _loggedIn = true;
  }

  void logout() {
    Logger.info("loggedOut");
    // _loggedIn = false;
    // _onboardingComplete = false;
    // _initialized = false;
    // initializeApp();
  }
}

final appStateProvider = NotifierProvider(() {
  return AppState();
});
