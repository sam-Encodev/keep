import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keep/models/user.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/date.dart';
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
  final String _updateAt = timestamp;
  bool _submitted = false;

  void submit(currentUserID) {
    setState(() => _submitted = true);
    if (_formKey.currentState!.validate()) {
      var res = ref.read(authNotifierProvider.notifier).edit(
          User(
            id: currentUserID,
            firstName: _firstName.toString(),
            lastName: _lastName.toString(),
            updatedAt: _updateAt,
          ),
          _newPassword.toString());

      if (res == true) {
        snackBar(context, message: "Update successful");
        _formKey.currentState?.reset();
      } else {
        snackBar(context, message: "Update failed");
      }
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    var currentUser = ref.watch(authNotifierProvider);
    var userName = '${currentUser.firstName} ${currentUser.lastName}';

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: GoBack(),
          title: Text(profile, style: Theme.of(context).textTheme.titleLarge),
        ),
        body: Container(
          padding: const EdgeInsets.all(standardSpacing),
          width: double.maxFinite,
          height: double.maxFinite,
          child: Form(
            key: _formKey,
            autovalidateMode: _submitted
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name, style: Theme.of(context).textTheme.labelLarge),
                  Padding(
                    padding: const EdgeInsets.all(spacing),
                    child: TextFormField(
                      autofocus: true,
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
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      autofillHints: const [AutofillHints.name],
                      textCapitalization: TextCapitalization.words,
                    ),
                  ),
                  Text(email, style: Theme.of(context).textTheme.labelLarge),
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
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.email],
                    ),
                  ),
                  Text(currentPassword,
                      style: Theme.of(context).textTheme.labelLarge),
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
                      onFieldSubmitted: (_) {
                        TextInput.finishAutofillContext();
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      autofillHints: const [AutofillHints.password],
                    ),
                  ),
                  Text(newPassword,
                      style: Theme.of(context).textTheme.labelLarge),
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
                      onFieldSubmitted: (_) {
                        TextInput.finishAutofillContext();
                        submit(currentUser.id);
                      },
                      keyboardType: TextInputType.visiblePassword,
                      autofillHints: const [AutofillHints.password],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(spacing),
                    child: FilledButton(
                        style: buttonStyle(context),
                        onPressed: () => submit(currentUser.id),
                        child: Text(updateProfile,
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color:
                                    Theme.of(context).colorScheme.onPrimary))),
                  ),
                ]),
          ),
        ));
  }
}
