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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const GroceryHomePage(),
    );
  }
}

// Custom Widget - Experiment 6
class ProductCard extends StatelessWidget {
  final String emoji;
  final String name;
  final String price;

  const ProductCard({
    super.key,
    required this.emoji,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: SizedBox(
        width: 140,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                emoji,
                style: const TextStyle(fontSize: 45),
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                price,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Buy Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GroceryHomePage extends StatelessWidget {
  const GroceryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fresh Grocery'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            const Text(
              'Fresh Groceries at Your Doorstep!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Popular Products',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ProductCard(
                  emoji: '🍎',
                  name: 'Apple',
                  price: '₹120',
                ),
                ProductCard(
                  emoji: '🍌',
                  name: 'Banana',
                  price: '₹60',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ProductCard(
                  emoji: '🥕',
                  name: 'Carrot',
                  price: '₹50',
                ),
                ProductCard(
                  emoji: '🥛',
                  name: 'Milk',
                  price: '₹40',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}