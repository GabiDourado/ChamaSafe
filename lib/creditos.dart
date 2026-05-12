import 'package:flutter/material.dart';
class Creditos extends StatelessWidget {
  const Creditos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Creditos')),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Disciplina:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            const Text(
              "Desenvolvimento de software",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 15),
            const Text(
              "Professor:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            const Text(
              "Prof. Dr. Elvio Gilberto da Silva",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 15),
            const Text(
              "Equipe:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            const Text(
              "Eduardo Merlin Simão",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 15),
            const Text(
              "Gabriela Dos Santos Dourado",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 15),
            const Text(
              "Leridia Casanova Abrantes",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 15),
            const Text(
              "Curso:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.asset('assets/Ciencia_da_Computacao.jpg', height: 80),
            const SizedBox(height: 15),
            const Text(
              "Apoio:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.asset('assets/extensao.jpg', height: 80),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}