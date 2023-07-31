import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../common_widgets/onboarding_message_box.dart';
import '../../../../constants/custom_colors.dart';
import '../../../../constants/strings.dart';
import '../../../../routers/app_router.dart';
import '../controllers/onboarding_controller.dart';
import '../controllers/states/onboarding_screen_state.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final PageController _onboardingMessagePageController = PageController(
    initialPage: 0,
  );

  late List<Widget> _lowerButtons;
  late Widget _backButton;
  late PublishSubject<dynamic Function()> _callNextThrottler;
  late PublishSubject<dynamic Function()> _callBackThrottler;

  @override
  void initState() {
    super.initState();

    _callNextThrottler = PublishSubject<Function()>()
      ..throttleTime(const Duration(milliseconds: 200)).forEach((f) {
        f();
      });

    _callBackThrottler = PublishSubject<Function()>()
      ..throttleTime(const Duration(milliseconds: 200)).forEach((f) {
        f();
      });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FlutterNativeSplash.remove();
    });

    _lowerButtons = <Widget>[
      Consumer(
        builder: (context, nextRef, child) {
          return ElevatedButton(
            onPressed: () => _callNextThrottler.add(
              (nextRef.watch(onboardingControllerProvider).pagePosition ==
                      nextRef
                              .watch(onboardingControllerProvider)
                              .messages
                              .length -
                          1)
                  ? () => context.pushReplacement(AppRouter.login.path)
                  : () => nextRef
                      .read(onboardingControllerProvider.notifier)
                      .onPageChanged(
                          ref.watch(onboardingControllerProvider).pagePosition +
                              1),
            ),
            child: Text(
              (nextRef.watch(onboardingControllerProvider).pagePosition ==
                      nextRef
                              .watch(onboardingControllerProvider)
                              .messages
                              .length -
                          1)
                  ? Strings.getStarted.toUpperCase()
                  : Strings.next.toUpperCase(),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => context.pushReplacement(AppRouter.login.path),
            style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
            ),
            child: const Text(
              Strings.skip,
              style: TextStyle(
                color: CustomColors.buttonGreen,
                fontWeight: FontWeight.normal,
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    ];

    _backButton = Consumer(
      builder: (context, backRef, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ElevatedButton(
            onPressed: () => _callBackThrottler.add(
              () => backRef
                  .watch(onboardingControllerProvider.notifier)
                  .onPageChanged(
                      backRef.watch(onboardingControllerProvider).pagePosition -
                          1),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColors.buttonGreyDeactivated,
            ),
            child: Text(
              Strings.back.toUpperCase(),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: CustomColors.buttonGreen,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.sizeOf(context);

    // Listener to activate animations
    ref.listen<OnboardingScreenState>(onboardingControllerProvider,
        (previous, next) {
      if (previous == null) {
        return;
      }

      _onboardingMessagePageController.animateToPage(
        next.pagePosition,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );

      // animation swiping right - add BACK button
      if (next.pagePosition > previous.pagePosition &&
          previous.pagePosition == 0) {
        _lowerButtons.insert(1, _backButton);
        _listKey.currentState!.insertItem(
          1,
          duration: const Duration(milliseconds: 350),
        );
      }

      // animation swiping left - remove BACK button
      else if (next.pagePosition < previous.pagePosition &&
          previous.pagePosition == 1) {
        _lowerButtons.removeAt(1);
        _listKey.currentState?.removeItem(
          1,
          (context, animation) => FadeTransition(
            opacity: animation,
            child: _backButton,
          ),
          duration: const Duration(milliseconds: 350),
        );
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  maxHeight: mediaQuerySize.height * 0.4242,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 31.0,
                ),
                child: PageView.builder(
                  controller: _onboardingMessagePageController,
                  onPageChanged: (nextPageIndex) {
                    var currentIndex =
                        ref.watch(onboardingControllerProvider).pagePosition;
                    // to avoid redoing animation in case the page index was changed by button tap
                    if (currentIndex != nextPageIndex) {
                      ref
                          .watch(onboardingControllerProvider.notifier)
                          .onPageChanged(nextPageIndex);
                    }
                  },
                  itemCount:
                      ref.watch(onboardingControllerProvider).messages.length,
                  itemBuilder: (_, index) {
                    var currentMessage =
                        ref.watch(onboardingControllerProvider).messages[index %
                            ref
                                .watch(onboardingControllerProvider)
                                .messages
                                .length];
                    return OnboardingMessageBox(
                      imageSvgPath: currentMessage.imageSvgPath,
                      title: currentMessage.title,
                      message: currentMessage.message,
                    );
                  },
                ),
              ),
              SmoothPageIndicator(
                controller: _onboardingMessagePageController,
                count: ref.watch(onboardingControllerProvider).messages.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: CustomColors.buttonGreen,
                  dotColor: CustomColors.buttonGreen,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: mediaQuerySize.height * 0.173,
                child: AnimatedList(
                  key: _listKey,
                  initialItemCount: _lowerButtons.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: _lowerButtons[index],
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
