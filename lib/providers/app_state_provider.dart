import 'dart:async';
import 'package:keep/routes/route_names.dart';
import 'package:keep/providers/hive_provider.dart';
import 'package:keep/providers/router_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppState extends Notifier {
  @override
  build() {
    return onBoardState();
  }

  void initializeApp() {
    Timer(
      const Duration(milliseconds: 2000),
      () {
        onBoardState();
      },
    );
  }

  void completeOnboarding() {
    ref.read(hiveProvider.notifier).update('onBoarded');
    ref.read(goRouterProvider).go(RouteNames.home);
  }

  void onBoardState() {
    var data = ref.watch(hiveProvider);

    if (data == 'onBoarded') {
      ref.read(goRouterProvider).go(RouteNames.home);
    } else {
      ref.read(goRouterProvider).go(RouteNames.onboard);
    }
  }
}

final appStateProvider = NotifierProvider(() {
  return AppState();
});
