import 'package:flutter/material.dart';

import '../../application/dtos/product_dto.dart';

class ItemDetailsScreen extends StatelessWidget {
  final ProductDto _product;

  const ItemDetailsScreen({super.key, required ProductDto product})
      : _product = product;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Center(
              //child: Text(),
              ),
        ),
      ),
    );
  }
}
