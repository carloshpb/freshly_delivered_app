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
import '../../application/dtos/advertisement_dto.dart';
import '../../application/dtos/product_dto.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends ConsumerWidget {
  //final _emailController = TextEditingController();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<AdvertisementDto>> currentAdvertisementsState = ref.watch(
      homeControllerProvider.select(
        (asyncState) => switch (asyncState) {
          AsyncData(:final value) => AsyncData(value.advertisements),
          AsyncError(:final error, :final stackTrace) => asyncState.hasValue
              ? AsyncError<List<AdvertisementDto>>(error, stackTrace)
                  .copyWithPrevious(AsyncData(asyncState.value!.advertisements))
              : AsyncError<List<AdvertisementDto>>(error, stackTrace),
          _ => const AsyncLoading<List<AdvertisementDto>>().copyWithPrevious(
              asyncState.hasValue
                  ? AsyncData(asyncState.value!.advertisements)
                  : const AsyncData(<AdvertisementDto>[])),
        },
      ),
    );

    AsyncValue<List<ProductDto>> popularProductsState = ref.watch(
      homeControllerProvider.select(
        (asyncState) => switch (asyncState) {
          AsyncData(:final value) => AsyncData(value.popularProducts),
          AsyncError(:final error, :final stackTrace) => asyncState.hasValue
              ? AsyncError<List<ProductDto>>(error, stackTrace)
                  .copyWithPrevious(
                      AsyncData(asyncState.value!.popularProducts))
              : AsyncError<List<ProductDto>>(error, stackTrace),
          _ => asyncState.hasValue
              ? const AsyncLoading<List<ProductDto>>().copyWithPrevious(
                  AsyncData(asyncState.value!.popularProducts))
              : const AsyncLoading(),
        },
      ),
    );

    AsyncValue<AdvertisementDto> specialOfferState = ref.watch(
      homeControllerProvider.select(
        (asyncState) => switch (asyncState) {
          AsyncData(:final value) => AsyncData(value.specialOffer),
          AsyncError(:final error, :final stackTrace) => asyncState.hasValue
              ? AsyncError<AdvertisementDto>(error, stackTrace)
                  .copyWithPrevious(AsyncData(asyncState.value!.specialOffer))
              : AsyncError<AdvertisementDto>(error, stackTrace),
          _ => asyncState.hasValue
              ? const AsyncLoading<AdvertisementDto>()
                  .copyWithPrevious(AsyncData(asyncState.value!.specialOffer))
              : const AsyncLoading(),
        },
      ),
    );

    AsyncValue<List<ProductDto>> specialOfferProductsState = ref.watch(
      homeControllerProvider.select(
        (asyncState) => switch (asyncState) {
          AsyncData(:final value) => AsyncData(value.specialOfferProducts),
          AsyncError(:final error, :final stackTrace) => asyncState.hasValue
              ? AsyncError<List<ProductDto>>(error, stackTrace)
                  .copyWithPrevious(
                      AsyncData(asyncState.value!.specialOfferProducts))
              : AsyncError<List<ProductDto>>(error, stackTrace),
          _ => asyncState.hasValue
              ? const AsyncLoading<List<ProductDto>>().copyWithPrevious(
                  AsyncData(asyncState.value!.specialOfferProducts))
              : const AsyncLoading(),
        },
      ),
    );

    String searchProductName = ref.watch(
      homeControllerProvider.select(
        (asyncState) => switch (asyncState) {
          AsyncData(:final value) => value.searchProductName,
          _ => asyncState.hasValue ? asyncState.value!.searchProductName : '',
        },
      ),
    );

    AsyncValue<List<ProductDto>> searchProductsResultState = ref.watch(
      homeControllerProvider.select(
        (asyncState) => switch (asyncState) {
          AsyncData(:final value) => AsyncData(value.searchProductsResult),
          AsyncError(:final error, :final stackTrace) => asyncState.hasValue
              ? AsyncError<List<ProductDto>>(error, stackTrace)
                  .copyWithPrevious(
                      AsyncData(asyncState.value!.searchProductsResult))
              : AsyncError<List<ProductDto>>(error, stackTrace),
          _ => asyncState.hasValue
              ? const AsyncLoading<List<ProductDto>>().copyWithPrevious(
                  AsyncData(asyncState.value!.searchProductsResult))
              : const AsyncLoading(),
        },
      ),
    );

    final mediaQuerySize = MediaQuery.sizeOf(context);
    return Scaffold(
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
                SizedBox(
                  height: 47.0,
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
                const SizedBox(
                  height: 13.0,
                ),
                // Search Products by name home screen
                if (searchProductName.isNotEmpty)
                  Column(
                    children: [],
                  ),

                // normal dashboard home screen
                if (searchProductName.isEmpty)
                  Column(
                    children: [
                      // On Sales Carousel cards
                      SizedBox(
                        height: mediaQuerySize.height * 0.1954976,
                        child: switch (currentAdvertisementsState) {
                          AsyncData(:final value) => OnSaleCardCarousel(
                              advertisements: value,
                            ),
                          AsyncError() =>
                            (!currentAdvertisementsState.hasValue ||
                                    currentAdvertisementsState.value!.isEmpty)
                                ? const Card(
                                    color: CustomColors.buttonGreen,
                                    child: Center(
                                      child: Text(
                                        Strings.advertisementsNotFound,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                : OnSaleCardCarousel(
                                    advertisements:
                                        currentAdvertisementsState.value!,
                                  ),
                          _ => (!currentAdvertisementsState.hasValue ||
                                  currentAdvertisementsState.value!.isEmpty)
                              ? const Card()
                              : OnSaleCardCarousel(
                                  advertisements:
                                      currentAdvertisementsState.value!,
                                ),
                        },
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
                      // popular products list
                      SizedBox(
                        height: mediaQuerySize.height * 0.1789099526,
                        child: switch (popularProductsState) {
                          AsyncData(:final value) => ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: value.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 33.0,
                              ),
                              itemBuilder: (context, index) {
                                // the ProductCard will always be the same height - width relation, according to the actual height of the screen
                                var cardHeight =
                                    mediaQuerySize.height * 0.17891;
                                return ProductCard(
                                  height: cardHeight,
                                  width: cardHeight * 0.662252,
                                  product: value[index],
                                );
                              },
                            ),
                          AsyncError() => (!popularProductsState.hasValue ||
                                  popularProductsState.value!.isEmpty)
                              ? const AutoSizeText(
                                  "${Strings.productsNotFound} ${Strings.tryAgainLater}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    height: 15.0,
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                )
                              : ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: popularProductsState.value!.length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    width: 33.0,
                                  ),
                                  itemBuilder: (context, index) {
                                    // the ProductCard will always be the same height - width relation, according to the actual height of the screen
                                    var cardHeight =
                                        mediaQuerySize.height * 0.17891;
                                    return ProductCard(
                                      height: cardHeight,
                                      width: cardHeight * 0.662252,
                                      product:
                                          popularProductsState.value![index],
                                    );
                                  },
                                ),
                          _ => (!popularProductsState.hasValue ||
                                  popularProductsState.value!.isEmpty)
                              ? ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 6,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    width: 33.0,
                                  ),
                                  itemBuilder: (context, index) {
                                    // the ProductCard will always be the same height - width relation, according to the actual height of the screen
                                    var cardHeight =
                                        mediaQuerySize.height * 0.17891;
                                    // Shimmer Placeholder
                                    return Container(
                                      height: cardHeight,
                                      width: cardHeight * 0.662252,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        border: Border.all(
                                          color: CustomColors.buttonGreen,
                                          width: 1.0,
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: popularProductsState.value!.length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    width: 33.0,
                                  ),
                                  itemBuilder: (context, index) {
                                    // the ProductCard will always be the same height - width relation, according to the actual height of the screen
                                    var cardHeight =
                                        mediaQuerySize.height * 0.17891;
                                    return ProductCard(
                                      height: cardHeight,
                                      width: cardHeight * 0.662252,
                                      product:
                                          popularProductsState.value![index],
                                    );
                                  },
                                )
                        },
                      ),

                      const SizedBox(
                        height: 16.0,
                      ),

                      // Special Sale Card
                      SizedBox(
                        height: mediaQuerySize.height * 0.10663507,
                        child: switch (specialOfferState) {
                          AsyncData(:final value) => Card(
                              child: GestureDetector(
                                onTap: (value.id.isNotEmpty)
                                    ? () => context.go(
                                          AppRouter.onSales.path,
                                          extra: value,
                                        )
                                    : null,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: CachedNetworkImage(
                                    imageUrl: value.imagePath,
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
                            ),
                          AsyncLoading() => (!specialOfferState.hasValue)
                              ? const Card()
                              : Card(
                                  child: GestureDetector(
                                    onTap: (specialOfferState
                                            .value!.id.isNotEmpty)
                                        ? () => context.go(
                                              AppRouter.onSales.path,
                                              extra: specialOfferState.value!,
                                            )
                                        : null,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            specialOfferState.value!.imagePath,
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
                                ),
                          _ => (!specialOfferState.hasValue)
                              ? const Card(
                                  color: CustomColors.buttonGreen,
                                  child: Center(
                                    child: Text(
                                      Strings.advertisementsNotFound,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : Card(
                                  child: GestureDetector(
                                    onTap: (specialOfferState
                                            .value!.id.isNotEmpty)
                                        ? () => context.go(
                                              AppRouter.onSales.path,
                                              extra: specialOfferState.value!,
                                            )
                                        : null,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            specialOfferState.value!.imagePath,
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
                                )
                        },
                      ),

                      const SizedBox(
                        height: 16.0,
                      ),
                      // Special offer products
                      SizedBox(
                        height: mediaQuerySize.height * 0.1789099526,
                        child: switch (specialOfferProductsState) {
                          AsyncData(:final value) => ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: value.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 33.0,
                              ),
                              itemBuilder: (context, index) {
                                // the ProductCard will always be the same height - width relation, according to the actual height of the screen
                                var cardHeight =
                                    mediaQuerySize.height * 0.17891;
                                return ProductCard(
                                  height: cardHeight,
                                  width: cardHeight * 0.662252,
                                  product: value[index],
                                );
                              },
                            ),
                          AsyncLoading() =>
                            (!specialOfferProductsState.hasValue ||
                                    specialOfferProductsState.value!.isEmpty)
                                ? ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 6,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: 33.0,
                                    ),
                                    itemBuilder: (context, index) {
                                      // the ProductCard will always be the same height - width relation, according to the actual height of the screen
                                      var cardHeight =
                                          mediaQuerySize.height * 0.17891;
                                      // Shimmer Placeholder
                                      return Container(
                                        height: cardHeight,
                                        width: cardHeight * 0.662252,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                          border: Border.all(
                                            color: CustomColors.buttonGreen,
                                            width: 1.0,
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        specialOfferProductsState.value!.length,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: 33.0,
                                    ),
                                    itemBuilder: (context, index) {
                                      // the ProductCard will always be the same height - width relation, according to the actual height of the screen
                                      var cardHeight =
                                          mediaQuerySize.height * 0.17891;
                                      return ProductCard(
                                        height: cardHeight,
                                        width: cardHeight * 0.662252,
                                        product: specialOfferProductsState
                                            .value![index],
                                      );
                                    },
                                  ),
                          _ => (!specialOfferProductsState.hasValue ||
                                  specialOfferProductsState.value!.isEmpty)
                              ? const AutoSizeText(
                                  "${Strings.productsNotFound} ${Strings.tryAgainLater}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    height: 15.0,
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                )
                              : ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      specialOfferProductsState.value!.length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    width: 33.0,
                                  ),
                                  itemBuilder: (context, index) {
                                    // the ProductCard will always be the same height - width relation, according to the actual height of the screen
                                    var cardHeight =
                                        mediaQuerySize.height * 0.17891;
                                    return ProductCard(
                                      height: cardHeight,
                                      width: cardHeight * 0.662252,
                                      product: specialOfferProductsState
                                          .value![index],
                                    );
                                  },
                                )
                        },
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
