import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../domain/models/onboarding_message.dart';
import '../controllers/onboarding_controller.dart';

//final _currentCarouselIndex = StateProvider.autoDispose<int>((_) => 0);

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// If FlutterNativeSplash is On, then it'll be removed
    // ! Make this page wait for the controller to initialize fully and remove splash screen just after that
    // ! Only start to build the page after controller is initialized
    if (ref.watch(onboardingControllerProvider)) FlutterNativeSplash.remove();

    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final onboardingMessages =
        ref.read(onboardingControllerProvider.notifier).onboardingMessages;
    final onboardingMessagePageController = ref
        .read(onboardingControllerProvider.notifier)
        .onboardingMessagePageController;
    final listKey =
        ref.read(onboardingControllerProvider.notifier).animatedListKey;

    // final lowerButtons = <Widget>[
    //   ElevatedButton(
    //     onPressed: (ref.watch(onboardingControllerProvider) ==
    //             onboardingMessages.length - 1)
    //         ? null
    //         : ref.read(onboardingControllerProvider.notifier).nextButton,
    //     style: ElevatedButton.styleFrom(
    //         disabledBackgroundColor: const Color.fromRGBO(23, 104, 46, 0.5),
    //         minimumSize: const Size.fromHeight(54.0),
    //         backgroundColor: const Color.fromRGBO(23, 104, 46, 1.0),
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(
    //             10.0,
    //           ),
    //         )),
    //     child: Text(
    //       (ref.watch(onboardingControllerProvider) ==
    //               onboardingMessages.length - 1)
    //           ? "GET STARTED"
    //           : "NEXT",
    //       style: const TextStyle(color: Colors.white),
    //     ),
    //   ),
    //   Row(
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     children: [
    //       TextButton(
    //         onPressed: () {},
    //         //child: skipText.,
    //         child: const Text(
    //           "Skip",
    //           style: TextStyle(
    //             color: Color.fromRGBO(23, 104, 46, 1.0),
    //             fontWeight: FontWeight.w400,
    //             fontSize: 12.0,
    //             height: 1.5,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // ];

    final onboardingPages = List.generate(
      3,
      (index) => Container(
        constraints: BoxConstraints(
          minHeight: 203,
          maxHeight: mediaQuery.size.height * 0.4242,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 31.0,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SvgPicture(
                AssetBytesLoader(
                  onboardingMessages[index].imageSvgPath,
                ),
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
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: 203,
                  maxHeight: mediaQuery.size.height * 0.4242,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 31.0,
                ),
                child: PageView.builder(
                  controller: onboardingMessagePageController,
                  onPageChanged: ref
                      .read(onboardingControllerProvider.notifier)
                      .onPageChanged,
                  itemBuilder: (_, index) =>
                      onboardingPages[index % onboardingPages.length],
                ),
              ),
              SmoothPageIndicator(
                //activeIndex: ref.watch(onboardingControllerProvider),
                controller: onboardingMessagePageController,
                count: onboardingMessages.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Color.fromRGBO(23, 104, 46, 1.0),
                  dotColor: Color.fromRGBO(23, 104, 46, 1.0),
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: mediaQuery.size.height * 0.173,
                  child: AnimatedList(
                    key: listKey,
                    initialItemCount: ref
                        .read(onboardingControllerProvider.notifier)
                        .lowerButtons
                        .length,
                    shrinkWrap: true,
                    itemBuilder: (context, index, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: ref
                            .read(onboardingControllerProvider.notifier)
                            .lowerButtons[index],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
