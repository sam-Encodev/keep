import 'package:keep/menu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/routes/route_names.dart';
import 'package:keep/screens/notes/list_notes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(appName, style: Theme.of(context).textTheme.titleLarge),
        actions: [
          IconButton(
            style: iconButtonStyle(context),
            icon: Icon(Icons.search, size: standardIcon),
            onPressed: () => context.push(RouteNames.searchNote),
          ),
          CascadingMenu(),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(standardSpacing),
          width: double.maxFinite,
          height: double.maxFinite,
          child: ListNotes()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(RouteNames.newNote),
        child: Icon(
          Icons.add,
          size: standardIcon,
        ),
      ),
    );
  }
}
