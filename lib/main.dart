import 'package:flutter/material.dart';
import 'package:keep/screens/about.dart';
import 'package:keep/screens/error_screen.dart';
import 'package:keep/screens/home.dart';
import 'package:keep/screens/login.dart';
import 'package:keep/screens/signup.dart';

import 'package:keep/screens/notes/add_note.dart';
import 'package:keep/screens/notes/edit_note.dart';
import 'package:keep/screens/notes/search_note.dart';
import 'package:keep/screens/notes/view_note.dart';

import 'package:keep/screens/welcome/first_page.dart';
import 'package:keep/screens/welcome/second_page.dart';
import 'package:keep/screens/welcome/third_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

/// The route configuration.
final GoRouter _router = GoRouter(
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
      builder: (context, state) =>  ViewNote(),
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const notes = "Notes";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: notes,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
