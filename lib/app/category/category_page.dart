import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  //final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Modular.to.navigate('/products/Informatica');
              },
              child: const Text("Informática"),
            ),
            TextButton(
              onPressed: () {
                Modular.to.pushNamed('/products/Roupas');
              },
              child: const Text("Roupas"),
            )
          ],
        ),
      ),
    );
  }
}
