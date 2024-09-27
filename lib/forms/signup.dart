import 'package:flutter/material.dart';
import 'package:keep/models/user.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/utilities/ffaker.dart';
import 'package:keep/providers/auth_provider.dart';
import 'package:keep/providers/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupForm extends ConsumerStatefulWidget {
  const SignupForm({super.key});

  @override
  ConsumerState<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends ConsumerState<SignupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _emailField;
  String? _passwordField;
  final lastName = Ffaker().faker.name.lastName();
  final firstName = Ffaker().faker.name.firstName();
  final String _timestamp = DateTime.timestamp().toString();

  @override
  Widget build(BuildContext context) {
    var getUsers = ref.watch(userNotifierProvider);
    var index = getUsers.length;

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
              hintText: email,
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
              _emailField = value;
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
                hintText: password,
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
              _passwordField = value;
              return null;
            },
          ),
          const SizedBox(height: 18),
          FilledButton(
              style: buttonStyle(),
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                  ref.read(authNotifierProvider.notifier).signup(User(
                      id: index,
                      lastName: lastName,
                      firstName: firstName,
                      createdAt: _timestamp,
                      email: _emailField.toString(),
                      password: _passwordField.toString()));
                } else {
                  setState(() {});
                }
              },
              child: const Text(signUp,
                  style: TextStyle(color: Colors.redAccent, fontSize: 20))),
        ],
      ),
    );
  }
}
