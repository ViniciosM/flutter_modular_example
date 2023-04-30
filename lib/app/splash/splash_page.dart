import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        title: const Text("Splash"),
      ),
      body: Center(
        child: TextButton(
          child: const Text("Address Page"),
          onPressed: () {
            Modular.to.pushNamed('/address');
          },
        ),
      ),
    );
  }
}
