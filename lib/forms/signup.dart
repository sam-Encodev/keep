import 'package:flutter/material.dart';
import 'package:keep/models/user.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
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
  String? _lastNameField;
  String? _firstNameField;
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
          Padding(
            padding: const EdgeInsets.only(top: spacing),
            child: TextFormField(
              key: const Key(firstName),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.black12,
                filled: true,
                hintText: firstName,
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
                _firstNameField = value;
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: spacing),
            child: TextFormField(
              key: const Key(lastName),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.black12,
                filled: true,
                hintText: lastName,
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
                _lastNameField = value;
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: spacing),
            child: TextFormField(
              key: const Key(email),
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: spacing),
            child: TextFormField(
              key: const Key(password),
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: spacing),
            child: FilledButton(
                key: const Key(signUp),
                style: buttonStyle(),
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    // Process data.
                    ref.read(authNotifierProvider.notifier).signup(User(
                        id: index,
                        lastName: _firstNameField.toString(),
                        firstName: _lastNameField.toString(),
                        createdAt: _timestamp,
                        email: _emailField.toString(),
                        password: _passwordField.toString()));
                  } else {
                    setState(() {});
                  }
                },
                child: const Text(signUp,
                    style: TextStyle(color: Colors.redAccent, fontSize: 20))),
          ),
        ],
      ),
    );
  }
}
