import 'package:flutter/material.dart';

// Product model to hold product information and price
class Product {
  final String title;
  final String imagePath;
  final double price;
  final String description;
  final String ingredients;

  Product({
    required this.title,
    required this.imagePath,
    required this.price,
    required this.description,
    required this.ingredients,
  });
}

class MenuPageLandscapeLayout extends StatelessWidget {
  const MenuPageLandscapeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Example Categories and Products
          _buildCategorySection(context, 'Appetizers', [
            Product(
              title: 'Bruschetta',
              imagePath: 'lib/images/Appetizers/Bruschetta.jpg',
              price: 120.0,
              description: 'Toasted bread topped with tomatoes and basil.',
              ingredients: 'Bread, Tomatoes, Basil, Olive Oil',
            ),
            Product(
              title: 'Stuffed Mushrooms',
              imagePath: 'lib/images/Appetizers/stuffed_mushrooms.jpg',
              price: 150.0,
              description: 'Mushrooms stuffed with cheese and herbs.',
              ingredients: 'Mushrooms, Cheese, Herbs',
            ),
            Product(
              title: 'Devilled Eggs',
              imagePath: 'lib/images/Appetizers/Deviled_Eggs.jpg',
              price: 100.0,
              description: 'Hard boiled eggs with a spicy yolk filling.',
              ingredients: 'Eggs, Mayonnaise, Mustard, Paprika',
            ),
          ]),

          _buildCategorySection(context, 'Soups', [
            Product(
              title: 'Chicken Noodle Soup',
              imagePath: 'lib/images/Soups/chicken_noodle_soup.jpg',
              price: 180.0,
              description: 'Classic chicken noodle soup.',
              ingredients: 'Chicken, Noodles, Vegetables, Broth',
            ),
            Product(
              title: 'Cream of Mushroom Soup',
              imagePath: 'lib/images/Soups/Cream_of_Mushroom_Soup.jpg',
              price: 200.0,
              description: 'Creamy mushroom soup with herbs.',
              ingredients: 'Mushrooms, Cream, Garlic, Herbs',
            ),
            Product(
              title: 'Creamy Basil Soup',
              imagePath: 'lib/images/Soups/creamy_tomato_basil_soup.jpg',
              price: 170.0,
              description: 'Rich and creamy basil soup.',
              ingredients: 'Basil, Cream, Garlic, Tomatoes',
            ),
          ]),

          _buildCategorySection(context, 'Main Courses', [
            Product(
              title: 'Chicken Alfredo Pasta',
              imagePath: 'lib/images/MainCourses/Chicken_Alfredo_Pasta.webp',
              price: 300.0,
              description: 'Pasta with creamy Alfredo sauce.',
              ingredients: 'Pasta, Chicken, Cream, Parmesan',
            ),
            Product(
              title: 'Chicken Biriyani',
              imagePath: 'lib/images/MainCourses/chicken_biryani.jpg',
              price: 350.0,
              description: 'Spiced chicken biriyani.',
              ingredients: 'Chicken, Rice, Spices, Yogurt',
            ),
            Product(
              title: 'Chicken Fried Rice',
              imagePath: 'lib/images/MainCourses/Chicken_Fried_Rice.jpg',
              price: 250.0,
              description: 'Fried rice with chicken and vegetables.',
              ingredients: 'Rice, Chicken, Vegetables, Soy Sauce',
            ),
          ]),

          _buildCategorySection(context, 'Desserts', [
            Product(
              title: 'Apple Pie',
              imagePath: 'lib/images/Desserts/Apple_Pie.jpg',
              price: 150.0,
              description: 'Classic apple pie with a flaky crust.',
              ingredients: 'Apples, Flour, Sugar, Butter',
            ),
            Product(
              title: 'Tiramisu',
              imagePath: 'lib/images/Desserts/Tiramisu.jpg',
              price: 220.0,
              description: 'Italian coffee-flavored dessert.',
              ingredients: 'Mascarpone, Coffee, Cocoa, Ladyfingers',
            ),
            Product(
              title: 'Chocolate Ice-Cream',
              imagePath: 'lib/images/Desserts/Chocolate_Ice_Cream.jpg',
              price: 100.0,
              description: 'Rich chocolate ice cream.',
              ingredients: 'Chocolate, Cream, Sugar',
            ),
          ]),

          _buildCategorySection(context, 'Beverages', [
            Product(
              title: 'Mojito',
              imagePath: 'lib/images/Beverages/mojito.jpg',
              price: 120.0,
              description: 'Refreshing mint and lime drink.',
              ingredients: 'Mint, Lime, Sugar, Soda',
            ),
            Product(
              title: 'Iced Tea',
              imagePath: 'lib/images/Beverages/IcedTea.jpg',
              price: 90.0,
              description: 'Chilled tea with lemon.',
              ingredients: 'Tea, Lemon, Sugar, Ice',
            ),
            Product(
              title: 'Iced Milo',
              imagePath: 'lib/images/Beverages/Iced_milo.jpg',
              price: 110.0,
              description: 'Cold chocolate malt drink.',
              ingredients: 'Milo, Milk, Sugar, Ice',
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildCategorySection(
      BuildContext context, String categoryTitle, List<Product> products) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Title
          Text(
            categoryTitle,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.displayMedium?.color,
            ),
          ),
          const SizedBox(height: 8.0), // Spacing between title and products

          // Products Horizontal Scroll
          SizedBox(
            height: 320, // Fixed height to accommodate the cards and image
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return _buildProductCard(context, products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        // Navigate to the product details page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: Container(
        width: 350, // Fixed width for the horizontally scrollable cards
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  product.imagePath,
                  width: double.infinity,
                  height: 180, // Adjust height for landscape view
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8.0),
              // Product Title
              Text(
                product.title,
                style: const TextStyle(fontSize: 16),
              ),

              // Price in Rupees
              Text(
                'Rs.${product.price.toStringAsFixed(2)}',
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),

              // Add to Cart Button
              ElevatedButton(
                onPressed: () {
                  // Handle add to cart functionality here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${product.title} added to cart!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo[900],
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Product Details Page
class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(  // Scrollable container to prevent overflow
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  product.imagePath,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                product.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Rs.${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Description: ${product.description}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Ingredients: ${product.ingredients}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16.0),

              // Add to Cart Button stays at the bottom
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle add to cart functionality here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${product.title} added to cart!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo[900],
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
