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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.all(standardSpacing),
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              welcomeBack,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const LoginForm(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  noAccount,
                ),
                TextButton(
                    onPressed: () => {context.push(RouteName.signup)},
                    child: Text(
                      signUp,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
