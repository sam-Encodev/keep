import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/components/snack_bar.dart';
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
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.surfaceContainer,
                filled: true,
                hintText: email,
                hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                prefixIcon: const Icon(Icons.account_circle, size: formIcons),
                enabledBorder: inputBorder(context),
                focusedBorder: focusBorder(context),
                errorBorder: inputBorder(context),
                focusedErrorBorder: errorBorder(context),
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
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              decoration: InputDecoration(
                  fillColor: Theme.of(context).colorScheme.surfaceContainer,
                  filled: true,
                  hintText: password,
                  hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                  prefixIcon: const Icon(Icons.password, size: formIcons),
                  enabledBorder: inputBorder(context),
                  focusedBorder: focusBorder(context),
                  errorBorder: inputBorder(context),
                  focusedErrorBorder: errorBorder(context),
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
                      snackBar(context, message: "Login failed");
                    }
                  }
                },
                child: const Text(login,
                    style: TextStyle(color: Colors.redAccent, fontSize: standardFont))),
          ),
        ],
      ),
    );
  }
}
