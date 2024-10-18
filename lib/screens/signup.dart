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
            const Text(
              getStarted,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SignupForm(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  haveAnAccount,
                  style: TextStyle(color: Colors.white),
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
