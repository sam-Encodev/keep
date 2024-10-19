import 'package:keep/models/user.dart';
import 'package:keep/providers/user_provider.dart';
import 'package:keep/providers/app_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class AuthNotifier extends Notifier {
  @override
  build() {
    return User(
        id: 0,
        email: "",
        password: "",
        createdAt: "",
        updatedAt: "",
        firstName: "",
        lastName: "");
  }

  void setUser(User user) {
    state = User(
        id: user.id,
        email: user.email,
        password: user.password,
        lastName: user.lastName,
        createdAt: user.createdAt,
        updatedAt: user.updatedAt,
        firstName: user.firstName);
  }

  Object signup(User user) {
    return ref.read(userNotifierProvider.notifier).addUser(user);
  }

  Object login({email, password}) {
    return ref.read(userNotifierProvider.notifier).findUser(email, password);
  }

  Object edit(User user, newPassword) {
    return ref.read(userNotifierProvider.notifier).editUser(user, newPassword);
  }

  void logout() {
    state = User(
        id: 0,
        email: "",
        password: "",
        lastName: "",
        createdAt: "",
        updatedAt: "",
        firstName: "");
    ref.read(appStateProvider.notifier).logoutState();
  }
}

final authNotifierProvider = NotifierProvider(() {
  return AuthNotifier();
});
