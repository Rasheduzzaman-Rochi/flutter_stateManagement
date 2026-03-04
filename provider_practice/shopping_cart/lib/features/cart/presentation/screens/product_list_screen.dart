import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/features/cart/application/cart_provider.dart';
import 'package:shopping_cart/features/cart/domain/item.dart';
import 'package:shopping_cart/features/cart/presentation/screens/cart_screen.dart';

class ProductListScreen extends StatelessWidget {
  final List<Item> products = [
    Item(name: "MacBook Air", price: 120000),
    Item(name: "iPhone 14 Pro", price: 150000),
    Item(name: "iPad Pro", price: 80000),
  ];
  ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gadget Shop"),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            ),
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text("${product.price} TK"),
            trailing: IconButton(
              onPressed: () {
                context.read<CartProvider>().addItem(product);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${product.name} added!"))
                );
              },
              icon: const Icon(Icons.add_box_rounded),
            ),
          );
        },
      ),
    );
  }
}
