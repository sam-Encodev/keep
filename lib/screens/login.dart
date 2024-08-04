import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  static const getStarted = "Welcome Back";
  static const email = "Email";
  static const password = "Password";
  static const login = "Login";
  static const user = "Don't have an account?";
  static const signUp = "Sign up";

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
            TextField(
              decoration: InputDecoration(
                  fillColor: Colors.black12,
                  filled: true,
                  hintText: email,
                  hintStyle: const TextStyle(color: Colors.white),
                  prefixIcon: const Icon(Icons.account_circle, size: 30),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(color: Colors.black54),
                  )),
            ),
            const SizedBox(height: 18),
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.black12,
                filled: true,
                hintStyle: const TextStyle(color: Colors.white),
                hintText: password,
                prefixIcon: const Icon(Icons.password, size: 30),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(color: Colors.black12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(color: Colors.black54),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  user,
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                    onPressed: () => context.go("/signup"),
                    child: const Text(
                      signUp,
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            ),
            FilledButton(
                onPressed: () => context.go("/"),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  minimumSize:
                      WidgetStateProperty.all(const Size(double.infinity, 40)),
                  elevation: WidgetStateProperty.all(0),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: const Text(login,
                    style: TextStyle(color: Colors.redAccent, fontSize: 20))),
          ],
        ),
      ),
    );
  }
}
