import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'responsive_ui.dart';
import 'navigation.dart';

void main() {
  // Experiment 5: Global state management using Provider
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const GroceryApp(),
    ),
  );
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fresh Basket',

      // Experiment 4: Named route
      routes: {
        '/categories': (context) => const NavigationPage(),
      },

      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> products = const [
    {
      'name': 'Fresh Apples',
      'price': '₹120 / kg',
      'image':
          'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=500',
    },
    {
      'name': 'Bananas',
      'price': '₹60 / dozen',
      'image':
          'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=500',
    },
    {
      'name': 'Fresh Carrots',
      'price': '₹50 / kg',
      'image':
          'https://images.unsplash.com/photo-1445282768818-728615cc910a?w=500',
    },
    {
      'name': 'Tomatoes',
      'price': '₹45 / kg',
      'image':
          'https://images.unsplash.com/photo-1546094096-0df4bcaaa337?w=500',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Experiment 3: MediaQuery gets screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fresh Basket',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      // Experiment 4: Named route navigation
                      Navigator.pushNamed(context, '/categories');
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                  if (cart.cartCount > 0)
                    Positioned(
                      right: 5,
                      top: 5,
                      child: CircleAvatar(
                        radius: 9,
                        child: Text(
                          '${cart.cartCount}',
                          style: const TextStyle(fontSize: 11),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth < 600 ? 16 : 32,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello 👋',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                'What would you like to buy today?',
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 18),

              TextField(
                decoration: InputDecoration(
                  hintText: 'Search groceries...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  categoryItem(
                    context,
                    '🥬',
                    'Vegetables',
                  ),
                  categoryItem(
                    context,
                    '🍎',
                    'Fruits',
                  ),
                  categoryItem(
                    context,
                    '🥛',
                    'Dairy',
                  ),
                  categoryItem(
                    context,
                    '🍞',
                    'Bakery',
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fresh & Healthy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Get fresh groceries delivered to your doorstep.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Popular Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // Experiment 3: Responsive UI using LayoutBuilder
              ResponsiveProductLayout(
                products: products.map((product) {
                  return ProductCard(
                    name: product['name']!,
                    price: product['price']!,
                    image: product['image']!,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Experiment 4: Navigator navigation
  static Widget categoryItem(
    BuildContext context,
    String emoji,
    String name,
  ) {
    return GestureDetector(
      onTap: () {
        // Experiment 4: Navigate to another screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NavigationPage(),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 32),
              ),
            ),
          ),

          const SizedBox(height: 7),

          Text(
            name,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String name;
  final String price;
  final String image;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  widget.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

                // Experiment 5: Local state using setState()
                IconButton(
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  icon: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ],
            ),

            const Text(
              '⭐ 4.8',
              style: TextStyle(color: Colors.orange),
            ),

            const SizedBox(height: 4),

            Text(
              widget.price,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Experiment 5: Update global cart state
                  context.read<CartProvider>().addToCart();
                },
                child: const Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}