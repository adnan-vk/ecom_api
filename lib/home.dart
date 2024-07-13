import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductController>(context, listen: false).getProduct();
    return Scaffold(
      appBar: AppBar(
        title: const Text("H o m e"),
      ),
      body: Consumer<ProductController>(
        builder: (context, value, child) {
          if (value.booklist.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: value.booklist.length,
            itemBuilder: (context, index) {
              final item = value.booklist[index];
              return ListTile(
                title: Text("${item.authour}"),
              );
            },
          );
        },
      ),
    );
  }
}
