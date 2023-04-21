import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../../../common_widgets/debounced_text_button.dart';
import '../../../../common_widgets/default_elevated_button.dart';
import '../../../../common_widgets/onboarding_page.dart';
import '../../../../routers/app_router.dart';
import '../../../../utils/throttler.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen>
    with Throttler {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final PageController _onboardingMessagePageController = PageController(
    initialPage: 0,
  );

  late final List<Widget> _lowerButtons;
  late final Widget _backButton;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FlutterNativeSplash.remove();
    });

    ref.listen(onboardingControllerProvider, (previous, next) {
      if (previous == null) {
        return;
      }

      _onboardingMessagePageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );

      // swiping right - add BACK button
      if (next > previous && previous == 0) {
        _lowerButtons.insert(1, _backButton);
        _listKey.currentState!.insertItem(1);
      }

      // swiping left - remove BACK button
      else if (next < previous && previous == 1) {
        _lowerButtons.removeAt(1);
        _listKey.currentState?.removeItem(
          1,
          (context, animation) => FadeTransition(
            opacity: animation,
            child: _backButton,
          ),
        );
      }
    });
  }

  void _goToLoginScreen() =>
      ref.read(goRouterProvider).pushReplacement(AppRouter.login.path);

  //TODO : Fix double disappearing BACK button that appears when pressing fastly the back button, from index 1 to 0

  @override
  Widget build(BuildContext context) {
    late final Function(int, int) goToPage;

    final mediaQuery = MediaQuery.of(context);
    final onboardingMessages =
        ref.read(onboardingControllerProvider.notifier).onboardingMessages;

    _lowerButtons = <Widget>[
      Consumer(
        builder: (context, ref, child) {
          return DefaultElevatedButton(
            onPressed: (ref.read(onboardingControllerProvider) ==
                    onboardingMessages.length - 1)
                ? throttle(500, _goToLoginScreen)
                : throttle(
                    500,
                    ref
                        .read(onboardingControllerProvider.notifier)
                        .onPageChanged(
                            ref.read(onboardingControllerProvider) - 1),
                  ),
            // goToPage(ref.read(onboardingControllerProvider),
            //     ref.read(onboardingControllerProvider) + 1)),
            text: (ref.watch(onboardingControllerProvider) ==
                    onboardingMessages.length - 1)
                ? "GET STARTED"
                : "NEXT",
          );
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: _goToLoginScreen,
            style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
            ),
            child: const Text(
              "Skip",
              style: TextStyle(
                color: Color.fromRGBO(23, 104, 46, 1.0),
                fontWeight: FontWeight.w400,
                fontSize: 12.0,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    ];

    _backButton = Consumer(
      builder: (context, ref, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: DefaultElevatedButton(
            onPressed: throttle(
              500,
              ref
                  .read(onboardingControllerProvider.notifier)
                  .onPageChanged(ref.read(onboardingControllerProvider) - 1),
            ),
            // goToPage(ref.read(onboardingControllerProvider),
            //     ref.read(onboardingControllerProvider) - 1)),
            text: "BACK",
            backgroundColor: const Color.fromRGBO(168, 174, 170, 0.5),
            style: const TextStyle(
              color: Color.fromRGBO(23, 104, 46, 1.0),
            ),
          ),
        );
      },
    );

    // This is just to avoid RangeError (index): Invalid value: Not in inclusive range 0..1: 2 on rebuild state
    // if (ref.read(onboardingControllerProvider) == 2 &&
    //     !lowerButtons.contains(backButton)) {
    //   lowerButtons.insert(1, backButton);
    //   _listKey.currentState!.insertItem(1);
    // }

    // goToPage = (int currentIndex, int nextPageIndex) {
    //   // Don't do anything at the limit of the message page's list
    //   if (nextPageIndex >= onboardingMessages.length || nextPageIndex < 0) {
    //     return;
    //   }

    //   // swiping right
    //   if (nextPageIndex > currentIndex && currentIndex == 0) {
    //     lowerButtons.insert(1, backButton);
    //     _listKey.currentState!.insertItem(1);
    //   }

    //   // swiping left
    //   else if (nextPageIndex < currentIndex && currentIndex == 1) {
    //     lowerButtons.removeAt(1);
    //     _listKey.currentState?.removeItem(
    //       1,
    //       (context, animation) => FadeTransition(
    //         opacity: animation,
    //         child: backButton,
    //       ),
    //     );
    //   }

    //   ref
    //       .read(onboardingControllerProvider.notifier)
    //       .onPageChanged(nextPageIndex);
    // };

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 24.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                constraints: BoxConstraints(
                  minHeight: 203,
                  maxHeight: mediaQuery.size.height * 0.4242,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 31.0,
                ),
                child: PageView.builder(
                  controller: _onboardingMessagePageController,
                  onPageChanged: (nextPageIndex) {
                    // throttle(500, () {
                    //   var currentIndex = ref.read(onboardingControllerProvider);
                    //   print("PAGE VIEW CALL : $currentIndex -> $nextPageIndex");
                    //   if (currentIndex != nextPageIndex) {
                    //     goToPage(currentIndex, nextPageIndex);
                    //   }
                    // });

                    var currentIndex = ref.read(onboardingControllerProvider);
                    // print("PAGE VIEW CALL : $currentIndex -> $nextPageIndex");
                    // if (currentIndex != nextPageIndex) {
                    //   goToPage(currentIndex, nextPageIndex);
                    // }
                    // var currentPage =
                    //     _onboardingMessagePageController.page?.round();
                    if (currentIndex != nextPageIndex) {
                      throttle(500, goToPage(currentIndex, nextPageIndex));
                    }
                  },
                  itemCount: onboardingMessages.length,
                  itemBuilder: (_, index) => OnboardingPage(
                      onboardingMessage: onboardingMessages[
                          index % onboardingMessages.length]),
                ),
              ),
              SmoothPageIndicator(
                controller: _onboardingMessagePageController,
                count: onboardingMessages.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Color.fromRGBO(23, 104, 46, 1.0),
                  dotColor: Color.fromRGBO(23, 104, 46, 1.0),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: mediaQuery.size.height * 0.173,
                child: AnimatedList(
                  key: _listKey,
                  initialItemCount: lowerButtons.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: lowerButtons[index],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
