import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/components/back_button.dart';
import 'package:keep/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class Settings extends ConsumerWidget {
    const Settings({
    super.key,

  });


  @override
  Widget build(BuildContext context,  WidgetRef ref) {
    var theme = ref.watch(themeStateProvider);

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: goBackButton(context),
          title: Text(settings, style: TextStyle(fontSize: standardFont)),
        ),
        body: Container(
          padding: const EdgeInsets.all(standardSpacing),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                themeManager,
                textAlign: TextAlign.left,
              ),
              SegmentedButton(
                  segments: [
                    ButtonSegment(
                        value: ThemeMode.system,
                        label: Text(system),
                        icon: Icon(Icons.add_to_home_screen)),
                    ButtonSegment(
                        value: ThemeMode.light,
                        label: Text(light),
                        icon: Icon(Icons.wb_sunny)),
                    ButtonSegment(
                        value: ThemeMode.dark,
                        label: Text(dark),
                        icon: Icon(Icons.brightness_2))
                  ],
                  selected: {
                    theme
                  },
                  onSelectionChanged: (newSelection) {
                    ref
                        .read(themeStateProvider.notifier)
                        .setTheme(newSelection.first);
                  }),
            ],
          ),
        ));
  }
}
