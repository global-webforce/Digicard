import 'package:ez_onboarding/src/onboard_item.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/page_view_indicators.dart';

class OnboardExplorer extends StatefulWidget {
  final Function onDone;
  final List<OnboardItem> pages;
  const OnboardExplorer({Key? key, required this.pages, required this.onDone})
      : super(key: key);

  @override
  State<OnboardExplorer> createState() => _OnboardExplorerState();
}

class _OnboardExplorerState extends State<OnboardExplorer> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  static const _kTransitionDuration = Duration(milliseconds: 350);
  static const _kCurve = Curves.ease;

  bool isLastPage = false;

  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();

    if (widget.pages.length - 1 == 0) {
      setState(() {
        isLastPage = true;
      });
    } else {
      setState(() {
        isLastPage = false;
      });
    }
  }

  _buildCircleIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CirclePageIndicator(
        selectedDotColor: Colors.white,
        dotColor: Colors.white.withOpacity(0.4),
        itemCount: widget.pages.length,
        currentPageNotifier: _currentPageNotifier,
      ),
    );
  }

  _prevButton() {
    return isLastPage
        ? TextButton(
            onPressed: () {
              _pageController.previousPage(
                duration: _kTransitionDuration,
                curve: _kCurve,
              );
            },
            child: const Text(
              'BACK',
              style: TextStyle(color: Colors.white),
            ),
          )
        : TextButton(
            child: const Text(
              'SKIP',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              _pageController.jumpToPage(widget.pages.length - 1);
            },
          );
  }

  _nextButton() {
    return TextButton(
      child: Text(
        isLastPage ? "DONE" : "NEXT",
        style: const TextStyle(color: Colors.white),
      ),
      onPressed: () {
        isLastPage
            ? widget.onDone()
            : _pageController.nextPage(
                duration: _kTransitionDuration, curve: _kCurve);
      },
    );
  }

  _pageView() {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.pages.length,
      itemBuilder: (BuildContext context, int index) {
        return widget.pages[index % widget.pages.length];
      },
      onPageChanged: (index) {
        _currentPageNotifier.value = index;
        if (index == widget.pages.length - 1) {
          setState(() {
            isLastPage = true;
          });
        } else {
          setState(() {
            isLastPage = false;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _pageView(),
          Container(
            padding: const EdgeInsets.all(15),
            color: Colors.black.withOpacity(0.4),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _prevButton(),
                _buildCircleIndicator(),
                _nextButton()
              ],
            ),
          )
        ],
      ),
    );
  }
}
