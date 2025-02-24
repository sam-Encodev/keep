import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keep/models/user.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/date.dart';
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
  final String _timestamp = timestamp;
  bool _submitted = false;

  void submit(index) {
    setState(() => _submitted = true);
    if (_formKey.currentState!.validate()) {
      var res = ref.read(authNotifierProvider.notifier).signup(User(
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
  }

  @override
  Widget build(BuildContext context) {
    var getUsers = ref.watch(userNotifierProvider);
    var index = getUsers.length;

    return Form(
      key: _formKey,
      autovalidateMode: _submitted
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: spacing, vertical: minSpacing),
            child: TextFormField(
               autofocus: true,
              key: const Key(firstName),
              style: TextStyle(),
              decoration: InputDecoration(
                fillColor: inputFillColor(context),
                filled: true,
                hintText: firstName,
                hintStyle: hintStyle(context),
                prefixIcon: Icon(
                  Icons.account_circle,
                  size: standardIcon,
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
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              autofillHints: const [AutofillHints.givenName],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: spacing, vertical: minSpacing),
            child: TextFormField(
              key: const Key(lastName),
              style: TextStyle(),
              decoration: InputDecoration(
                fillColor: inputFillColor(context),
                filled: true,
                hintText: lastName,
                hintStyle: hintStyle(context),
                prefixIcon: Icon(
                  Icons.account_circle,
                  size: standardIcon,
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
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              autofillHints: const [AutofillHints.familyName],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: spacing, vertical: minSpacing),
            child: TextFormField(
              key: const Key(email),
              style: TextStyle(),
              decoration: InputDecoration(
                fillColor: inputFillColor(context),
                filled: true,
                hintText: email,
                hintStyle: hintStyle(context),
                prefixIcon: Icon(
                  Icons.email,
                  size: formIcons,
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
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
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
              style: TextStyle(),
              decoration: InputDecoration(
                  fillColor: inputFillColor(context),
                  filled: true,
                  hintText: password,
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  prefixIcon: Icon(
                    Icons.password,
                    size: formIcons,
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
              onFieldSubmitted: (_) {
                TextInput.finishAutofillContext();
                submit(index);
              },
              keyboardType: TextInputType.visiblePassword,
              autofillHints: const [AutofillHints.password],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: spacing, vertical: minSpacing),
            child: FilledButton(
                key: const Key(signUp),
                style: buttonStyle(context),
                onPressed: () => submit(index),
                child: Text(signUp,
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.titleLarge!.fontSize,
                        color: Theme.of(context).colorScheme.onPrimary))),
          ),
        ],
      ),
    );
  }
}
