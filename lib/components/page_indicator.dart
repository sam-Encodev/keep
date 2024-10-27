import 'package:flutter/material.dart';
import 'package:keep/utilities/styles.dart';

class PageIndicator extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
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
                    color: Theme.of(context).colorScheme.primaryFixed,
                  ),
                ),
              const SizedBox(width: standardSpacing),
              IconButton(
                onPressed: () {
                  if (currentPageIndex == 2) {
                    return;
                  }
                  onUpdateCurrentPageIndex(currentPageIndex + 1);
                },
                style: maxIconButtonStyle(context),
                icon: Icon(
                  Icons.arrow_right,
                  size: maxIcons,
                  color: Theme.of(context).colorScheme.primaryFixed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}