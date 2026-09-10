import 'package:flutter/material.dart';

void main() {
  runApp(const GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fresh Grocery'),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              color: Colors.green,
              child: const Text(
                'Fresh Groceries at Your Doorstep!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              'Popular Products',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                productCard('🍎', 'Apple', '₹120'),
                productCard('🍌', 'Banana', '₹60'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                productCard('🥕', 'Carrot', '₹50'),
                productCard('🥛', 'Milk', '₹40'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget productCard(String emoji, String name, String price) {
    return Container(
      width: 150,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 45),
          ),
          Text(name),
          Text(price),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Buy Now'),
          ),
        ],
      ),
    );
  }
}