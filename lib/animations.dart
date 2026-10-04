import 'package:flutter/material.dart';

// Experiment 8: UI Animations using Flutter Animation Framework
class AnimationsPage extends StatefulWidget {
  const AnimationsPage({super.key});

  @override
  State<AnimationsPage> createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage> {
  bool expanded = false;
  double opacity = 1.0;
  bool moved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery Animations'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Experiment 8: Animations',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            // Experiment 8: AnimatedContainer
            const Text(
              '1. Animated Container',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: expanded ? 250 : 120,
              height: expanded ? 180 : 120,
              decoration: BoxDecoration(
                color: expanded ? Colors.green : Colors.orange,
                borderRadius: BorderRadius.circular(
                  expanded ? 30 : 15,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                  size: 55,
                ),
              ),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              child: const Text('Animate Container'),
            ),

            const SizedBox(height: 35),

            // Experiment 8: AnimatedOpacity
            const Text(
              '2. Fade Animation',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(seconds: 2),
              child: const Icon(
                Icons.local_grocery_store,
                size: 100,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  opacity = opacity == 1.0 ? 0.0 : 1.0;
                });
              },
              child: const Text('Fade In / Fade Out'),
            ),

            const SizedBox(height: 35),

            // Experiment 8: AnimatedPositioned
            const Text(
              '3. Slide Animation',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 120,
              width: double.infinity,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    left: moved ? 220 : 10,
                    top: 20,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  moved = !moved;
                });
              },
              child: const Text('Slide Cart'),
            ),
          ],
        ),
      ),
    );
  }
}