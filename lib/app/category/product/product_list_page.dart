import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key, required this.product}) : super(key: key);

  final String product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Produtos'),
        actions: [
          IconButton(
              onPressed: () {
                Modular.to.navigate('/redirect');
              },
              icon: const Icon(Icons.home_outlined))
        ],
      ),
      body: Center(
          child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
          title: Text("$product ----- $index"),
        ),
      )),
    );
  }
}
