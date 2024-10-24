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
    var currentUser = ref.watch(authNotifierProvider);
    var isDarkMode = ref.watch(themeStateProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(appName, style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          IconButton(
            style: iconButtonStyle(),
            icon: const Icon(Icons.search),
            color: Colors.white,
            onPressed: () => context.push('/notes/search'),
          ),
          IconButton(
              style: iconButtonStyle(),
              icon:
                  isDarkMode ? Icon(Icons.wb_sunny) : Icon(Icons.brightness_2),
              color: Colors.white,
              onPressed: () => {
                    ref.read(themeStateProvider.notifier).setTheme(),
                  }),
          CustomPopup(
            backgroundColor: Colors.black87,
            showArrow: false,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.info),
                  color: Colors.white,
                  onPressed: () => {
                    Navigator.of(context).pop(),
                    context.push(RouteNames.about)
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.account_circle_rounded),
                  color: Colors.white,
                  onPressed: () => {
                    Navigator.of(context).pop(),
                    context.push(RouteNames.profile(currentUser.id))
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.logout),
                  color: Colors.white,
                  onPressed: () => {
                    Navigator.of(context).pop(),
                    ref.read(authNotifierProvider.notifier).logout()
                  },
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 10),
              child: const Icon(
                color: Colors.white,
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
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          child: ListNotes()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/notes/new'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black54,
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
