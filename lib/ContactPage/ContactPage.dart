import 'package:flutter/material.dart';
import 'package:restautant_application/ContactPage/ContactPageLandscapeLayout.dart';
import 'package:restautant_application/ContactPage/ContactPagePortraitLayout.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return const ContactPagePortraitLayout(); // Use the updated Portrait Layout
        } else {
          return const ContactPageLandscapeLayout(); // Use the updated Landscape Layout
        }
      },
    );
  }
}
