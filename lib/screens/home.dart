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
          backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(appName,
            style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        actions: [
          IconButton(
            style: iconButtonStyle(context),
            icon: Icon(Icons.search, size: standardIcon),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () => context.push('/notes/search'),
          ),
          IconButton(
              style: iconButtonStyle(context),
              icon: Icon(
                isDarkMode ? Icons.wb_sunny : Icons.brightness_2,
                size: standardIcon,
              ),
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
                  icon: const Icon(
                    Icons.info,
                    size: standardIcon,
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () => {
                    Navigator.of(context).pop(),
                    context.push(RouteNames.about)
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.account_circle_rounded,
                    size: standardIcon,
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () => {
                    Navigator.of(context).pop(),
                    context.push(RouteNames.profile(currentUser.id))
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.logout,
                    size: standardIcon,
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () => {
                    Navigator.of(context).pop(),
                    ref.read(authNotifierProvider.notifier).logout()
                  },
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.only(left: 5, right: standardSpacing),
              child: Icon(
                Icons.more_vert,
                size: standardIcon,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(standardSpacing),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
          ),
          child: ListNotes()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/notes/new'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Icon(Icons.add,
            size: standardIcon, color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
