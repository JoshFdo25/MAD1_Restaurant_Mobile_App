import 'package:flutter/material.dart';

class LoginScreenPortraitLayout extends StatefulWidget {
  final Function onLogin;
  final Function onSkip; // Callback for skipping login

  const LoginScreenPortraitLayout({
    super.key,
    required this.onLogin,
    required this.onSkip,
  });

  @override
  _LoginScreenPortraitLayoutState createState() =>
      _LoginScreenPortraitLayoutState();
}

class _LoginScreenPortraitLayoutState extends State<LoginScreenPortraitLayout> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController(); // Controller for confirm password

  bool _isSigningUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/restaurant_images.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Classic Eats",
                        style: TextStyle(
                          color: Colors.indigo[900],
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PlaywriteCU',
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _isSigningUp ? "Sign Up" : "Login",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _usernameController,
                        decoration:
                        const InputDecoration(labelText: "Username"),
                      ),
                      TextField(
                        controller: _passwordController,
                        decoration:
                        const InputDecoration(labelText: "Password"),
                        obscureText: true,
                      ),
                      // Conditionally render the confirm password field if signing up
                      if (_isSigningUp) ...[
                        TextField(
                          controller: _confirmPasswordController,
                          decoration:
                          const InputDecoration(labelText: "Confirm Password"),
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                      ],
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                              Colors.indigo[900]!), // Set the button color here
                        ),
                        onPressed: () {
                          if (_usernameController.text.isNotEmpty &&
                              _passwordController.text.isNotEmpty &&
                              (!_isSigningUp ||
                                  _passwordController.text == _confirmPasswordController.text)) {
                            widget.onLogin(); // Call the login method
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please fill all fields or passwords do not match')),
                            );
                          }
                        },
                        child: Text(
                          _isSigningUp ? "Sign Up" : "Login",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Removed the skip button from here
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _isSigningUp =
                            !_isSigningUp; // Toggle between Login and Sign Up
                          });
                        },
                        child: Text(_isSigningUp
                            ? "Already have an account? Login"
                            : "Don't have an account? Sign Up"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
