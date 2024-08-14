import '../screens/home.dart';
import '../screens/about.dart';
import '../screens/login.dart';
import '../screens/signup.dart';
import '../screens/error_screen.dart';

import '../screens/notes/add_note.dart';
import '../screens/notes/view_note.dart';
import '../screens/notes/edit_note.dart';
import '../screens/notes/search_note.dart';

import '../screens/welcome/first_page.dart';
import '../screens/welcome/second_page.dart';
import '../screens/welcome/third_page.dart';

import 'package:go_router/go_router.dart';

/// The route configuration.
GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Home(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const About(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const Signup(),
    ),
    GoRoute(
      path: '/welcome/first',
      builder: (context, state) => const FirstPage(),
    ),
    GoRoute(
      path: '/welcome/second',
      builder: (context, state) => const SecondPage(),
    ),
    GoRoute(
      path: '/welcome/third',
      builder: (context, state) => const ThirdPage(),
    ),
    GoRoute(
      path: '/notes/new',
      builder: (context, state) => const AddNote(),
    ),
    GoRoute(
      path: '/notes/:noteId',
      builder: (context, state) => ViewNote(),
    ),
    GoRoute(
      path: '/notes/edit/:noteId',
      builder: (context, state) => const EditNote(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchNote(),
    ),
  ],
  errorBuilder: (context, state) => const ErrorScreen(),
  debugLogDiagnostics: true,
);
