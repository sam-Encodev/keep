import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/utilities/styles.dart';
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

  String? _email;
  String? _lastName;
  String? _firstName;
  String? _newPassword;
  String? _currentPassword;
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
          backgroundColor: Colors.black87,
          leading: Padding(
            padding: const EdgeInsets.all(spacing),
            child: IconButton(
                style: iconButtonStyle(),
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.arrow_back, size: 30),
                color: Colors.white,
                onPressed: () => {context.pop()}),
          ),
          title: const Text(profile,
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(spacing),
                    child: Text(name,
                        style: TextStyle(
                            color: Colors.white, fontSize: labelSize)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(spacing),
                    child: TextFormField(
                      key: const Key(name),
                      initialValue: userName,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          fillColor: Colors.black12,
                          filled: true,
                          enabledBorder: inputBorder(),
                          focusedBorder: focusBorder(),
                          errorBorder: inputBorder(),
                          focusedErrorBorder: errorBorder(),
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
                  const Padding(
                    padding: EdgeInsets.all(spacing),
                    child: Text(email,
                        style: TextStyle(
                            color: Colors.white, fontSize: labelSize)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(spacing),
                    child: TextFormField(
                      key: const Key(email),
                      initialValue: currentUser.email,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        fillColor: Colors.black12,
                        filled: true,
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

                        _email = value;
                        return null;
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(spacing),
                    child: Text(currentPassword,
                        style: TextStyle(
                            color: Colors.white, fontSize: labelSize)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(spacing),
                    child: TextFormField(
                      key: const Key(password),
                      initialValue: currentUser.password,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      obscuringCharacter: "*",
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          fillColor: Colors.black12,
                          filled: true,
                          enabledBorder: inputBorder(),
                          focusedBorder: focusBorder(),
                          errorBorder: inputBorder(),
                          focusedErrorBorder: errorBorder(),
                          errorStyle: errorStyle()),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return errorEntry;
                        }
                        _currentPassword = value;
                        return null;
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(spacing),
                    child: Text(newPassword,
                        style: TextStyle(
                            color: Colors.white, fontSize: labelSize)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(spacing),
                    child: TextFormField(
                      key: const Key(confirmPassword),
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      obscuringCharacter: "*",
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          fillColor: Colors.black12,
                          filled: true,
                          enabledBorder: inputBorder(),
                          focusedBorder: focusBorder(),
                          errorBorder: inputBorder(),
                          focusedErrorBorder: errorBorder(),
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
                          } else {
                            setState(() {});
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
