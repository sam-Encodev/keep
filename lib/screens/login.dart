import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/utilities/logger.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  static const getStarted = "Welcome Back";
  static const email = "Email";
  static const password = "Password";
  static const login = "Login";
  static const user = "Don't have an account?";
  static const signUp = "Sign up";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
            TextField(
              style: const TextStyle(color: Colors.white),
              controller: emailController,
              decoration: InputDecoration(
                  fillColor: Colors.black12,
                  filled: true,
                  hintText: Login.email,
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
              controller: passwordController,
              style: const TextStyle(color: Colors.white),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                fillColor: Colors.black12,
                filled: true,
                hintStyle: const TextStyle(color: Colors.white),
                hintText: Login.password,
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
            FilledButton(
                onPressed: () => {
                      if (validateInput(emailController.text) ||
                          validateInput(passwordController.text))
                        {Foo.func()}
                      else
                        {context.go("/")}
                    },
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
                child: const Text(Login.login,
                    style: TextStyle(color: Colors.redAccent, fontSize: 20))),
          ],
        ),
      ),
    );
  }
}

bool validateInput(String value) {
  bool errorStatus = false;

  if (value.isEmpty) {
    errorStatus = true;
  } else {
    errorStatus = false;
  }
  return errorStatus;
}
