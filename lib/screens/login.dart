import 'package:flutter/material.dart';
import 'package:keep/forms/login.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/routes/route_names.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(standardSpacing),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              welcomeBack,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: maxFont,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const LoginForm(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  noAccount,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                TextButton(
                    onPressed: () => {context.go(RouteNames.signup)},
                    child: Text(
                      signUp,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
