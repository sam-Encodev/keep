import 'package:keep/routes/route_names.dart';
import 'package:keep/providers/lean_providers.dart';
import 'package:keep/providers/router_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppState extends Notifier {
  @override
  build() {}

  void skipOnboard() {
    completeOnboarding();
  }

  void completeOnboarding() {
    ref.read(goRouterProvider).go(RouteName.home);
    ref.read(sharedPreferencesProvider).setBool("skipOnboard", true);
  }

  void loginState() {
    bool skipOnboard =
        ref.watch(sharedPreferencesProvider).getBool("skipOnboard") ?? false;

    if (skipOnboard) {
      return ref.read(goRouterProvider).go(RouteName.home);
    }
    ref.read(goRouterProvider).go(RouteName.onboard);
  }

  void logoutState() {
    ref.read(sharedPreferencesProvider).setBool("skipOnboard", false);
    ref.read(goRouterProvider).go(RouteName.login);
  }

  void homeState() {
    ref.read(goRouterProvider).go(RouteName.home);
  }
}

final appStateProvider = NotifierProvider(() {
  return AppState();
});
