import 'package:keep/screens/home.dart';
import 'package:keep/screens/about.dart';
import 'package:keep/screens/login.dart';
import 'package:keep/screens/signup.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/screens/onboarding.dart';
import 'package:keep/routes/route_names.dart';
import 'package:keep/screens/error_screen.dart';
import 'package:keep/screens/notes/add_note.dart';
import 'package:keep/screens/notes/view_note.dart';
import 'package:keep/screens/notes/edit_note.dart';
import 'package:keep/screens/notes/search_note.dart';

/// The route configuration.
GoRouter router([String? initialLocation]) => GoRouter(
      initialLocation: initialLocation ?? RouteNames.onboard,
      routes: [
        GoRoute(
          path: RouteNames.home,
          builder: (context, state) => const Home(),
        ),
        GoRoute(
          path: RouteNames.about,
          builder: (context, state) => const About(),
        ),
        GoRoute(
          path: RouteNames.onboard,
          builder: (context, state) => const Onboarding(),
        ),
        GoRoute(
          path: RouteNames.login,
          builder: (context, state) => const Login(),
        ),
        GoRoute(
          path: RouteNames.signup,
          builder: (context, state) => const Signup(),
        ),
        GoRoute(
          path: RouteNames.notesNew,
          builder: (context, state) => const AddNote(),
        ),
        GoRoute(
          path: RouteNames.notesNoteId("noteId"),
          builder: (context, state) => const ViewNote(),
        ),
        GoRoute(
          path: RouteNames.notesEditNoteId("noteId"),
          builder: (context, state) => const EditNote(),
        ),
        GoRoute(
          path: RouteNames.search,
          builder: (context, state) => const SearchNote(),
        ),
      ],
      errorBuilder: (context, state) => const ErrorScreen(),
      debugLogDiagnostics: true,
    );
