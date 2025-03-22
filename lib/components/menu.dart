import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/routes/route_names.dart';
import 'package:keep/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CascadingMenu extends ConsumerStatefulWidget {
  const CascadingMenu({super.key});

  @override
  ConsumerState<CascadingMenu> createState() => _MyCascadingMenuState();
}

class _MyCascadingMenuState extends ConsumerState<CascadingMenu> {
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentUser = ref.watch(authNotifierProvider);
    return MenuAnchor(
      childFocusNode: _buttonFocusNode,
      menuChildren: <Widget>[
        MenuItemButton(
          onPressed: () {
            context.push(RouteName.about);
          },
          child: const Text(about),
        ),
        MenuItemButton(
          onPressed: () {
            context.push(RouteName.profile(currentUser.id));
          },
          child: const Text(profile),
        ),
        MenuItemButton(
          onPressed: () {
            context.push(RouteName.settings);
          },
          child: const Text(settings),
        ),
        MenuItemButton(
          onPressed: () {
            ref.read(authNotifierProvider.notifier).logout();
          },
          child: const Text(logout),
        ),
      ],
      builder: (_, MenuController controller, Widget? child) {
        return IconButton(
          focusNode: _buttonFocusNode,
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(Icons.more_vert),
        );
      },
    );
  }
}
