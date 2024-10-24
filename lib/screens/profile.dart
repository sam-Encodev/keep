import 'package:flutter/material.dart';
import 'package:keep/models/user.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/components/snack_bar.dart';
import 'package:keep/components/back_button.dart';
import 'package:keep/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState<Profile> createState() => _Profile();
}

class _Profile extends ConsumerState<Profile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static const spacing = 8.0;
  static const labelSize = 15.0;

  String? _lastName;
  String? _firstName;
  String? _newPassword;
  final String _updateAt = DateTime.timestamp().toString();

  @override
  Widget build(
    BuildContext context,
  ) {
    var currentUser = ref.watch(authNotifierProvider);
    var userName = currentUser.firstName + " " + currentUser.lastName;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.surface,
          leading: Padding(
            padding: const EdgeInsets.all(spacing),
            child: goBackButton(context),
          ),
          title: Text(profile,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 20)),
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(spacing),
                    child: Text(name,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: labelSize)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(spacing),
                    child: TextFormField(
                      key: const Key(name),
                      initialValue: userName,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                      decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.surfaceContainer,
                          filled: true,
                          enabledBorder: inputBorder(context),
                          focusedBorder: focusBorder(context),
                          errorBorder: inputBorder(context),
                          focusedErrorBorder: errorBorder(context),
                          errorStyle: errorStyle()),
                      validator: (String? value) {
                        final splitName = value?.split(' ');

                        if (value == null ||
                            value.isEmpty ||
                            splitName![0].isEmpty ||
                            splitName.length == 1) {
                          return errorEntry;
                        }

                        if (splitName.reversed.first.isEmpty) {
                          return errorLastNameEntry;
                        }

                        _firstName = splitName[0];
                        _lastName = splitName[1];

                        return null;
                      },
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.all(spacing),
                    child: Text(email,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: labelSize)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(spacing),
                    child: TextFormField(
                      readOnly: true,
                      key: const Key(email),
                      initialValue: currentUser.email,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).colorScheme.surfaceContainer,
                        filled: true,
                        enabledBorder: inputBorder(context),
                        focusedBorder: focusBorder(context),
                        errorBorder: inputBorder(context),
                        focusedErrorBorder: errorBorder(context),
                        errorStyle: errorStyle(),
                      ),
                      validator: (String? value) {
                        // if (value == null || value.isEmpty) {
                        //   return errorEntry;
                        // }
                        //
                        // _email = value;
                        // return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(spacing),
                    child: Text(currentPassword,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: labelSize)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(spacing),
                    child: TextFormField(
                      readOnly: true,
                      key: const Key(password),
                      initialValue: currentUser.password,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      obscuringCharacter: "*",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                      decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.surfaceContainer,
                          filled: true,
                          enabledBorder: inputBorder(context),
                          focusedBorder: focusBorder(context),
                          errorBorder: inputBorder(context),
                          focusedErrorBorder: errorBorder(context),
                          errorStyle: errorStyle()),
                      validator: (String? value) {
                        // if (value == null || value.isEmpty) {
                        //   return errorEntry;
                        // }
                        // _currentPassword = value;
                        // return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(spacing),
                    child: Text(newPassword,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: labelSize)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(spacing),
                    child: TextFormField(
                      key: const Key(confirmPassword),
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      obscuringCharacter: "*",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                      decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.surfaceContainer,
                          filled: true,
                          enabledBorder: inputBorder(context),
                          focusedBorder: focusBorder(context),
                          errorBorder: inputBorder(context),
                          focusedErrorBorder: errorBorder(context),
                          errorStyle: errorStyle()),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return errorEntry;
                        }
                        _newPassword = value;
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(spacing),
                    child: FilledButton(
                        style: buttonStyle(),
                        onPressed: () {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (_formKey.currentState!.validate()) {
                            // Process data.
                            var res =
                                ref.read(authNotifierProvider.notifier).edit(
                                    User(
                                      id: currentUser.id,
                                      firstName: _firstName.toString(),
                                      lastName: _lastName.toString(),
                                      updatedAt: _updateAt,
                                    ),
                                    _newPassword.toString());

                            if (res == false) {
                              snackBar(context, message: "Update failed");
                            }
                          }
                        },
                        child: const Text(updateProfile,
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 20))),
                  ),
                ]),
          ),
        ));
  }
}
