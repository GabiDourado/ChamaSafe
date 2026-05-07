import 'package:flutter/material.dart';

class Aprender extends StatefulWidget {
  const Aprender({super.key});

  @override
  State<Aprender> createState() => _AprenderState();
}

class _AprenderState extends State<Aprender> {
  int telaAtual = 0;

  void mudarTela(int index) {  // Função para mudar a tela
    setState(() {
      telaAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5E6),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Vamos Aprender!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            if (telaAtual == 0) {
              Navigator.pop(context); // Sai da tela aprender
            } else {
              setState(() => telaAtual = 0); // Volta para o menu do aprender
            }
          },
        ),
      ),
      body: _construirCorpo(),
    );
  }

  Widget _construirCorpo() {
    switch (telaAtual) {
      case 0: return menuAprender();
      case 1: return telaConteudo(
          "O que é e tipos de queimadura",
          "Queimaduras são lesões causadas por contato direto com alguma fonte de calor, como ferro de passar, água fervendo ou panelas.\n\n"
              "Tipos:\n"
              "• Térmicas: Fogo, vapor ou sol.\n"
              "• Químicas: Substâncias que queimam a pele.\n"
              "• Elétricas: Choques e fios desencapados.\n\n"
              "Graus:\n"
              "1º Grau: Inchaço e vermelhidão.\n"
              "2º Grau: Atinge camadas profundas, causa cicatrizes.\n"
              "3º Grau: Atinge até o osso. A pele pode carbonizar.",
          'assets/gotinho2.png'
      );
      case 2: return telaConteudo(
          "Como prevenir",
          "• Verifique se panelas estão quentes antes de tocar.\n"
              "• Velas longe de tecidos e cortinas.\n"
              "• Longe de fósforos e álcool.\n"
              "• Não mexa em fios ou tomadas.\n"
              "• Use protetor solar.\n"
              "• Não misture produtos de limpeza.",
          'assets/gotinho2.png'
      );
      case 3: return telaConteudo(
          "O que causa",
          "• Encostar em panelas quentes.\n"
              "• Água fervendo.\n"
              "• Sol sem proteção.\n"
              "• Mexer em fios elétricos.\n"
              "• Misturar agentes químicos.",
          'assets/gotinho2.png'
      );
      case 4: return telaConteudo(
          "O que fazer",
          "Coloque a parte queimada em água corrente fria por 10 minutos. Cubra com pano limpo e úmido.\n\n"
              "IMPORTANTE:\n"
              "• Não toque na queimadura.\n"
              "• Nunca fure as bolhas.\n"
              "• Nunca puxe peles soltas.\n"
              "• Não passe manteiga ou pasta de dente!",
          'assets/gotinhofeliz.png'
      );
      default: return menuAprender();
    }
  }

  Widget menuAprender() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/Gotinho.png', height: 150),
          const SizedBox(height: 30),
          botaoMenu("O que é e tipos", 1),
          botaoMenu("Como prevenir", 2),
          botaoMenu("O que causa", 3),
          botaoMenu("O que fazer", 4),
        ],
      ),
    );
  }

  Widget botaoMenu(String texto, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        onPressed: () => mudarTela(index),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(texto, style: const TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }

  Widget telaConteudo(String titulo, String texto, String imagem) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          Text(titulo, textAlign: TextAlign.center, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange)),
          const SizedBox(height: 20),
          Image.asset(imagem, height: 120),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.orange.shade100)),
            child: Text(texto, style: const TextStyle(fontSize: 16, height: 1.5)),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => mudarTela(0),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
            child: const Text("Voltar ao Menu", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}