import 'package:flutter/material.dart';
import 'package:keep/forms/login.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/constants/text.dart';
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
        backgroundColor: Colors.black87,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black87,
        ),
        child: Column(
          children: [
            Text(
              welcomeBack,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const LoginForm(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  noAccount,
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                    onPressed: () => {context.go(RouteNames.signup)},
                    child: const Text(
                      signUp,
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
