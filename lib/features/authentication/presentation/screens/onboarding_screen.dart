import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final _currentCarouselIndex = StateProvider<int>((_) => 0);

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final carouselController = CarouselController();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Consumer(
                builder: (context, ref, child) {
                  final actualIndex = ref.watch(_currentCarouselIndex);
                  return Column(
                  children: [
                    CarouselSlider.builder(
                      carouselController: carouselController,
                      itemBuilder: (context, index, realIndex) => ,
                    ),
                    AnimatedSmoothIndicator(
                      activeIndex: actualIndex,
                      count: 3,
                      effect: const ExpandingDotsEffect(),
                    ),
                  ],
                );
                } ,
              ),
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.23,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
