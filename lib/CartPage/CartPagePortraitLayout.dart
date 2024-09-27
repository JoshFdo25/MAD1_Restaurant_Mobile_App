import 'package:flutter/material.dart';
import 'package:restautant_application/CartPage/CartPage.dart';

class CartPagePortraitLayout extends StatefulWidget {
  const CartPagePortraitLayout({super.key});

  @override
  _CartPagePortraitLayoutState createState() => _CartPagePortraitLayoutState();
}

class _CartPagePortraitLayoutState extends State<CartPagePortraitLayout> {
  // List of cart items (initially empty)
  List<CartItem> cartItems = [
    CartItem(
        title: 'Bruschetta',
        imagePath: 'lib/images/Appetizers/Bruschetta.jpg',
        price: 120.0),
    CartItem(
        title: 'Chicken Alfredo Pasta',
        imagePath: 'lib/images/MainCourses/Chicken_Alfredo_Pasta.webp',
        price: 300.0),
    // Add more sample items here if needed
  ];

  // Method to calculate total price of the cart
  double getTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  // Method to remove an item from the cart
  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  // Method to increase item quantity
  void _increaseQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  // Method to decrease item quantity
  void _decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'Your cart is empty.',
                style: TextStyle(fontSize: 20),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return _buildCartItem(context, index);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rs.${getTotalPrice().toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add checkout logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo[900],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Center(child: Text('Proceed to Checkout')),
                  ),
                ),
                const SizedBox(height: 16), // Space below checkout button
              ],
            ),
    );
  }

  Widget _buildCartItem(BuildContext context, int index) {
    final item = cartItems[index];

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset(
          item.imagePath,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(item.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text('Price: Rs.${item.price.toStringAsFixed(2)}'),
            const SizedBox(height: 4),
            Row(
              children: [
                IconButton(
                  onPressed: () => _decreaseQuantity(index),
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Text(item.quantity.toString()),
                IconButton(
                  onPressed: () => _increaseQuantity(index),
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => _removeItem(index),
        ),
      ),
    );
  }
}
