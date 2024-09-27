import 'package:keep/routes/route_names.dart';
import 'package:keep/providers/hive_provider.dart';
import 'package:keep/providers/router_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppState extends Notifier {
  @override
  build() {}

  void completeOnboarding() {
    ref.read(hiveProvider.notifier).update('onBoard');
    loginState();
  }


  void redirectHome() {
    ref.read(goRouterProvider).go(RouteNames.home);
  }

  void redirectOnBoard() {
    ref.read(goRouterProvider).go(RouteNames.onboard);
  }

  void loginState() {
    var info = ref.watch(hiveProvider);
    if (info == "") {
      ref.read(appStateProvider.notifier).redirectOnBoard();
    } else {
      ref.read(appStateProvider.notifier).redirectHome();
    }
  }

  void logoutState() {
    ref.read(goRouterProvider).go(RouteNames.login);
  }
}

final appStateProvider = NotifierProvider(() {
  return AppState();
});
