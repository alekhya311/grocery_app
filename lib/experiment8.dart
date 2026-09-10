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
      home: const GroceryHomePage(),
    );
  }
}

class GroceryHomePage extends StatefulWidget {
  const GroceryHomePage({super.key});

  @override
  State<GroceryHomePage> createState() => _GroceryHomePageState();
}

class _GroceryHomePageState extends State<GroceryHomePage> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fresh Grocery'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              expanded = !expanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: expanded ? 300 : 200,
            height: expanded ? 150 : 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: expanded ? Colors.green : Colors.lightGreen,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              expanded ? 'Fresh & Healthy!' : 'Tap Me!',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}