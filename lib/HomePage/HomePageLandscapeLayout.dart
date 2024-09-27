import 'package:flutter/material.dart';

class HomePageLandscapeLayout extends StatelessWidget {
  const HomePageLandscapeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Full-width Banner Image with Rounded Corners
          // Full-width Banner Image with Rounded Corners
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            child: Stack(
              alignment: Alignment.center, // Center the text
              children: [
                SizedBox(
                  width: double.infinity, // Full width
                  child: Image.asset(
                    'lib/images/Banner.jpg', // Your banner image path
                    fit: BoxFit.cover, // Cover to fill the space
                    height: 250, // Height of the banner
                  ),
                ),
                // Semi-transparent Background
                Container(
                  width: double.infinity,
                  height: 250,
                  color: Colors.black38, // Semi-transparent background
                ),
                // Banner Text Overlay
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    'Welcome to Classic Eats',
                    style: TextStyle(fontSize: 30, fontFamily: 'PlaywriteCU', color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          // Description paragraph
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onInverseSurface, // Set the background color based on theme
                borderRadius: BorderRadius.circular(15.0), // Set the border radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Optional shadow for depth
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10.0), // Padding inside the container
              child: Text(
                'Experience Culinary Excellence in Every Bite. At Classic Eats, '
                    'we blend innovation and tradition to bring you a diverse '
                    'menu that delights the senses. Indulge in our expertly '
                    'crafted dishes in a warm and inviting atmosphere, '
                    'perfect for any occasion. Discover the art of flavor '
                    'with us today!',
                style: TextStyle(fontSize: 19, color: Theme.of(context).colorScheme.inverseSurface), // Set text color based on theme
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // Category section with cards
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),
          ),

          // Horizontal Scrollable Category Cards
          SizedBox(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal, // Scroll horizontally
              children: [
                categoryCard(context, 'lib/images/Appetizers.jpg', 'Appetizers'),
                categoryCard(context, 'lib/images/Soups.jpg', 'Soups'),
                categoryCard(context, 'lib/images/MainCourses.jpg', 'Main Courses'),
                categoryCard(context, 'lib/images/Desserts.jpg', 'Desserts'),
                categoryCard(context, 'lib/images/beverages.jpg', 'Beverages'),
              ],
            ),
          ),


          // New food image card
          Card(
            margin: const EdgeInsets.all(26.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // Rounded corners for the card
            ),
            child: Stack(
              alignment: Alignment.center, // Center the text over the image
              children: [
                // Image for the card
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0), // Match the border radius with the card
                  child: Image.asset(
                    'lib/images/New products.webp', // Replace with your image path
                    width: double.infinity, // Full width
                    height: 230, // Set height of the image
                    fit: BoxFit.cover, // Cover the card space
                  ),
                ),
              ],
            ),
          ),

          // Exclusive offers section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title for Exclusive Offers
                const Text(
                  'Exclusive Offers',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0), // Add spacing between the title and the card

                // Card with Exclusive Offer Image
                Card(
                  margin: const EdgeInsets.all(0), // Adjust margin inside the Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0), // Rounded corners for the card
                  ),
                  child: Stack(
                    alignment: Alignment.center, // Center the text over the image
                    children: [
                      // Image for the card
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0), // Match the border radius with the card
                        child: Image.asset(
                          'lib/images/food-coupons.jpg', // Replace with your exclusive offer image path
                          width: double.infinity, // Full width
                          height: 240, // Set height of the image
                          fit: BoxFit.cover, // Cover the card space
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryCard(BuildContext context, String imagePath, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0), // Rounded corners for the image
            child: Image.asset(
              imagePath, // Image for the category
              width: 200, // Set a fixed width for each card
              height: 150, // Set a fixed height for the image
              fit: BoxFit.cover, // Cover to fill the space
            ),
          ),
          const SizedBox(height: 8.0), // Spacing between image and title
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
        ],
      ),
    );
  }
}
