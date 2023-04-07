import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final onboardingMessages =
        ref.read(onboardingControllerProvider.notifier).onboardingMessages;
    final carouselController =
        ref.read(onboardingControllerProvider.notifier).carouselController;
    final listKey =
        ref.read(onboardingControllerProvider.notifier).animatedListKey;

    final buttons = <Widget>[
      ElevatedButton(
        onPressed: () {},
        child: Text(
          (ref.watch(onboardingControllerProvider) ==
                  onboardingMessages.length - 1)
              ? "NEXT"
              : "GET STARTED",
        ),
      ),
      TextButton(
        onPressed: () {},
        child: const Text("Skip"),
      ),
    ];

    final animatedButton = ElevatedButton(
      onPressed: () {},
      child: const Text("BACK"),
    );

    if (ref.watch(onboardingControllerProvider) >= 1) {}

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
                    activeIndex: ref.watch(onboardingControllerProvider),
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
              key: listKey,
              initialItemCount: 2,
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("BACK"),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  final _carouselController = CarouselController();

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final _carouselController = CarouselController();

  late final List<OnboardingMessage> onboardingMessages;
  late final StateController<int> indexStateController;
  late final int actualIndex;

  final List<Widget> _buttonList = [
    ElevatedButton(
      onPressed: () {},
      child: const Text("NEXT"),
    ),
    ElevatedButton(
      onPressed: () {},
      child: const Text("BACK"),
    ),
    TextButton(
      onPressed: () {},
      child: const Text("Skip"),
    ),
  ];

  void nextButton() {
    if (actualIndex != 2) {
      indexStateController.state = actualIndex + 1;
    }
  }

  @override
  void initState() {
    super.initState();

    actualIndex = ref.watch(_currentCarouselIndex);
    indexStateController = ref.read(_currentCarouselIndex.notifier);
    onboardingMessages =
        ref.read(onboardingControllerProvider.notifier).onboardingMessages;

    //TODO : Make correct list of buttons for this page and remove the sample code below
    _list = ListModel<int>(
      listKey: _listKey,
      initialItems: <int>[0, 1, 2],
      removedItemBuilder: _buildRemovedItem,
    );
    _nextItem = 3;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

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
                    carouselController: _carouselController,
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
