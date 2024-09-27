import 'package:keep/models/user.dart';
import 'package:keep/utilities/ffaker.dart';
import 'package:keep/routes/route_names.dart';
import 'package:keep/providers/auth_provider.dart';
import 'package:keep/providers/router_provider.dart';
import 'package:keep/providers/app_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class UserNotifier extends Notifier<List<User>> {
  @override
  List<User> build() => [
        User(
            id: 0,
            email: "game@gmail.com",
            password: "12345",
            createdAt: "2024-03-02T15:18:29.922343",
            updatedAt: "2024-03-02T15:18:29.922343",
            firstName: Ffaker().faker.name.lastName(),
            lastName: Ffaker().faker.name.lastName()),
        User(
            id: 1,
            email: "sleep@gmail.com",
            password: "12345",
            createdAt: "2024-09-09T18:09:01.922343",
            updatedAt: "2024-09-09T18:09:01.922343",
            firstName: Ffaker().faker.name.lastName(),
            lastName: Ffaker().faker.name.lastName()),
        User(
            id: 2,
            email: "doe@gmail.com",
            password: "12345",
            createdAt: DateTime.timestamp().toString(),
            updatedAt: DateTime.timestamp().toString(),
            firstName: Ffaker().faker.name.lastName(),
            lastName: Ffaker().faker.name.lastName()),
      ];

  void findUser(User user) {
    var data = state.where((p) => p.email == user.email).toList().first;
    if (data.password == user.password) {
      ref.read(authNotifierProvider.notifier).setUser(user);
      ref.read(appStateProvider.notifier).onBoardState();
    } else {}
  }

  void addUser(User user) {
    if (!state.contains(user)) {
      state = [...state, user];
      ref.read(goRouterProvider).go(RouteNames.login);
    }
  }

  void editUser(User user) {
    var oldUser = state.where((p) => p.id == user.id);
    oldUser.first.email = user.email;
    oldUser.first.password = user.password;
    oldUser.first.updatedAt = user.updatedAt;
    oldUser.first.firstName = user.firstName;
    oldUser.first.lastName = user.lastName;

    state = [...state];
    ref.read(authNotifierProvider.notifier).setUser(user);
  }
}

final userNotifierProvider = NotifierProvider<UserNotifier, List<User>>(() {
  return UserNotifier();
});
