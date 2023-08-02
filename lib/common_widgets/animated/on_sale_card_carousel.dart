import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../features/dashboard/application/dtos/advertisement_dto.dart';

class OnSaleCardCarousel extends StatelessWidget {
  List<AdvertisementDto> _advertisements;

  final PageController _pageController = PageController(
    initialPage: 0,
  );

  OnSaleCardCarousel(
      {super.key, required List<AdvertisementDto> advertisements})
      : _advertisements = advertisements;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          // onPageChanged: (nextPageIndex) {
          //   var currentIndex =
          //       ref.watch(onboardingControllerProvider).pagePosition;
          //   // to avoid redoing animation in case the page index was changed by button tap
          //   if (currentIndex != nextPageIndex) {
          //     ref
          //         .watch(onboardingControllerProvider.notifier)
          //         .onPageChanged(nextPageIndex);
          //   }
          // },
          itemCount: _advertisements.length,
          itemBuilder: (_, index) {
            var currentAdvertisement =
                _advertisements[index % _advertisements.length];
            return Card();
          },
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: ref.watch(onboardingControllerProvider).messages.length,
          effect: const ExpandingDotsEffect(
            activeDotColor: CustomColors.buttonGreen,
            dotColor: CustomColors.buttonGreen,
          ),
        ),
      ],
    );
  }
}
