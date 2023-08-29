import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freshly_delivered_app/constants/custom_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../constants/strings.dart';
import '../features/dashboard/application/dtos/product_dto.dart';
import '../routers/app_router.dart';

class ProductCard extends StatelessWidget {
  final double? _height;
  final double? _width;
  final NormalProductDto _product;
  final VoidCallback? _onTap;
  final VoidCallback? _tapFavorite;
  final bool? _isFavorite;

  final NumberFormat _priceFormat = NumberFormat.simpleCurrency();

  ProductCard({
    super.key,
    double? height,
    double? width,
    required NormalProductDto product,
    VoidCallback? onTap,
    VoidCallback? tapFavorite,
    bool? isFavorite,
  })  : _height = height,
        _width = width,
        _product = product,
        _onTap = onTap,
        _tapFavorite = tapFavorite,
        _isFavorite = isFavorite;

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
          return Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: _onTap,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * 0.31788079,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: CachedNetworkImage(
                            imageUrl: _product.imagePath,
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
                          _priceFormat.format(_product.price),
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
                  ),
                ),
              ),
              if (_isFavorite != null)
                Positioned(
                  top: 8.0,
                  right: 7.0,
                  height: constraints.maxHeight * 0.0866225165,
                  width: constraints.maxHeight * 0.0993377483,
                  child: IconButton(
                    icon: Icon((_isFavorite!)
                        ? Icons.favorite
                        : Icons.favorite_outline),
                    onPressed: _tapFavorite,
                    color: Colors.red,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
