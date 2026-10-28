import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Experiment 9: Fetching grocery products from a REST API
class ApiProductsPage extends StatefulWidget {
  const ApiProductsPage({super.key});

  @override
  State<ApiProductsPage> createState() => _ApiProductsPageState();
}

class _ApiProductsPageState extends State<ApiProductsPage> {
  late Future<List<dynamic>> productsFuture;

  @override
  void initState() {
    super.initState();
    productsFuture = fetchProducts();
  }

  // Experiment 9: Send HTTP GET request and decode JSON data
  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products/category/groceries'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return data['products'] as List<dynamic>;
    } else {
      throw Exception('Failed to load grocery products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery Products from API'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Could not load products. Check your internet.'),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        productsFuture = fetchProducts();
                      });
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          final products = snapshot.data ?? [];

          if (products.isEmpty) {
            return const Center(child: Text('No products found.'));
          }

          // Experiment 9: Display API data using ListView.builder
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index] as Map<String, dynamic>;

              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: ListTile(
                  leading: Image.network(
                    product['thumbnail']?.toString() ?? '',
                    width: 55,
                    height: 55,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.shopping_basket, size: 40);
                    },
                  ),
                  title: Text(product['title']?.toString() ?? 'Grocery item'),
                  subtitle: Text(
                    product['description']?.toString() ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text('₹${product['price'] ?? '--'}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}