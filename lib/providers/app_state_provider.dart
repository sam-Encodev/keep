import 'package:keep/routes/route_names.dart';
import 'package:keep/providers/router_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppState extends Notifier {
  @override
  build() {}

  void completeOnboarding() {
    ref.read(goRouterProvider).go(RouteNames.home);
  }

  void loginState() {
    ref.read(goRouterProvider).go(RouteNames.onboard);
  }

  void logoutState() {
    ref.read(goRouterProvider).go(RouteNames.login);
  }

  void homeState() {
    ref.read(goRouterProvider).go(RouteNames.home);
  }
}

final appStateProvider = NotifierProvider(() {
  return AppState();
});
