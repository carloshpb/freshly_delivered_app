import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/animated/on_sale_card_carousel.dart';
import '../../../../constants/custom_colors.dart';
import '../../../../constants/strings.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends ConsumerWidget {
  //final _emailController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuerySize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              SizedBox(
                height: 47.0,
                child: Consumer(
                  builder: (context, searchRef, _) {
                    return TextFormField(
                      initialValue:
                          searchRef.read(searchProductTextFieldHomeProvider),
                      autofillHints: const [AutofillHints.email],
                      //controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                      onChanged: (searchText) => searchRef
                          .watch(searchProductTextFieldHomeProvider.notifier)
                          .state = searchText,
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
                    );
                  },
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: mediaQuerySize.height * 0.1954976,
                    child: OnSaleCardCarousel(
                      advertisements: [],
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
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
                  SizedBox(
                    height: mediaQuerySize.height * 0.1789099526,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {},
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: mediaQuerySize.height * 0.10663507,
                    child: Card(
                      child: GestureDetector(
                        onTap: () {},
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: CachedNetworkImage(
                            imageUrl: currentAdvertisement.image,
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
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: mediaQuerySize.height * 0.1789099526,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
