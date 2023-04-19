import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../../../routers/app_router.dart';
import '../../domain/models/onboarding_message.dart';
import '../controllers/onboarding_controller.dart';

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

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FlutterNativeSplash.remove();
    });
  }

  void _animateToNewOnboardMessagePage(int pageIndex) {
    if (_onboardingMessagePageController.page!.round() !=
        ref.read(onboardingControllerProvider)) {
      _onboardingMessagePageController.animateToPage(
        ref.read(onboardingControllerProvider),
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  //TODO : Fix double disappearing BACK button that appears when pressing fastly the back button, from index 1 to 0

  @override
  Widget build(BuildContext context) {
    late final Function(int) goToPage;

    // final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final List<OnboardingMessage> onboardingMessages =
        ref.read(onboardingControllerProvider.notifier).onboardingMessages;

    void goToLoginScreen() =>
        ref.read(goRouterProvider).pushReplacementNamed(AppRouter.login.path);

    final lowerButtons = <Widget>[
      Consumer(
        builder: (context, ref, child) {
          return ElevatedButton(
            onPressed: (ref.read(onboardingControllerProvider.notifier).state ==
                    onboardingMessages.length - 1)
                ? goToLoginScreen
                : () {
                    goToPage(ref.read(onboardingControllerProvider) + 1);
                    _animateToNewOnboardMessagePage(
                        ref.watch(onboardingControllerProvider));
                  },
            style: ElevatedButton.styleFrom(
              disabledBackgroundColor: const Color.fromRGBO(23, 104, 46, 0.5),
              minimumSize: const Size.fromHeight(54.0),
              backgroundColor: const Color.fromRGBO(23, 104, 46, 1.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
            ),
            child: Text(
              (ref.watch(onboardingControllerProvider) ==
                      onboardingMessages.length - 1)
                  ? "GET STARTED"
                  : "NEXT",
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: goToLoginScreen,
            //child: skipText.,
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

    final backButton = Consumer(
      builder: (context, ref, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ElevatedButton(
            onPressed: () {
              goToPage(ref.read(onboardingControllerProvider) - 1);
              _animateToNewOnboardMessagePage(
                  ref.read(onboardingControllerProvider));
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(54.0),
              backgroundColor: const Color.fromRGBO(168, 174, 170, 0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
            ),
            child: const Text(
              "BACK",
              style: TextStyle(
                color: Color.fromRGBO(23, 104, 46, 1.0),
              ),
            ),
          ),
        );
      },
    );

    goToPage = (int nextPageIndex) {
      //print("\nGOING TO NEXT PAGE\n");
      final currentIndex = ref.read(onboardingControllerProvider);
      //print("NEXT PAGE: $nextPageIndex");
      //print("CURRENT PAGE: $currentIndex");

      // Don't do anything at the limit of the message page's list
      if (nextPageIndex >= onboardingMessages.length || nextPageIndex < 0) {
        return;
      }

      // swiping right
      if (nextPageIndex > currentIndex && currentIndex == 0) {
        //print("HAS SWIPED TO RIGHT!");
        lowerButtons.insert(1, backButton);
        //print("CURRENT LOWER BUTTONS AFTER INSERT : ${lowerButtons.length}");
        _listKey.currentState!.insertItem(1);
      }

      // swiping left
      else if (nextPageIndex < currentIndex && currentIndex == 1) {
        //print("HAS SWIPED TO LEFT!");
        lowerButtons.removeAt(1);
        //print("CURRENT LOWER BUTTONS AFTER REMOVE : $lowerButtons");
        _listKey.currentState?.removeItem(
          1,
          (context, animation) => FadeTransition(
            opacity: animation,
            child: backButton,
          ),
        );
      }

      ref
          .read(onboardingControllerProvider.notifier)
          .onPageChanged(nextPageIndex);
    };

    final onboardingPages = List.generate(
      3,
      (index) => LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            constraints: constraints,
            // constraints: BoxConstraints(
            //   minHeight: 203,
            //   maxHeight: mediaQuery.size.height * 0.4242,
            // ),
            // padding: const EdgeInsets.symmetric(
            //   horizontal: 31.0,
            // ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 4,
                  child: SvgPicture(
                    AssetBytesLoader(
                      onboardingMessages[index].imageSvgPath,
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const Spacer(),
                Flexible(
                  child: Text(
                    onboardingMessages[index].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromRGBO(37, 197, 115, 1.0),
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7.0,
                ),
                Flexible(
                  child: Text(
                    onboardingMessages[index].message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

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
                  onPageChanged: (nextPageIndex) => goToPage(
                    nextPageIndex,
                  ),
                  itemBuilder: (_, index) =>
                      onboardingPages[index % onboardingPages.length],
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
              // const SizedBox(
              //   height: 10.0,
              // ),
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
