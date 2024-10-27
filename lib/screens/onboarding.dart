import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/constants/onboard.dart';
import 'package:keep/components/on_board.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:keep/providers/app_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Onboarding extends ConsumerStatefulWidget {
  const Onboarding({super.key});

  @override
  ConsumerState<Onboarding> createState() => _OnboardState();
}

class _OnboardState extends ConsumerState<Onboarding>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: stages.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  bool get _isOnDesktopAndWeb {
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return true;
    }
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  final stages = Onboard().getStages();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () =>
                    {ref.read(appStateProvider.notifier).completeOnboarding()},
                child: Text(
                  skip,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: standardFont),
                )),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                itemBuilder: (BuildContext context, int index) {
                  final stage = stages[index];
                  return onBoard(context, stage);
                },
                itemCount: stages.length,
                controller: _pageViewController,
                onPageChanged: _handlePageViewChanged,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(standardSpacing),
              child: PageIndicator(
                tabController: _tabController,
                currentPageIndex: _currentPageIndex,
                isOnDesktopAndWeb: _isOnDesktopAndWeb,
                onUpdateCurrentPageIndex: _updateCurrentPageIndex,
              ),
            ),
          ],
        ));
  }
}

class PageIndicator extends ConsumerWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.isOnDesktopAndWeb,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final bool isOnDesktopAndWeb;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          DotsIndicator(
            dotsCount: tabController.length,
            position: currentPageIndex,
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
                    color: Theme.of(context).colorScheme.primaryFixed,
                  ),
                ),
              const SizedBox(width: standardSpacing),
              IconButton(
                onPressed: () {
                  if (currentPageIndex == 2) {
                    ref.read(appStateProvider.notifier).completeOnboarding();
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
