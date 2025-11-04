import 'package:keep/models/user.dart';
import 'package:keep/providers/auth_provider.dart';
import 'package:keep/providers/app_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends Notifier<List<User>> {
  @override
  List<User> build() => [
        User(
            id: 0,
            email: "game@gmail.com",
            password: "12345",
            createdAt: "2024-03-02T15:18:29.922343",
            updatedAt: "2024-03-02T15:18:29.922343",
            firstName: "Ivan",
            lastName: "Gameli"),
        User(
            id: 1,
            email: "kwame@gmail.com",
            password: "12345",
            createdAt: "2024-09-09T18:09:01.922343",
            updatedAt: "2024-09-09T18:09:01.922343",
            firstName: "Kwame",
            lastName: "Opam"),
        User(
            id: 2,
            email: "doe@gmail.com",
            password: "12345",
            createdAt: DateTime.timestamp().toString(),
            updatedAt: DateTime.timestamp().toString(),
            firstName: "John",
            lastName: "Doe"),
      ];

  Object findUser(email, password) {
    var data = state.where((p) => p.email == email).toList();

    if (data.isEmpty) {
      return false;
    }

    if (data.first.email == email && data.first.password == password) {
      ref.read(authNotifierProvider.notifier).setUser(data.first);
      ref.read(appStateProvider.notifier).loginState();
      return true;
    }

    return false;
  }

  Object addUser(User user) {
    var data = state.where((p) => p.email == user.email).toList();

    if (data.isEmpty) {
      state = [...state, user];
      ref.read(authNotifierProvider.notifier).setUser(user);
      ref.read(appStateProvider.notifier).loginState();
      return true;
    }
    return false;
  }

  Object editUser(User user, newPassword) {
    var oldUser = state.where((p) => p.id == user.id).toList();

    if (oldUser.isEmpty) {
      return false;
    }

    if (oldUser.first.password == newPassword) {
      return false;
    }

    if (oldUser.first.password != newPassword) {
      oldUser.first.password = newPassword;
      oldUser.first.updatedAt = user.updatedAt;
      oldUser.first.firstName = user.firstName;
      oldUser.first.lastName = user.lastName;
      state = [...state];

      var update = User(
          id: oldUser.first.id,
          password: newPassword,
          lastName: user.lastName,
          firstName: user.firstName,
          updatedAt: user.updatedAt,
          email: oldUser.first.email,
          createdAt: oldUser.first.createdAt);

      ref.read(authNotifierProvider.notifier).setUser(update);
      return true;
    }

    return false;
  }
}

final userNotifierProvider = NotifierProvider<UserNotifier, List<User>>(() {
  return UserNotifier();
});
