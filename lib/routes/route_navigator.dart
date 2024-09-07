import 'package:keep/routes/routes.dart';
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
  initialLocation: '/onboard',
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: Routes.about,
      builder: (context, state) => const About(),
    ),
    GoRoute(
      path: Routes.onboard,
      builder: (context, state) => const Onboarding(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: Routes.signup,
      builder: (context, state) => const Signup(),
    ),
    GoRoute(
      path: Routes.notesNew,
      builder: (context, state) => const AddNote(),
    ),
    GoRoute(
      path: Routes.notesNoteId,
      builder: (context, state) => const ViewNote(),
    ),
    GoRoute(
      path: Routes.notesEditNoteId,
      builder: (context, state) => const EditNote(),
    ),
    GoRoute(
      path: Routes.search,
      builder: (context, state) => const SearchNote(),
    ),
  ],
  errorBuilder: (context, state) => const ErrorScreen(),
  debugLogDiagnostics: true,
);
