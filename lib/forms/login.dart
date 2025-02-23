import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  bool _submitted = false;

  void submit() {
    setState(() => _submitted = true);
    if (_formKey.currentState!.validate()) {
      var res = ref.read(authNotifierProvider.notifier).login(
          email: _emailField.toString().toLowerCase(),
          password: _passwordField.toString());

      if (res == false) {
        snackBar(context, message: "Login failed");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                autofillHints: const [AutofillHints.email]),
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
                  hintStyle: hintStyle(context),
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
              onFieldSubmitted: (value) {
                TextInput.finishAutofillContext();
                submit();
              },
              keyboardType: TextInputType.visiblePassword,
              autofillHints: const [AutofillHints.password],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: spacing, vertical: minSpacing),
            child: FilledButton(
                key: const Key(login),
                style: buttonStyle(context),
                onPressed: submit,
                child: Text(login,
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
