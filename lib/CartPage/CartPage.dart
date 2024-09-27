import 'package:flutter/material.dart';
import 'package:restautant_application/CartPage/CartPageLandscapeLayout.dart';
import 'package:restautant_application/CartPage/CartPagePortraitLayout.dart';

class CartItem {
  final String title;
  final String imagePath;
  final double price;
  int quantity;

  CartItem({required this.title, required this.imagePath, required this.price, this.quantity = 1});
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return const CartPagePortraitLayout(); // Use the updated Portrait Layout
        } else {
          return const CartPageLandscapeLayout(); // Use the updated Landscape Layout
        }
      },
    );
  }
}
