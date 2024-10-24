import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/routes/route_names.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:keep/providers/auth_provider.dart';
import 'package:keep/providers/theme_provider.dart';
import 'package:keep/screens/notes/list_notes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isDarkMode = ref.watch(themeStateProvider);
    var currentUser = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(appName,
            style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        actions: [
          IconButton(
            style: iconButtonStyle(context),
            icon: const Icon(Icons.search),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () => context.push('/notes/search'),
          ),
          IconButton(
              style: iconButtonStyle(context),
              icon:
                  isDarkMode ? Icon(Icons.wb_sunny) : Icon(Icons.brightness_2),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () => {
                    ref.read(themeStateProvider.notifier).setTheme(),
                  }),
          CustomPopup(
            backgroundColor: Theme.of(context).colorScheme.surface,
            showArrow: false,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.info),
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () => {
                    Navigator.of(context).pop(),
                    context.push(RouteNames.about)
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.account_circle_rounded),
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () => {
                    Navigator.of(context).pop(),
                    context.push(RouteNames.profile(currentUser.id))
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.logout),
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () => {
                    Navigator.of(context).pop(),
                    ref.read(authNotifierProvider.notifier).logout()
                  },
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 10),
              child: Icon(
                color: Theme.of(context).colorScheme.secondary,
                Icons.more_vert,
                opticalSize: 10.0,
              ),
            ),
          ),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
          ),
          child: ListNotes()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/notes/new'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Icon(Icons.add,
            size: 30, color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
