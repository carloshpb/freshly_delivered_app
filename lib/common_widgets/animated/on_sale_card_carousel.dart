import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/custom_colors.dart';
import '../../constants/strings.dart';
import '../../features/dashboard/application/dtos/advertisement_dto.dart';
import '../../routers/app_router.dart';

class OnSaleCardCarousel extends StatelessWidget {
  final List<AdvertisementDto> _advertisements;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  OnSaleCardCarousel(
      {super.key, required List<AdvertisementDto> advertisements})
      : _advertisements = advertisements;

  @override
  Widget build(BuildContext context) {
    return (_advertisements.isEmpty)
        ? const Card(
            child: Center(
              child: Text(
                Strings.moreAdvertisementsSoon,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        : Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: _advertisements.length,
                itemBuilder: (_, index) {
                  var currentAdvertisement =
                      _advertisements[index % _advertisements.length];
                  return Card(
                    child: GestureDetector(
                      onTap: () => context.go(
                        AppRouter.onSales.path,
                        extra: currentAdvertisement,
                      ),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: CachedNetworkImage(
                          imageUrl: currentAdvertisement.imagePath,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                            value: downloadProgress.progress,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: _advertisements.length,
                effect: const ScrollingDotsEffect(
                  activeDotColor: Colors.white,
                  dotColor: Colors.transparent,
                ),
              ),
            ],
          );
  }
}
