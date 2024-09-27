import 'package:flutter/material.dart';
import 'package:restautant_application/HomePage/HomePageLandscapeLayout.dart';
import 'package:restautant_application/HomePage/HomePagePortraitLayout.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return const HomePagePortraitLayout(); // Use the updated Portrait Layout
        } else {
          return const HomePageLandscapeLayout(); // Use the updated Landscape Layout
        }
      },
    );
  }
}
