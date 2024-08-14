import 'package:flutter/material.dart';
import 'package:keep/forms/login.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  static const signUp = "Sign up";
  static const getStarted = "Welcome Back";
  static const user = "Don't have an account?";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final bool _validate = false;

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
              Login.getStarted,
              style: TextStyle(
                fontSize: 80,
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
                  Login.user,
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                    onPressed: () => {context.go("/signup")},
                    child: const Text(
                      Login.signUp,
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
