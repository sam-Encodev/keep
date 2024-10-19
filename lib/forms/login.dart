import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/constants/widgets.dart';
import 'package:keep/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _emailField;
  String? _passwordField;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
                key: const Key(login),
                style: buttonStyle(),
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    // Process data.
                    var res = ref.read(authNotifierProvider.notifier).login(
                        email: _emailField.toString().toLowerCase(),
                        password: _passwordField.toString());

                    if (res == false) {
                      snackBar(context, "Login", "invalid");
                    }
                  }
                },
                child: const Text(login,
                    style: TextStyle(color: Colors.redAccent, fontSize: 20))),
          ),
        ],
      ),
    );
  }
}
