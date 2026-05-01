import 'package:flutter/material.dart';
class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: Center(
        child: Text('Testando conhecimentos'),
      ),
    );
  }
}