import 'package:flutter/material.dart';
import 'package:restautant_application/MenuPage/MenuPageLandscapeLayout.dart';
import 'package:restautant_application/MenuPage/MenuPagePortraitLayout.dart';


class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return const MenuPagePortraitLayout(); // Use the updated Portrait Layout
        } else {
          return const MenuPageLandscapeLayout(); // Use the updated Landscape Layout
        }
      },
    );
  }
}
