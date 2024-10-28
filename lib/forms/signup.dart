import 'package:flutter/material.dart';
import 'package:keep/models/user.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/components/snack_bar.dart';
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
            padding: const EdgeInsets.symmetric(
                horizontal: spacing, vertical: minSpacing),
            child: TextFormField(
              key: const Key(firstName),
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.surfaceContainer,
                filled: true,
                hintText: firstName,
                hintStyle:
                    TextStyle(color: Colors.grey[500]),
                prefixIcon: Icon(
                  Icons.account_circle,
                  size: standardIcon,
                  color: Theme.of(context).colorScheme.primary,
                ),
                enabledBorder: inputBorder(context),
                focusedBorder: focusBorder(context),
                errorBorder: inputBorder(context),
                focusedErrorBorder: errorBorder(context),
                errorStyle: errorStyle(context),
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
            padding: const EdgeInsets.symmetric(
                horizontal: spacing, vertical: minSpacing),
            child: TextFormField(
              key: const Key(lastName),
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.surfaceContainer,
                filled: true,
                hintText: lastName,
                hintStyle:
                    TextStyle(color: Colors.grey[500]),
                prefixIcon: Icon(
                  Icons.account_circle,
                  size: standardIcon,
                  color: Theme.of(context).colorScheme.primary,
                ),
                enabledBorder: inputBorder(context),
                focusedBorder: focusBorder(context),
                errorBorder: inputBorder(context),
                focusedErrorBorder: errorBorder(context),
                errorStyle: errorStyle(context),
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
            padding: const EdgeInsets.symmetric(
                horizontal: spacing, vertical: minSpacing),
            child: TextFormField(
              key: const Key(email),
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.surfaceContainer,
                filled: true,
                hintText: email,
                hintStyle:
                    TextStyle(color: Colors.grey[500]),
                prefixIcon: Icon(
                  Icons.email,
                  size: formIcons,
                  color: Theme.of(context).colorScheme.primary,
                ),
                enabledBorder: inputBorder(context),
                focusedBorder: focusBorder(context),
                errorBorder: inputBorder(context),
                focusedErrorBorder: errorBorder(context),
                errorStyle: errorStyle(context),
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
            padding: const EdgeInsets.symmetric(
                horizontal: spacing, vertical: minSpacing),
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
                  hintStyle: TextStyle(
                      color: Colors.grey[500]),
                  prefixIcon: Icon(
                    Icons.password,
                    size: formIcons,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  enabledBorder: inputBorder(context),
                  focusedBorder: focusBorder(context),
                  errorBorder: inputBorder(context),
                  focusedErrorBorder: errorBorder(context),
                  errorStyle: errorStyle(context)),
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
            padding: const EdgeInsets.symmetric(
                horizontal: spacing, vertical: minSpacing),
            child: FilledButton(
                key: const Key(signUp),
                style: buttonStyle(context),
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    // Process data.
                    var res = ref.read(authNotifierProvider.notifier).signup(
                        User(
                            id: index,
                            firstName: _firstNameField.toString(),
                            lastName: _lastNameField.toString(),
                            createdAt: _timestamp,
                            email: _emailField.toString().toLowerCase(),
                            password: _passwordField.toString()));

                    if (res == false) {
                      snackBar(context, message: "Email already exists");
                    }
                  } else {
                    setState(() {});
                  }
                },
                child: Text(signUp,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primaryFixed,
                        fontSize: standardFont))),
          ),
        ],
      ),
    );
  }
}
