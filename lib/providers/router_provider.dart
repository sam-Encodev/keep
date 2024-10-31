import 'package:flutter/material.dart';
import 'package:keep/screens/home.dart';
import 'package:keep/screens/about.dart';
import 'package:keep/screens/login.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/screens/signup.dart';
import 'package:keep/screens/profile.dart';
import 'package:keep/screens/settings.dart';
import 'package:keep/screens/onboarding.dart';
import 'package:keep/routes/route_names.dart';
import 'package:keep/screens/error_screen.dart';
import 'package:keep/screens/notes/add_note.dart';
import 'package:keep/screens/notes/view_note.dart';
import 'package:keep/screens/notes/edit_note.dart';
import 'package:keep/screens/notes/search_note.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorNotes = GlobalKey<NavigatorState>(debugLabel: 'notes');
final _shellNavigatorOther = GlobalKey<NavigatorState>(debugLabel: 'other');

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteNames.login,
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorNotes,
          builder: (context, state, child) {
            return Scaffold(
              body: child,
            );
          },
          routes: [
            GoRoute(
                path: RouteNames.home,
                builder: (context, state) {
                  return Home();
                },
                routes: [
                  GoRoute(
                    name: "add-note",
                    path: RouteNames.add,
                    builder: (context, state) => const AddNote(),
                  ),
                  GoRoute(
                    name: "search-note",
                    path: RouteNames.search,
                    builder: (context, state) => const SearchNote(),
                  ),
                  GoRoute(
                    name: "view-note",
                    path: RouteNames.view,
                    builder: (context, state) => const ViewNote(),
                  ),
                  GoRoute(
                    name: "edit-note",
                    path: RouteNames.edit,
                    builder: (context, state) => const EditNote(),
                  )
                ])
          ]),
      ShellRoute(
          navigatorKey: _shellNavigatorOther,
          builder: (context, state, child) {
            return Scaffold(
              body: child,
            );
          },
          routes: [
            GoRoute(
              path: RouteNames.login,
              builder: (context, state) {
                return Login();
              },
            ),
            GoRoute(
              path: RouteNames.signup,
              builder: (context, state) {
                return Signup();
              },
            ),
            GoRoute(
              path: RouteNames.about,
              builder: (context, state) {
                return About();
              },
            ),
            GoRoute(
              path: RouteNames.settings,
              builder: (context, state) {
                return Settings();
              },
            ),
            GoRoute(
              path: RouteNames.onboard,
              builder: (context, state) {
                return Onboarding();
              },
            ),
            GoRoute(
              path: RouteNames.profile(":userId"),
              builder: (context, state) {
                return Profile();
              },
            )
          ])
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
    debugLogDiagnostics: true,
  );
});