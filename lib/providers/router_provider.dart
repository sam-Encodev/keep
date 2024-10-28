import 'package:flutter/material.dart';
import 'package:keep/screens/home.dart';
import 'package:keep/screens/about.dart';
import 'package:keep/screens/login.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/screens/settings.dart';
import 'package:keep/screens/signup.dart';
import 'package:keep/screens/profile.dart';
import 'package:keep/screens/onboarding.dart';
import 'package:keep/routes/route_names.dart';
import 'package:keep/screens/error_screen.dart';
import 'package:keep/screens/notes/add_note.dart';
import 'package:keep/screens/notes/view_note.dart';
import 'package:keep/screens/notes/edit_note.dart';
import 'package:keep/screens/notes/search_note.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteNames.login,
    redirect: (context, state) {
      return null;
    },
    routes: [
      GoRoute(
          name: 'notes',
          path: RouteNames.home,
          builder: (context, state) => const Home(),
          routes: [
            GoRoute(
              name: "add-note",
              path: RouteNames.newNote,
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
          ]),
      GoRoute(
        name: "about",
        path: RouteNames.about,
        builder: (context, state) => const About(),
      ),
      GoRoute(
        name: 'profile',
        path: RouteNames.profile(":userId"),
        builder: (context, state) => const Profile(),
      ),
      GoRoute(
        name: 'settings',
        path: RouteNames.settings,
        builder: (context, state) => const Settings(),
      ),
      GoRoute(
        name: 'onboard',
        path: RouteNames.onboard,
        builder: (context, state) => const Onboarding(),
      ),
      GoRoute(
        name: 'login',
        path: RouteNames.login,
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        name: 'signup',
        path: RouteNames.signup,
        builder: (context, state) => const Signup(),
      ),
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
    debugLogDiagnostics: true,
  );
});
