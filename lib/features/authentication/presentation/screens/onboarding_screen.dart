import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../../../routers/app_router.dart';
import '../../domain/models/onboarding_message.dart';
import '../controllers/onboarding_controller.dart';

//final _currentCarouselIndex = StateProvider.autoDispose<int>((_) => 0);

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late final GlobalKey<AnimatedListState> _listKey =
      GlobalKey<AnimatedListState>();
  late final PageController _onboardingMessagePageController = PageController(
    initialPage: 0,
  );
  late final List<Widget> _lowerButtons;
  late final Widget _backButton;
  late final List<OnboardingMessage> _onboardingMessages =
      ref.read(onboardingControllerProvider.notifier).onboardingMessages;
  //late final VoidCallback _goToLoginScreen =
  //late final Function(int, int) _goToPage;
  late final GoRouter _goRouter = ref.read(goRouterProvider);
  var _hasStarted = true;

  void _goToLoginScreen() =>
      _goRouter.pushReplacementNamed(AppRouter.login.path);

  void _goToPage(int nextPageIndex) {
    print("\nGOING TO NEXT PAGE\n");
    final currentIndex = ref.read(onboardingControllerProvider);
    print("NEXT PAGE: $nextPageIndex");
    print("CURRENT PAGE: $currentIndex");

    // Don't do anything at the limit of the message page's list
    if (nextPageIndex >= _onboardingMessages.length || nextPageIndex < 0) {
      return;
    }

    // swiping right
    if (nextPageIndex > currentIndex) {
      print("HAS SWIPED TO RIGHT!");
      print("CURRENT PAGEVIEW PAGE: ${_onboardingMessagePageController.page!}");
      // if (_onboardingMessagePageController.page! == currentIndex) {
      //   print("PRINT VIEW HAS NOT BEEN USED!");
      //   _onboardingMessagePageController.nextPage(
      //     duration: const Duration(milliseconds: 400),
      //     curve: Curves.easeInOut,
      //   );
      // }
      if (currentIndex == 0) {
        _lowerButtons.insert(1, _backButton);
        _listKey.currentState?.insertItem(1);
      }
    }

    // swiping left
    else if (nextPageIndex < currentIndex) {
      print("HAS SWIPED TO LEFT!");
      print("CURRENT PAGEVIEW PAGE: ${_onboardingMessagePageController.page!}");
      // if (_onboardingMessagePageController.page! == currentIndex) {
      //   print("PRINT VIEW HAS NOT BEEN USED!");
      //   _onboardingMessagePageController.previousPage(
      //     duration: const Duration(milliseconds: 400),
      //     curve: Curves.easeInOut,
      //   );
      // }
      if (currentIndex == 1) {
        _lowerButtons.removeAt(1);
        _listKey.currentState?.removeItem(
          1,
          (context, animation) => FadeTransition(
            opacity: animation,
            child: _backButton,
          ),
        );
      }
    }
    ref
        .read(onboardingControllerProvider.notifier)
        .onPageChanged(nextPageIndex);
  }

  @override
  void initState() {
    super.initState();
    // "ref" can be used in all life-cycles of a StatefulWidget.
    //ref.read(counterProvider);

    // addPostFrameCallback is used to call after build() has finished.
    // We are going to remove Splash Screen after the build has completed

    // _goToLoginScreen = () => _goRouter.pushReplacementNamed(AppRouter.login.path);

    _onboardingMessagePageController.addListener(() {
      // print(
      //     "LISTENER OF PAGEVIEW CALLED!!!! = ${_onboardingMessagePageController.page!} - CURRENT INDEX = ${ref.read(onboardingControllerProvider)}");

      // var isNewPageAnInt = (_onboardingMessagePageController.page! is int ||
      //     _onboardingMessagePageController.page! ==
      //         _onboardingMessagePageController.page!.roundToDouble());
      // var isNewIndexEqualToActualStateIndex =
      //     _onboardingMessagePageController.page! !=
      //         ref.read(onboardingControllerProvider);

      // print(
      //     "IS NEW PAGE AN INT : $isNewPageAnInt -- isNewIndexEqualToActualStateIndex : $isNewIndexEqualToActualStateIndex");
      if ((_onboardingMessagePageController.page! is int ||
              _onboardingMessagePageController.page! ==
                  _onboardingMessagePageController.page!.roundToDouble()) &&
          _onboardingMessagePageController.page! !=
              ref.read(onboardingControllerProvider)) {
        print("PAGEVIEW WAS SWAPED BY HAND!");
        // print("PRINT VIEW HAS NOT BEEN USED!");
        // _onboardingMessagePageController.nextPage(
        //   duration: const Duration(milliseconds: 400),
        //   curve: Curves.easeInOut,
        // );
        print(
            "NOW TIME TO CHANGE THE STATE OF CONTROLLER AND UPDATE IT WITH THE PAGEVIEW'S NEW CHANGE");
        _goToPage(_onboardingMessagePageController.page!.round());
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FlutterNativeSplash.remove();
    });
  }

  @override
  void didChangeDependencies() {
    if (_hasStarted) {
      print("HAS STARTED!!!!");

      // _goToPage = (int currentPageIndex, int nextPageIndex) {
      //   print("\nGOING TO NEXT PAGE\n");
      //   //final currentIndex = ref.watch(onboardingControllerProvider);
      //   print("NEXT PAGE: $nextPageIndex");
      //   print("CURRENT PAGE: $currentPageIndex");

      //   // Don't do anything at the limit of the message page's list
      //   if (nextPageIndex >= _onboardingMessages.length || nextPageIndex < 0) {
      //     return;
      //   }

      //   // swiping right
      //   if (nextPageIndex > currentPageIndex) {
      //     print("HAS SWIPED TO RIGHT!");
      //     print(
      //         "CURRENT PAGEVIEW PAGE: ${_onboardingMessagePageController.page!}");
      //     if (_onboardingMessagePageController.page! == currentPageIndex) {
      //       print("PRINT VIEW HAS NOT BEEN USED!");
      //       _onboardingMessagePageController.nextPage(
      //         duration: const Duration(milliseconds: 400),
      //         curve: Curves.easeInOut,
      //       );
      //     }
      //     if (currentPageIndex == 0) {
      //       _lowerButtons.insert(1, _backButton);
      //       _listKey.currentState?.insertItem(1);
      //     }
      //   }

      //   // swiping left
      //   else if (nextPageIndex < currentPageIndex) {
      //     print("HAS SWIPED TO LEFT!");
      //     print(
      //         "CURRENT PAGEVIEW PAGE: ${_onboardingMessagePageController.page!}");
      //     if (_onboardingMessagePageController.page! == currentPageIndex) {
      //       print("PRINT VIEW HAS NOT BEEN USED!");
      //       _onboardingMessagePageController.previousPage(
      //         duration: const Duration(milliseconds: 400),
      //         curve: Curves.easeInOut,
      //       );
      //     }
      //     if (currentPageIndex == 1) {
      //       _lowerButtons.removeAt(1);
      //       _listKey.currentState?.removeItem(
      //         1,
      //         (context, animation) => FadeTransition(
      //           opacity: animation,
      //           child: _backButton,
      //         ),
      //       );
      //     }
      //   }
      //   ref
      //       .read(onboardingControllerProvider.notifier)
      //       .onPageChanged(nextPageIndex);
      // };

      _lowerButtons = <Widget>[
        ElevatedButton(
          onPressed: (ref.read(onboardingControllerProvider.notifier).state ==
                  _onboardingMessages.length - 1)
              ? _goToLoginScreen
              : () => _goToPage(ref.read(onboardingControllerProvider) + 1),
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
                    _onboardingMessages.length - 1)
                ? "GET STARTED"
                : "NEXT",
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: _goToLoginScreen,
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

      _backButton = ElevatedButton(
        onPressed: () => _goToPage(ref.read(onboardingControllerProvider) - 1),
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
      );
      _hasStarted = false;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    /// If FlutterNativeSplash is On, then it'll be removed
    //FlutterNativeSplash.remove();

    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    //final goRouter = ref.read(goRouterProvider);

    // final onboardingMessages =
    //     ref.read(onboardingControllerProvider.notifier).onboardingMessages;
    // final goToNextMessage =
    //     ref.read(onboardingControllerProvider.notifier).goToNextMessage;
    // final goBackToLastMessage =
    //     ref.read(onboardingControllerProvider.notifier).goBackToLastMessage;

    // void goToLoginScreen() =>
    //     goRouter.pushReplacementNamed(AppRouter.login.path);

    // void goToPage(int indexPage) {
    //   final currentIndex = ref.read(onboardingControllerProvider);
    //   print("NEXT PAGE: $indexPage");
    //   print("CURRENT PAGE: $currentIndex");
    //   ref.read(onboardingControllerProvider.notifier).onPageChanged(indexPage);

    //   // swiping right
    //   if (indexPage > currentIndex && currentIndex == 0) {
    //     _onboardingMessagePageController.nextPage(
    //       duration: const Duration(milliseconds: 400),
    //       curve: Curves.easeInOut,
    //     );
    //     _lowerButtons.insert(1, _backButton);
    //     _listKey.currentState?.insertItem(1);
    //   }
    //   // swiping left
    //   else if (indexPage < currentIndex && currentIndex == 1) {
    //     _onboardingMessagePageController.previousPage(
    //       duration: const Duration(milliseconds: 400),
    //       curve: Curves.easeInOut,
    //     );
    //     _lowerButtons.removeAt(1);
    //     _listKey.currentState?.removeItem(
    //       1,
    //       (context, animation) => FadeTransition(
    //         opacity: animation,
    //         child: _backButton,
    //       ),
    //     );
    //   }
    // }

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
                  _onboardingMessages[index].imageSvgPath,
                ),
              ),
            ),
            const Spacer(),
            Flexible(
              child: Text(
                _onboardingMessages[index].title,
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
                _onboardingMessages[index].message,
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
                  controller: _onboardingMessagePageController,
                  // onPageChanged: (index) {
                  //   var lastIndex = ref.read(onboardingControllerProvider);
                  // },

                  // onPageChanged: (nextPageIndex) => _goToPage(
                  //   nextPageIndex,
                  // ),

                  itemBuilder: (_, index) =>
                      onboardingPages[index % onboardingPages.length],
                ),
              ),
              SmoothPageIndicator(
                //activeIndex: ref.watch(onboardingControllerProvider),
                controller: _onboardingMessagePageController,
                count: _onboardingMessages.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Color.fromRGBO(23, 104, 46, 1.0),
                  dotColor: Color.fromRGBO(23, 104, 46, 1.0),
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: mediaQuery.size.height * 0.173,
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class OnboardingScreen extends ConsumerWidget {
//   const OnboardingScreen({super.key});

//   // Size _textSize(String text, TextStyle style) {
//   //   final TextPainter textPainter = TextPainter(
//   //       text: TextSpan(text: text, style: style),
//   //       maxLines: 1,
//   //       textDirection: TextDirection.ltr)
//   //     ..layout(minWidth: 0, maxWidth: double.infinity);
//   //   return textPainter.size;
//   // }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     /// If FlutterNativeSplash is On, then it'll be removed
//     // ! Make this page wait for the controller to initialize fully and remove splash screen just after that
//     // ! Only start to build the page after controller is initialized
//     //var currentOnboardMessageIndex = ref.watch(onboardingControllerProvider);
//     FlutterNativeSplash.remove();

//     final theme = Theme.of(context);
//     final mediaQuery = MediaQuery.of(context);
//     // final onboardingMessages =
//     //     ref.read(onboardingControllerProvider.notifier).onboardingMessages;
//     // final onboardingMessagePageController = ref
//     //     .read(onboardingControllerProvider.notifier)
//     //     .onboardingMessagePageController;
//     // final listKey =
//     //     ref.read(onboardingControllerProvider.notifier).animatedListKey;

//     final lowerButtons = <Widget>[
//       ElevatedButton(
//         onPressed: (ref.watch(onboardingControllerProvider) ==
//                 onboardingMessages.length - 1)
//             ? null
//             : ref.read(onboardingControllerProvider.notifier).nextButton,
//         style: ElevatedButton.styleFrom(
//           disabledBackgroundColor: const Color.fromRGBO(23, 104, 46, 0.5),
//           minimumSize: const Size.fromHeight(54.0),
//           backgroundColor: const Color.fromRGBO(23, 104, 46, 1.0),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(
//               10.0,
//             ),
//           ),
//         ),
//         child: Text(
//           (ref.watch(onboardingControllerProvider) ==
//                   onboardingMessages.length - 1)
//               ? "GET STARTED"
//               : "NEXT",
//           style: const TextStyle(color: Colors.white),
//         ),
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           TextButton(
//             onPressed: () {},
//             //child: skipText.,
//             child: const Text(
//               "Skip",
//               style: TextStyle(
//                 color: Color.fromRGBO(23, 104, 46, 1.0),
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12.0,
//                 height: 1.5,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ];
//     final backButton = ElevatedButton(
//       onPressed: ref.read(onboardingControllerProvider.notifier).backButton,
//       style: ElevatedButton.styleFrom(
//         minimumSize: const Size.fromHeight(54.0),
//         backgroundColor: const Color.fromRGBO(168, 174, 170, 0.5),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(
//             10.0,
//           ),
//         ),
//       ),
//       child: const Text(
//         "BACK",
//         style: TextStyle(
//           color: Color.fromRGBO(23, 104, 46, 1.0),
//         ),
//       ),
//     );

//     // final lowerButtons = <Widget>[
//     //   ElevatedButton(
//     //     onPressed: (ref.watch(onboardingControllerProvider) ==
//     //             onboardingMessages.length - 1)
//     //         ? null
//     //         : ref.read(onboardingControllerProvider.notifier).nextButton,
//     //     style: ElevatedButton.styleFrom(
//     //         disabledBackgroundColor: const Color.fromRGBO(23, 104, 46, 0.5),
//     //         minimumSize: const Size.fromHeight(54.0),
//     //         backgroundColor: const Color.fromRGBO(23, 104, 46, 1.0),
//     //         shape: RoundedRectangleBorder(
//     //           borderRadius: BorderRadius.circular(
//     //             10.0,
//     //           ),
//     //         )),
//     //     child: Text(
//     //       (ref.watch(onboardingControllerProvider) ==
//     //               onboardingMessages.length - 1)
//     //           ? "GET STARTED"
//     //           : "NEXT",
//     //       style: const TextStyle(color: Colors.white),
//     //     ),
//     //   ),
//     //   Row(
//     //     mainAxisAlignment: MainAxisAlignment.end,
//     //     children: [
//     //       TextButton(
//     //         onPressed: () {},
//     //         //child: skipText.,
//     //         child: const Text(
//     //           "Skip",
//     //           style: TextStyle(
//     //             color: Color.fromRGBO(23, 104, 46, 1.0),
//     //             fontWeight: FontWeight.w400,
//     //             fontSize: 12.0,
//     //             height: 1.5,
//     //           ),
//     //         ),
//     //       ),
//     //     ],
//     //   ),
//     // ];

//     final onboardingPages = List.generate(
//       3,
//       (index) => Container(
//         constraints: BoxConstraints(
//           minHeight: 203,
//           maxHeight: mediaQuery.size.height * 0.4242,
//         ),
//         padding: const EdgeInsets.symmetric(
//           horizontal: 31.0,
//         ),
//         child: Column(
//           children: [
//             Expanded(
//               flex: 3,
//               child: SvgPicture(
//                 AssetBytesLoader(
//                   onboardingMessages[index].imageSvgPath,
//                 ),
//               ),
//             ),
//             const Spacer(),
//             Flexible(
//               child: Text(
//                 onboardingMessages[index].title,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   color: Color.fromRGBO(37, 197, 115, 1.0),
//                   fontWeight: FontWeight.w700,
//                   fontSize: 18.0,
//                   height: 1.5,
//                 ),
//               ),
//             ),
//             Flexible(
//               child: Text(
//                 onboardingMessages[index].message,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.w400,
//                   fontSize: 14.0,
//                   height: 1.5,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 constraints: BoxConstraints(
//                   minHeight: 203,
//                   maxHeight: mediaQuery.size.height * 0.4242,
//                 ),
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 31.0,
//                 ),
//                 child: PageView.builder(
//                   controller: onboardingMessagePageController,
//                   onPageChanged: ref
//                       .read(onboardingControllerProvider.notifier)
//                       .onPageChanged,
//                   itemBuilder: (_, index) =>
//                       onboardingPages[index % onboardingPages.length],
//                 ),
//               ),
//               SmoothPageIndicator(
//                 //activeIndex: ref.watch(onboardingControllerProvider),
//                 controller: onboardingMessagePageController,
//                 count: onboardingMessages.length,
//                 effect: const ExpandingDotsEffect(
//                   activeDotColor: Color.fromRGBO(23, 104, 46, 1.0),
//                   dotColor: Color.fromRGBO(23, 104, 46, 1.0),
//                 ),
//               ),
//               Flexible(
//                 child: SizedBox(
//                   height: mediaQuery.size.height * 0.173,
//                   child: AnimatedList(
//                     key: listKey,
//                     initialItemCount: lowerButtons.length,
//                     shrinkWrap: true,
//                     itemBuilder: (context, index, animation) {
//                       return FadeTransition(
//                         opacity: animation,
//                         child: lowerButtons[index],
//                       );
//                     },
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
