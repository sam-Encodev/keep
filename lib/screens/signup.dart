import 'package:flutter/material.dart';
import 'package:keep/forms/signup.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/routes/route_names.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              getStarted,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 50,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SignupForm(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  haveAnAccount,
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                TextButton(
                    onPressed: () => context.go(RouteNames.login),
                    child: const Text(
                      login,
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
