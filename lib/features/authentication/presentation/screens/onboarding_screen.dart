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
    FlutterNativeSplash.remove();

    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final onboardingMessages =
        ref.read(onboardingControllerProvider.notifier).onboardingMessages;
    // final carouselController =
    //     ref.read(onboardingControllerProvider.notifier).carouselController;
    final onboardingMessagePageController = ref
        .read(onboardingControllerProvider.notifier)
        .onboardingMessagePageController;
    final listKey =
        ref.read(onboardingControllerProvider.notifier).animatedListKey;
    // final skipText = TextPainter(
    //   text: const TextSpan(
    //     text: "Skip",
    //     style: TextStyle(
    //       color: Color.fromRGBO(23, 104, 46, 1.0),
    //       fontWeight: FontWeight.w400,
    //       fontSize: 12.0,
    //       height: 1.5,
    //     ),
    //   ),
    //   maxLines: 1,
    //   textScaleFactor: MediaQuery.of(context).textScaleFactor,
    //   textDirection: TextDirection.ltr,
    // );

    const skipButtonText = "Skip";
    const skipButtonStyle = TextStyle(
      color: Color.fromRGBO(23, 104, 46, 1.0),
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
      height: 1.5,
    );

    final lowerButtons = <Widget>[
      ElevatedButton(
        onPressed: (ref.watch(onboardingControllerProvider) ==
                onboardingMessages.length - 1)
            ? null
            : ref.read(onboardingControllerProvider.notifier).nextButton,
        child: Text(
          (ref.watch(onboardingControllerProvider) ==
                  onboardingMessages.length - 1)
              ? "GET STARTED"
              : "NEXT",
        ),
      ),
      TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          fixedSize: _textSize(skipButtonText, skipButtonStyle),
        ),
        //child: skipText.,
        child: const Text(
          skipButtonText,
          style: skipButtonStyle,
        ),
      ),
    ];

    // final animatedLowerButton = ElevatedButton(
    //   onPressed: () {},
    //   child: const Text("BACK"),
    // );

    //if (ref.watch(onboardingControllerProvider) >= 1) {}

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
              // Container(
              //   constraints: BoxConstraints(
              //     minHeight: 203,
              //     maxHeight: mediaQuery.size.height * 0.4242,
              //   ),
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: 31.0,
              //   ),
              //   child: Align(
              //     alignment: Alignment.bottomCenter,
              //     child: Column(
              //       children: [
              //         CarouselSlider.builder(
              //           itemCount: onboardingMessages.length,
              //           carouselController: carouselController,
              //           itemBuilder: (context, index, _) => Column(
              //             children: [
              //               Expanded(
              //                 child: SvgPicture(
              //                   AssetBytesLoader(
              //                     onboardingMessages[index].imageSvgPath,
              //                   ),
              //                 ),
              //               ),
              //               const Spacer(),
              //               Flexible(
              //                 child: Text(
              //                   onboardingMessages[index].title,
              //                   textAlign: TextAlign.center,
              //                   style: const TextStyle(
              //                     color: Color.fromRGBO(37, 197, 115, 1.0),
              //                     fontWeight: FontWeight.w700,
              //                     fontSize: 18.0,
              //                     height: 1.5,
              //                   ),
              //                 ),
              //               ),
              //               Flexible(
              //                 child: Text(
              //                   onboardingMessages[index].message,
              //                   textAlign: TextAlign.center,
              //                   style: const TextStyle(
              //                     color: Colors.black,
              //                     fontWeight: FontWeight.w400,
              //                     fontSize: 14.0,
              //                     height: 1.5,
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //           options: CarouselOptions(
              //             viewportFraction: 1.0,
              //             enlargeCenterPage: false,
              //             enableInfiniteScroll: false,
              //             // autoPlay: false,
              //           ),
              //         ),
              //         SmoothPageIndicator(
              //           //activeIndex: ref.watch(onboardingControllerProvider),
              //           controller: PageController(),
              //           count: onboardingMessages.length,
              //           effect: const ExpandingDotsEffect(
              //             activeDotColor: Color.fromRGBO(23, 104, 46, 1.0),
              //             dotColor: Color.fromRGBO(23, 104, 46, 1.0),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Flexible(
                child: SizedBox(
                  height: mediaQuery.size.height * 0.173,
                  child: AnimatedList(
                    key: listKey,
                    initialItemCount: lowerButtons.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: lowerButtons[index],
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

// class OnboardingScreen extends ConsumerStatefulWidget {
//   const OnboardingScreen({super.key});

//   final _carouselController = CarouselController();

//   @override
//   ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
//   final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
//   final _carouselController = CarouselController();

//   late final List<OnboardingMessage> onboardingMessages;
//   late final StateController<int> indexStateController;
//   late final int actualIndex;

//   final List<Widget> _buttonList = [
//     ElevatedButton(
//       onPressed: () {},
//       child: const Text("NEXT"),
//     ),
//     ElevatedButton(
//       onPressed: () {},
//       child: const Text("BACK"),
//     ),
//     TextButton(
//       onPressed: () {},
//       child: const Text("Skip"),
//     ),
//   ];

//   void nextButton() {
//     if (actualIndex != 2) {
//       indexStateController.state = actualIndex + 1;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();

//     actualIndex = ref.watch(_currentCarouselIndex);
//     indexStateController = ref.read(_currentCarouselIndex.notifier);
//     onboardingMessages =
//         ref.read(onboardingControllerProvider.notifier).onboardingMessages;

//     //TODO : Make correct list of buttons for this page and remove the sample code below
//     _list = ListModel<int>(
//       listKey: _listKey,
//       initialItems: <int>[0, 1, 2],
//       removedItemBuilder: _buildRemovedItem,
//     );
//     _nextItem = 3;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final mediaQuery = MediaQuery.of(context);

//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Column(
//         children: [
//           Expanded(
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: Column(
//                 children: [
//                   CarouselSlider.builder(
//                     itemCount: onboardingMessages.length,
//                     carouselController: _carouselController,
//                     itemBuilder: (context, index, _) => Column(
//                       children: [
//                         SvgPicture(
//                           AssetBytesLoader(
//                               onboardingMessages[index].imageSvgPath),
//                         ),
//                         Text(onboardingMessages[index].title),
//                         Text(onboardingMessages[index].message),
//                       ],
//                     ),
//                     options: CarouselOptions(),
//                   ),
//                   AnimatedSmoothIndicator(
//                     activeIndex: actualIndex,
//                     count: onboardingMessages.length,
//                     effect: const ExpandingDotsEffect(),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: mediaQuery.size.height * 0.23,
//             child: AnimatedList(
//               key: _listKey,
//               itemBuilder: (context, index, animation) {},
//               // mainAxisAlignment: MainAxisAlignment.start,
//               // crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 ElevatedButton(onPressed: onPressed, child: child),
//                 ElevatedButton(onPressed: onPressed, child: child),
//                 TextButton(onPressed: onPressed, child: child),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
