import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/onboarding_message.dart';
import '../../domain/services/impl/onboarding_service_impl.dart';

final onboardingControllerProvider =
    NotifierProvider.autoDispose<OnboardingController, int>(
  () => OnboardingController(),
  name: r'onboardingControllerProvider',
);

class OnboardingController extends AutoDisposeNotifier<int> {
  late final List<OnboardingMessage> _onboardingMessages;
  //late final CarouselController _carouselController;
  late final GlobalKey<AnimatedListState> _listKey;
  late final PageController _onboardingMessagePageController;
  late final List<Widget> _lowerButtons;
  late final Widget _backButton;

  @override
  int build() {
    _onboardingMessages =
        ref.read(onboardingServiceRepository).onboardingMessages;
    //_carouselController = CarouselController();
    _listKey = GlobalKey<AnimatedListState>();
    _onboardingMessagePageController = PageController(
      initialPage: 0,
    );
    _lowerButtons = <Widget>[
      ElevatedButton(
        onPressed: (state == onboardingMessages.length - 1) ? null : nextButton,
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
          (state == onboardingMessages.length - 1) ? "GET STARTED" : "NEXT",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {},
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
      onPressed: backButton,
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
    // ..addListener(() {
    //   if(_onboardingMessagePageController.page.round()) {

    //   }
    // });

    // ref.onDispose(() {
    //   _onboardingMessagePageController.dispose();
    // });

    return 0;
  }

  List<OnboardingMessage> get onboardingMessages => _onboardingMessages;

  //CarouselController get carouselController => _carouselController;

  PageController get onboardingMessagePageController =>
      _onboardingMessagePageController;

  GlobalKey<AnimatedListState> get animatedListKey => _listKey;

  List<Widget> get lowerButtons => _lowerButtons;

  void onPageChanged(int page) {
    final lastPage = _onboardingMessagePageController.page;
    if (lastPage == null) {
      return;
    }
    // swiping right
    if (page > lastPage) {
      state = page;
      if (lastPage == 0) {
        _listKey.currentState?.insertItem(1);
      }
    }
    // swiping left
    else if (page < lastPage) {
      state = page;
      if (lastPage == 1) {
        _listKey.currentState?.removeItem(
          1,
          (context, animation) => SizeTransition(
            sizeFactor: animation,
            child: TextButton(
              onPressed: backButton,
              child: const Text("BACK"),
            ),
          ),
        );
      }
    }
  }

  void nextButton() {
    var lastIndex = state;
    state++;
    _onboardingMessagePageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    // Talvez tenha q deixar antes do state++
    if (lastIndex == 0) {
      _lowerButtons.insert(1, _backButton);
      _listKey.currentState?.insertItem(1);
    }
  }

  void backButton() {
    var lastIndex = state;
    state--;
    _onboardingMessagePageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    if (lastIndex == 1) {
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
}
