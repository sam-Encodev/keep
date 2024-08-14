import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/screens/welcome/widget.dart';
import 'package:dots_indicator/dots_indicator.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> with TickerProviderStateMixin {
  List<Map<String, Object>> stages = onboardStages;
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black87,
          actions: [
            FilledButton(
                onPressed: () => context.pushReplacement('/'),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  elevation: WidgetStateProperty.all(0),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: const Text(
                  skip,
                  style: TextStyle(color: Colors.redAccent),
                ))
          ],
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: PageView(
                controller: _pageViewController,
                onPageChanged: _handlePageViewChanged,
                children: <Widget>[
                  onBoardWidget("illustration.svg", "Intuitive note-taking",
                      "Effortlessly organize your thought and ideas by keeping your important information at your fingertips."),
                  onBoardWidget(
                      "blog_header.svg",
                      "Stay productive note-taking",
                      "Stay productive on the go by ensuring you never forget anything important or vital."),
                  onBoardWidget("challenges.svg", "Peace of mind",
                      "Experience peace of mind with our automatic cloud syncing, ensuring your notes are securely backed up ans accessible."),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: PageIndicator(
                tabController: _tabController,
                currentPageIndex: _currentPageIndex,
                onUpdateCurrentPageIndex: _updateCurrentPageIndex,
                isOnDesktopAndWeb: _isOnDesktopAndWeb,
              ),
            ),
          ],
        ));
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
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
}

class PageIndicator extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
            position: currentPageIndex.toDouble(),
            decorator: dotsStyle(),
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
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.deepPurpleAccent),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      )),
                  icon: const Icon(
                    Icons.arrow_left,
                    size: 35,
                  ),
                  color: Colors.white,
                ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  if (currentPageIndex == 2) {
                    return;
                  }
                  onUpdateCurrentPageIndex(currentPageIndex + 1);
                },
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Colors.deepPurpleAccent),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    )),
                icon: const Icon(
                  Icons.arrow_right,
                  size: 35,
                ),
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
