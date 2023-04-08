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

  @override
  int build() {
    _onboardingMessages =
        ref.read(onboardingServiceRepository).onboardingMessages;
    //_carouselController = CarouselController();
    _listKey = GlobalKey<AnimatedListState>();
    _onboardingMessagePageController = PageController(
      initialPage: 0,
    );
    return 0;
  }

  List<OnboardingMessage> get onboardingMessages => _onboardingMessages;

  //CarouselController get carouselController => _carouselController;

  PageController get onboardingMessagePageController =>
      _onboardingMessagePageController;

  GlobalKey<AnimatedListState> get animatedListKey => _listKey;

  void nextButton() {
    var lastIndex = state;
    state++;
    _onboardingMessagePageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    if (lastIndex == 0) {
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
