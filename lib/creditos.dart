import 'package:flutter/material.dart';
class Creditos extends StatelessWidget {
  const Creditos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Creditos')),
      body: Center(
        child: Text('Creditos e referencias'),
      ),
    );
  }
}