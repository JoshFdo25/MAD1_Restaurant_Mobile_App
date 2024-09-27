import 'package:flutter/material.dart';
import 'package:restautant_application/HomePage/HomePage.dart';
import 'package:restautant_application/LoginScreen/LoginScreen.dart';
import 'package:restautant_application/MenuPage/MenuPage.dart';
import 'package:restautant_application/CartPage/CartPage.dart';
import 'package:restautant_application/ContactPage/ContactPage.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light; // Define the initial theme mode
  bool _isLoggedIn = false; // Track login status

  void _toggleTheme() {
    setState(() {
      _themeMode =
      _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _login() {
    setState(() {
      _isLoggedIn = true; // Set login status to true
    });
  }

  void _skipLogin() {
    setState(() {
      _isLoggedIn = false; // User skips login
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      home: _isLoggedIn
          ? Home(
        onToggleTheme: _toggleTheme,
        isDarkMode: _themeMode == ThemeMode.dark,
      )
          : LoginScreen(onLogin: _login, onSkip: _skipLogin), // Set initial route to LoginScreen
    );
  }
}

class Home extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const Home({super.key, required this.onToggleTheme, required this.isDarkMode});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0; // Track which page is selected
  bool _isProfileDrawerOpen = false; // Track if the profile drawer is open

  final List<Widget> _pages = [
    const HomePage(),
    const MenuPage(),
    const CartPage(),
  ];

  void _onItemTapped(int index) {
    if (index == 3) {
      _openProfileDrawer(); // Open profile drawer when profile is selected
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _openProfileDrawer() {
    setState(() {
      _isProfileDrawerOpen = true;
    });
  }

  void _closeProfileDrawer() {
    setState(() {
      _isProfileDrawerOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        bool isLandscape = orientation == Orientation.landscape;

        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.indigo[900],
                title: const Text(
                  "Classic Eats",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'PlaywriteCU'
                  ),
                ),
              ),
              body: _pages[_selectedIndex], // Display the selected page
              bottomNavigationBar: ClipRRect(
                borderRadius: BorderRadius.circular(isLandscape ? 20.0 : 25.0),
                child: SizedBox(
                  height: isLandscape ? 65.0 : 78.0,
                  child: NavigationBar(
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: _onItemTapped,
                    indicatorColor: Colors.white,
                    destinations: [
                      NavigationDestination(
                        icon: Icon(
                          Icons.home,
                          color: _selectedIndex == 0
                              ? Colors.black
                              : widget.isDarkMode
                              ? Colors.white
                              : Colors.grey.shade800,
                        ),
                        label: 'Home',
                      ),
                      NavigationDestination(
                        icon: Icon(
                          Icons.menu,
                          color: _selectedIndex == 1
                              ? Colors.black
                              : widget.isDarkMode
                              ? Colors.white
                              : Colors.grey.shade800,
                        ),
                        label: 'Menu',
                      ),
                      NavigationDestination(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: _selectedIndex == 2
                              ? Colors.black
                              : widget.isDarkMode
                              ? Colors.white
                              : Colors.grey.shade800,
                        ),
                        label: 'Cart',
                      ),
                      NavigationDestination(
                        icon: Icon(
                          Icons.person,
                          color: _selectedIndex == 3
                              ? Colors.black
                              : widget.isDarkMode
                              ? Colors.white
                              : Colors.grey.shade800,
                        ),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Overlay when drawer is open
            if (_isProfileDrawerOpen)
              GestureDetector(
                onTap: _closeProfileDrawer,
                child: Container(
                  color: Colors.black.withOpacity(0.7),
                ),
              ),

            // Profile Drawer Sliding from the right
            if (_isProfileDrawerOpen)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                top: 0,
                bottom: 0,
                right: _isProfileDrawerOpen ? 0 : -MediaQuery.of(context).size.width * 0.75,
                width: MediaQuery.of(context).size.width * 0.75,
                child: Material(
                  elevation: 16,
                  child: Container(
                    color: widget.isDarkMode ? Colors.grey[850] : Colors.white70,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UserAccountsDrawerHeader(
                            accountName: const Text("Josh Fdo"),
                            accountEmail: const Text("joshddo@gmail.com"),
                            currentAccountPicture: const CircleAvatar(
                              backgroundImage: AssetImage(''), // Add your image asset here
                            ),
                            decoration: BoxDecoration(
                              color: Colors.indigo[900],
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.brightness_6),
                            title: const Text("Dark Mode"),
                            trailing: Switch(
                              value: widget.isDarkMode,
                              onChanged: (bool value) {
                                widget.onToggleTheme();
                              },
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            leading: const Icon(Icons.phone),
                            title: const Text("Contact Us"),
                            onTap: () {
                              _closeProfileDrawer();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ContactPage()),
                              );
                            },
                          ),
                          const Divider(),
                          ListTile(
                            leading: const Icon(Icons.logout),
                            title: const Text("Logout"),
                            onTap: () {
                              // Implement logout logic
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
