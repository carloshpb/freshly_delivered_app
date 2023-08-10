import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common_widgets/animated/on_sale_card_carousel.dart';
import '../../../../common_widgets/product_card.dart';
import '../../../../constants/custom_colors.dart';
import '../../../../constants/strings.dart';
import '../../../../routers/app_router.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends ConsumerWidget {
  //final _emailController = TextEditingController();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuerySize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(47.0),
          child: TextField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.go,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            onSubmitted: (text) {
              context.go(
                Uri(
                  path: AppRouter.searchResults.path,
                  queryParameters: {'product-name': text},
                ).toString(),
              );
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: CustomColors.buttonGreenDeactivated,
              hintText: Strings.searchProductsHint,
              hintStyle: const TextStyle(
                color: Colors.white,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Shimmer.fromColors(
            baseColor: Colors.green.shade400,
            highlightColor: Colors.grey.shade100,
            enabled: ref.watch(homeControllerProvider).isLoading &&
                !ref.watch(homeControllerProvider).isRefreshing &&
                !ref.watch(homeControllerProvider).isReloading,
            child: Column(
              children: [
                // Search product field
                // SizedBox(
                //   height: 47.0,
                //   child: TextField(
                //     keyboardType: TextInputType.text,
                //     textInputAction: TextInputAction.go,
                //     style: const TextStyle(
                //       color: Colors.white,
                //       fontSize: 16.0,
                //     ),
                //     onSubmitted: (text) {
                //       context.go(
                //         Uri(
                //           path: AppRouter.searchResults.path,
                //           queryParameters: {'product-name': text},
                //         ).toString(),
                //       );
                //     },
                //     decoration: InputDecoration(
                //       filled: true,
                //       fillColor: CustomColors.buttonGreenDeactivated,
                //       hintText: Strings.searchProductsHint,
                //       hintStyle: const TextStyle(
                //         color: Colors.white,
                //       ),
                //       prefixIcon: const Icon(
                //         Icons.search,
                //         color: Colors.white,
                //       ),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(
                //           10.0,
                //         ),
                //         borderSide: BorderSide.none,
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 13.0,
                ),
                // On Sales Carousel cards
                SizedBox(
                  height: mediaQuerySize.height * 0.1954976,
                  child: ref.watch(
                    homeControllerProvider.select(
                      (asyncHomeState) => asyncHomeState.when(
                        data: (state) {
                          return OnSaleCardCarousel(
                            advertisements: state.advertisements,
                          );
                        },
                        error: (error, stackTrace) {
                          return const Card(
                            color: CustomColors.buttonGreen,
                            child: Center(
                              child: Text(
                                //TODO
                                Strings.unknownErrorCode,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                        loading: () {
                          return const Card();
                        },
                        skipLoadingOnReload: true,
                        skipError: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13.0,
                ),
                // Popular Bar
                SizedBox(
                  height: mediaQuerySize.height * 0.0390995,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 22.0),
                    decoration: BoxDecoration(
                      color: CustomColors.buttonGreen,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: AutoSizeText(
                      Strings.popular.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        height: 15.0,
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13.0,
                ),
                // First popular products list
                SizedBox(
                  height: mediaQuerySize.height * 0.1789099526,
                  child: ref.watch(homeControllerProvider).when(
                        data: (state) {
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.firstPopularProducts.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 33.0,
                            ),
                            itemBuilder: (context, index) {
                              // the ProductCard will always be the same height - width relation, according to the actual height of the screen
                              var cardHeight = mediaQuerySize.height * 0.17891;
                              return ProductCard(
                                height: cardHeight,
                                width: cardHeight * 0.662252,
                                product: state.firstPopularProducts[index],
                              );
                            },
                          );
                        },
                        error: (error, stackTrace) {
                          return SizedBox(
                            child: SizedBox(
                              height: mediaQuerySize.height * 0.17891,
                              child: const Center(
                                child: Text(
                                  //TODO
                                  Strings.unknownErrorCode,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        loading: () {
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 33.0,
                            ),
                            itemBuilder: (context, index) {
                              // the ProductCard will always be the same height - width relation, according to the actual height of the screen
                              var cardHeight = mediaQuerySize.height * 0.17891;
                              // Shimmer Placeholder
                              return Container(
                                height: cardHeight,
                                width: cardHeight * 0.662252,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  border: Border.all(
                                    color: CustomColors.buttonGreen,
                                    width: 1.0,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        skipLoadingOnReload: true,
                        skipError: true,
                      ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                // Special Sale Card
                SizedBox(
                  height: mediaQuerySize.height * 0.10663507,
                  child: ref.watch(homeControllerProvider).when(
                        data: (state) {
                          return Card(
                            child: GestureDetector(
                              onTap: (state.specialOffer.id.isNotEmpty)
                                  ? () => context.go(
                                        AppRouter.onSales.path,
                                        extra: state.specialOffer,
                                      )
                                  : null,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: CachedNetworkImage(
                                  imageUrl: state.specialOffer.imagePath,
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
                        error: (error, stackTrace) {
                          return const Card(
                            color: CustomColors.buttonGreen,
                            child: Center(
                              child: Text(
                                //TODO
                                Strings.unknownErrorCode,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                        loading: () {
                          return const Card();
                        },
                        skipLoadingOnReload: true,
                        skipError: true,
                      ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                // Second popular products
                SizedBox(
                  height: mediaQuerySize.height * 0.1789099526,
                  child: ref.watch(homeControllerProvider).when(
                        data: (state) {
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.secondPopularProducts.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 33.0,
                            ),
                            itemBuilder: (context, index) {
                              // the ProductCard will always be the same height - width relation, according to the actual height of the screen
                              var cardHeight = mediaQuerySize.height * 0.17891;
                              return ProductCard(
                                height: cardHeight,
                                width: cardHeight * 0.662252,
                                product: state.secondPopularProducts[index],
                              );
                            },
                          );
                        },
                        error: (error, stackTrace) {
                          return SizedBox(
                            child: SizedBox(
                              height: mediaQuerySize.height * 0.17891,
                              child: const Center(
                                child: Text(
                                  //TODO
                                  Strings.unknownErrorCode,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        loading: () {
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 33.0,
                            ),
                            itemBuilder: (context, index) {
                              // the ProductCard will always be the same height - width relation, according to the actual height of the screen
                              var cardHeight = mediaQuerySize.height * 0.17891;
                              // Shimmer Placeholder
                              return Container(
                                height: cardHeight,
                                width: cardHeight * 0.662252,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  border: Border.all(
                                    color: CustomColors.buttonGreen,
                                    width: 1.0,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        skipLoadingOnReload: true,
                        skipError: true,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
