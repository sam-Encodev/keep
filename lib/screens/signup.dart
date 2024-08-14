import 'package:flutter/material.dart';
import 'package:keep/forms/signup.dart';
import 'package:go_router/go_router.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  static const login = "Login";
  static const getStarted = "Get Started";
  static const user = "Already have an account?";

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
              style: TextStyle(
                fontSize: 80,
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
                  user,
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                    onPressed: () => context.go("/login"),
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
