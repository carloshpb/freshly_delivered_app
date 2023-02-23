import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../controllers/onboarding_controller.dart';

final _currentCarouselIndex = StateProvider.autoDispose<int>((_) => 0);

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final carouselController = CarouselController();
    final onboardingMessages =
        ref.read(onboardingControllerProvider.notifier).onboardingMessages;
    final actualIndex = ref.watch(_currentCarouselIndex);

    final GlobalKey<AnimatedListState> _listKey =
        GlobalKey<AnimatedListState>();

    @override
    void initState() {
      super.initState();

      //TODO : Make correct list of buttons for this page and remove the sample code below
      _list = ListModel<int>(
        listKey: _listKey,
        initialItems: <int>[0, 1, 2],
        removedItemBuilder: _buildRemovedItem,
      );
      _nextItem = 3;
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: onboardingMessages.length,
                    carouselController: carouselController,
                    itemBuilder: (context, index, _) => Column(
                      children: [
                        SvgPicture(
                          AssetBytesLoader(
                              onboardingMessages[index].imageSvgPath),
                        ),
                        Text(onboardingMessages[index].title),
                        Text(onboardingMessages[index].message),
                      ],
                    ),
                    options: CarouselOptions(),
                  ),
                  AnimatedSmoothIndicator(
                    activeIndex: actualIndex,
                    count: onboardingMessages.length,
                    effect: const ExpandingDotsEffect(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.23,
            child: AnimatedList(
              key: _listKey,
              itemBuilder: (context, index, animation) {},
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(onPressed: onPressed, child: child),
                ElevatedButton(onPressed: onPressed, child: child),
                TextButton(onPressed: onPressed, child: child),
              ],
            ),
          )
        ],
      ),
    );
  }
}
