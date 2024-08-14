import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  static const email = "Email";
  static const signUp = "Sign up";
  static const password = "Password";

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              fillColor: Colors.black12,
              filled: true,
              hintText: SignupForm.email,
              hintStyle: const TextStyle(color: Colors.white),
              prefixIcon: const Icon(Icons.account_circle, size: 30),
              enabledBorder: inputBorder(),
              focusedBorder: focusBorder(),
              errorBorder: inputBorder(),
              focusedErrorBorder: errorBorder(),
              errorStyle: errorStyle(),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return errorEntry;
              }
              return null;
            },
          ),
          const SizedBox(height: 18),
          TextFormField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            obscuringCharacter: "*",
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                fillColor: Colors.black12,
                filled: true,
                hintStyle: const TextStyle(color: Colors.white),
                hintText: SignupForm.password,
                prefixIcon: const Icon(Icons.password, size: 30),
                enabledBorder: inputBorder(),
                focusedBorder: focusBorder(),
                errorBorder: inputBorder(),
                focusedErrorBorder: errorBorder(),
                errorStyle: errorStyle()),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return errorEntry;
              }
              return null;
            },
          ),
          const SizedBox(height: 18),
          FilledButton(
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
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                  context.go("/");
                } else {
                  setState(() {});
                }
              },
              child: const Text(SignupForm.signUp,
                  style: TextStyle(color: Colors.redAccent, fontSize: 20))),
        ],
      ),
    );
  }
}
