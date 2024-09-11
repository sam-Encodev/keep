import 'package:go_router/go_router.dart';
import 'package:keep/routes/route_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return router();
});
