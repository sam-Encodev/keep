import 'package:flutter/material.dart';
import 'package:keep/models/user.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/components/go_back.dart';
import 'package:keep/components/snack_bar.dart';
import 'package:keep/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState<Profile> createState() => _Profile();
}

class _Profile extends ConsumerState<Profile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: GoBack(),
          title: Text(profile, style: TextStyle(fontSize: standardFont)),
        ),
        body: Container(
          padding: const EdgeInsets.all(standardSpacing),
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
                  Text(name, style: TextStyle(fontSize: labelSize)),
                  Padding(
                    padding: const EdgeInsets.all(spacing),
                    child: TextFormField(
                      key: const Key(name),
                      initialValue: userName,
                      decoration: InputDecoration(
                          fillColor: inputFillColor(context),
                          filled: true,
                          enabledBorder: inputBorder(context),
                          focusedBorder: focusBorder(context),
                          errorBorder: inputBorder(context),
                          focusedErrorBorder: errorBorder(context),
                          errorStyle: errorStyle(context)),
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
                  Text(email, style: TextStyle(fontSize: labelSize)),
                  Padding(
                    padding: const EdgeInsets.all(spacing),
                    child: TextFormField(
                      readOnly: true,
                      key: const Key(email),
                      initialValue: currentUser.email,
                      decoration: InputDecoration(
                        fillColor: inputFillColor(context),
                        filled: true,
                        enabledBorder: inputBorder(context),
                        focusedBorder: focusBorder(context),
                        errorBorder: inputBorder(context),
                        focusedErrorBorder: errorBorder(context),
                        errorStyle: errorStyle(context),
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
                  Text(currentPassword, style: TextStyle(fontSize: labelSize)),
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
                      decoration: InputDecoration(
                          fillColor: inputFillColor(context),
                          filled: true,
                          enabledBorder: inputBorder(context),
                          focusedBorder: focusBorder(context),
                          errorBorder: inputBorder(context),
                          focusedErrorBorder: errorBorder(context),
                          errorStyle: errorStyle(context)),
                      validator: (String? value) {
                        // if (value == null || value.isEmpty) {
                        //   return errorEntry;
                        // }
                        // _currentPassword = value;
                        // return null;
                      },
                    ),
                  ),
                  Text(newPassword, style: TextStyle(fontSize: labelSize)),
                  Padding(
                    padding: const EdgeInsets.all(spacing),
                    child: TextFormField(
                      key: const Key(confirmPassword),
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          fillColor: inputFillColor(context),
                          filled: true,
                          enabledBorder: inputBorder(context),
                          focusedBorder: focusBorder(context),
                          errorBorder: inputBorder(context),
                          focusedErrorBorder: errorBorder(context),
                          errorStyle: errorStyle(context)),
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
                        style: buttonStyle(context),
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

                            if (res == true) {
                              snackBar(context, message: "Update successful");
                            } else {
                              snackBar(context, message: "Update failed");
                            }
                          }
                        },
                        child: Text(updateProfile,
                            style: TextStyle(fontSize: standardFont))),
                  ),
                ]),
          ),
        ));
  }
}
