import 'package:flutter/material.dart';
import 'LoginScreenPortraitLayout.dart';
import 'LoginScreenLandscapeLayout.dart'; // Create this layout for landscape

class LoginScreen extends StatelessWidget {
  final Function onLogin;
  final Function onSkip;

  const LoginScreen({
    super.key,
    required this.onLogin,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        // Check orientation and return the appropriate layout
        if (orientation == Orientation.portrait) {
          return LoginScreenPortraitLayout(
            onLogin: () {
              // Perform your login logic here
              onLogin(); // Call the provided onLogin function
            },
            onSkip: () {
              // Perform your skip logic here
              onSkip(); // Call the provided onSkip function
            },
          );
        } else {
          return LoginScreenLandscapeLayout(
            onLogin: () {
              // Perform your login logic here
              onLogin(); // Call the provided onLogin function
            },
            onSkip: () {
              // Perform your skip logic here
              onSkip(); // Call the provided onSkip function
            },
          );
        }
      },
    );
  }
}
