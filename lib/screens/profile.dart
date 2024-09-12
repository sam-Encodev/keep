import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/providers/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState<Profile> createState() => _Profile();
}

class _Profile extends ConsumerState<Profile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static const spacing = 18.0;
  static const labelSize = 13.0;
  static const labelSpacer = 12.0;

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
    final extraString = GoRouterState.of(context).pathParameters['userId'];
    var getUsers = ref.watch(userNotifierProvider);
    var transformUsers = getUsers.toList();
    var user = transformUsers[int.parse(extraString!)];

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black87,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.black87),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )),
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.arrow_back, size: 30),
              color: Colors.white,
              onPressed: () => context.pop(),
            ),
          ),
          title: const Text(profile,
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
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
                  const SizedBox(height: padding),
                  const Text(firstName,
                      style:
                          TextStyle(color: Colors.white, fontSize: labelSize)),
                  const SizedBox(height: labelSpacer),
                  TextFormField(
                    initialValue: user.firstName,
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

                      _firstName = value;
                      return null;
                    },
                  ),
                  const SizedBox(height: spacing),
                  const Text(lastName,
                      style:
                          TextStyle(color: Colors.white, fontSize: labelSize)),
                  const SizedBox(height: labelSpacer),
                  TextFormField(
                    initialValue: user.lastName,
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

                      _lastName = value;
                      return null;
                    },
                  ),
                  const SizedBox(height: spacing),
                  const Text(email,
                      style:
                          TextStyle(color: Colors.white, fontSize: labelSize)),
                  const SizedBox(height: labelSpacer),
                  TextFormField(
                    initialValue: user.email,
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
                  const SizedBox(height: spacing),
                  const Text(currentPassword,
                      style:
                          TextStyle(color: Colors.white, fontSize: labelSize)),
                  const SizedBox(height: labelSpacer),
                  TextFormField(
                    initialValue: user.password,
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
                  const SizedBox(height: spacing),
                  const Text(newPassword,
                      style:
                          TextStyle(color: Colors.white, fontSize: labelSize)),
                  const SizedBox(height: labelSpacer),
                  TextFormField(
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
                  const SizedBox(height: spacing),
                  FilledButton(
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
                  const SizedBox(height: spacing),
                ]),
          ),
        ));
  }
}
