import 'package:keep/screens/home.dart';
import 'package:keep/screens/about.dart';
import 'package:keep/screens/login.dart';
import 'package:keep/screens/signup.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/screens/onboarding.dart';
import 'package:keep/screens/error_screen.dart';
import 'package:keep/screens/notes/add_note.dart';
import 'package:keep/screens/notes/view_note.dart';
import 'package:keep/screens/notes/edit_note.dart';
import 'package:keep/screens/notes/search_note.dart';

/// The route configuration.
GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const About(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const Onboarding(),
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
      path: '/notes/new',
      builder: (context, state) => const AddNote(),
    ),
    GoRoute(
      path: '/notes/:noteId',
      builder: (context, state) => const ViewNote(),
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
