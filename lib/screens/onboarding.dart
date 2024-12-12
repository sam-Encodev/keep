import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/constants/onboard.dart';
import 'package:keep/components/on_board.dart';
import 'package:keep/components/page_indicator.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              child: Text(
                skip,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    fontSize: titleMedium),
              ),
              onPressed: () =>
                  {ref.read(appStateProvider.notifier).skipOnboard()},
            )
          ],
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
                onUpdateCurrentPageIndex: _updateCurrentPageIndex,
              ),
            ),
          ],
        ));
  }
}
