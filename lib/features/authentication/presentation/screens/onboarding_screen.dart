import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../common_widgets/onboarding_message_box.dart';
import '../../../../constants/custom_colors.dart';
import '../../../../constants/strings.dart';
import '../../../../routers/app_router.dart';
import '../../../../utils/throttler.dart';
import '../controllers/onboarding_controller.dart';

// State providers for NEXT button, to be able to throttle it
final nextTextStateProvider = StateProvider.autoDispose<String>(
  (ref) => Strings.next.toUpperCase(),
);

final nextFunctionStateProvider = StateProvider.autoDispose<void Function()>(
  (ref) => () => ref
      .read(onboardingControllerProvider.notifier)
      .onPageChanged(ref.read(onboardingControllerProvider) + 1),
);

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

  late List<Widget> _lowerButtons;
  late Widget _backButton;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FlutterNativeSplash.remove();
    });
  }

  void _goToLoginScreen() =>
      ref.read(goRouterProvider).pushReplacement(AppRouter.login.path);

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.sizeOf(context);
    final onboardingMessages =
        ref.read(onboardingControllerProvider.notifier).onboardingMessages;

    ref.listen<int>(onboardingControllerProvider, (previous, next) {
      print("TA ESCUTANDO?");
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
      // Solution for throttling current NEXT button with condition, without using ref.watch in the button
      else if (next > previous && next == onboardingMessages.length - 1) {
        ref.read(nextTextStateProvider.notifier).state =
            Strings.getStarted.toUpperCase();
        ref.read(nextFunctionStateProvider.notifier).state = _goToLoginScreen;
      } else if (next < previous && previous == onboardingMessages.length - 1) {
        ref.read(nextTextStateProvider.notifier).state =
            Strings.next.toUpperCase();
        ref.read(nextFunctionStateProvider.notifier).state = () => ref
            .read(onboardingControllerProvider.notifier)
            .onPageChanged(ref.read(onboardingControllerProvider) + 1);
      }
    });

    _lowerButtons = <Widget>[
      Consumer(
        builder: (context, ref, child) {
          return ElevatedButton(
            onPressed: throttle(
              250,
              ref.watch(nextFunctionStateProvider),
            ),
            child: Text(
              ref.watch(nextTextStateProvider),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          );

          //! Code below doesn't work for throttling. Throttling it while using watch over it, will make the throttle be ignore and call another function over it, due to the change of state
          //! Riverpod still doesn't have a better way to handle throttling in a single provider
          // return DefaultElevatedButton(
          //   onPressed: (ref.watch(onboardingControllerProvider) ==
          //           onboardingMessages.length - 1)
          //       ? _goToLoginScreen
          //       : () => throttle(
          //             300,
          //             () => ref
          //                 .read(onboardingControllerProvider.notifier)
          //                 .onPageChanged(
          //                     ref.read(onboardingControllerProvider) + 1),
          //           ),
          //   text: (ref.watch(onboardingControllerProvider) ==
          //           onboardingMessages.length - 1)
          //       ? "GET STARTED"
          //       : "NEXT",
          // );
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
      builder: (context, ref, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ElevatedButton(
            onPressed: throttle(
              250,
              () => ref
                  .read(onboardingControllerProvider.notifier)
                  .onPageChanged(ref.read(onboardingControllerProvider) - 1),
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
                    var currentIndex = ref.read(onboardingControllerProvider);
                    if (currentIndex != nextPageIndex) {
                      ref
                          .read(onboardingControllerProvider.notifier)
                          .onPageChanged(nextPageIndex);
                    }
                  },
                  itemCount: onboardingMessages.length,
                  itemBuilder: (_, index) => OnboardingMessageBox(
                      onboardingMessage: onboardingMessages[
                          index % onboardingMessages.length]),
                ),
              ),
              SmoothPageIndicator(
                controller: _onboardingMessagePageController,
                count: onboardingMessages.length,
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
