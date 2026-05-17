import 'package:flutter/material.dart';
class PrimeirosSocorros extends StatelessWidget {
  const PrimeirosSocorros({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Primeiros Socorros')),
      bottomNavigationBar: Container(
        color: const Color(0xFFFFF3E0),
        padding: const EdgeInsets.all(12),
        child: const Text(
          "© 2026 UNISAGRADO",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.brown,
          ),
        ),
      ),
      body: Center(
        child: Text('Primeiros Socorros'),
      ),
    );
  }
}