import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Splash"),
      ),
      body: Center(
        child: TextButton(
          child: const Text("Category Page"),
          onPressed: () {
            Modular.to.pushNamed('/category');
          },
        ),
      ),
    );
  }
}
