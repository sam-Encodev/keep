import 'package:flutter/material.dart';
import 'package:keep/utilities/styles.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:keep/providers/app_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageIndicator extends ConsumerWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var maxLength = tabController.length - 1;
    return Padding(
      padding: const EdgeInsets.all(spacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          DotsIndicator(
            dotsCount: tabController.length,
            position: currentPageIndex.toDouble(),
            decorator: dotsStyle(context),
          ),
          Row(
            children: [
              if (currentPageIndex > 0)
                IconButton(
                  onPressed: () {
                    if (currentPageIndex == 0) {
                      return;
                    }
                    onUpdateCurrentPageIndex(currentPageIndex - 1);
                  },
                  style: maxIconButtonStyle(context),
                  icon: Icon(
                    Icons.arrow_left,
                    size: maxIcons,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              const SizedBox(width: standardSpacing),
              IconButton(
                onPressed: () {
                  if (currentPageIndex == maxLength) {
                    ref.read(appStateProvider.notifier).completeOnboarding();
                    return;
                  }
                  onUpdateCurrentPageIndex(currentPageIndex + 1);
                },
                style: maxIconButtonStyle(context),
                icon: Icon(
                  Icons.arrow_right,
                  size: maxIcons,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}