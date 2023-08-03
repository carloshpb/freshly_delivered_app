import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freshly_delivered_app/constants/custom_colors.dart';
import 'package:go_router/go_router.dart';

import '../constants/strings.dart';
import '../features/dashboard/application/dtos/product_dto.dart';
import '../routers/app_router.dart';

class ProductCard extends StatelessWidget {
  final double? _height;
  final double? _width;
  final ProductDto _product;

  final NumberFormat _priceFormat;

  const ProductCard(
      {super.key, double? height, double? width, required ProductDto product})
      : _height = height,
        _width = width,
        _product = product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: _width,
      padding: const EdgeInsets.symmetric(
        horizontal: 6.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(
          color: CustomColors.buttonGreen,
          width: 1.0,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.31788079,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: CachedNetworkImage(
                    imageUrl: _product.image,
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.079470198675,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.06622516556,
                child: AutoSizeText(
                  _product.title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: const TextStyle(
                    color: CustomColors.specialOrange,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.0198675496688,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.0927152317881,
                child: AutoSizeText(
                  _product.description,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.03973509933774,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.09933774834,
                child: AutoSizeText(
                  "",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: const TextStyle(
                    color: CustomColors.specialOrange,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.03973509933774,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.1125827814569,
                child: ElevatedButton(
                  onPressed: () => context.go(
                    AppRouter.itemDetails.path,
                    extra: _product,
                  ),
                  child: const AutoSizeText(
                    Strings.addToCard,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
