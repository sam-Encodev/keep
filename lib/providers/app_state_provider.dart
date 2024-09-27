import 'package:keep/routes/route_names.dart';
import 'package:keep/providers/hive_provider.dart';
import 'package:keep/providers/router_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppState extends Notifier {
  @override
  build() {
    return null;
  }

  void completeOnboarding() {
    redirectHome();
  }

  void redirectLogin() {
    ref.read(goRouterProvider).go(RouteNames.login);
    ref.read(hiveProvider.notifier).update('');
  }

  void redirectHome() {
    ref.read(goRouterProvider).go(RouteNames.home);
  }

  void redirectOnBoard() {
    ref.read(goRouterProvider).go(RouteNames.onboard);
  }
}

final appStateProvider = NotifierProvider(() {
  return AppState();
});
