import 'package:flutter/material.dart';

class PrimeirosSocorros extends StatefulWidget {
  const PrimeirosSocorros({super.key});

  @override
  State<PrimeirosSocorros> createState() => _PrimeirosSocorrosState();
}

class _PrimeirosSocorrosState extends State<PrimeirosSocorros> {
  int abaAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5E6),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Primeiros Socorros',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xFFFFF3E0),
        padding: const EdgeInsets.all(12),
        child: const Text(
          "© 2026 UNISAGRADO",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => setState(() => abaAtual = 0),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: abaAtual == 0 ? Colors.green : Colors.grey[300],
                        foregroundColor: abaAtual == 0 ? Colors.white : Colors.black87,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Text("Passo a Passo"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => setState(() => abaAtual = 1),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: abaAtual == 1 ? Colors.redAccent : Colors.grey[300],
                        foregroundColor: abaAtual == 1 ? Colors.white : Colors.black87,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Text("Emergência"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.orange.shade100, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: abaAtual == 0 ? _conteudoPassoAPasso() : _conteudoEmergencia(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // parte do passo a passo
  List<Widget> _conteudoPassoAPasso() {
    return [
      itemImagem('assets/primeiros_socorros.png'),
      const Text(
        "O que fazer imediatamente:",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
      ),
      const SizedBox(height: 15),
      itemTexto("Resfrie:"),
      itemTexto("Coloque a queimadura debaixo de água corrente e fria por pelo menos 10 a 20 minutos. Nunca use gelo, pois ele pode causar mais danos ao tecido."),
      itemImagem('assets/agua_fria.png', altura: 80),
      const Divider(),
      itemTexto("Remova acessórios:"),
      itemTexto("Tire anéis, pulseiras, relógios e roupas antes que a pele comece a inchar. Se alguma roupa estiver grudada, deixe-a no lugar e corte o tecido ao redor."),
      itemImagem('assets/objeto_quente.png', altura: 80),
      const Divider(),
      itemTexto("Proteja:"),
      itemTexto("Cubra a área com um pano limpo, seco e que não solte fiapos, ou use uma gaze."),
      itemImagem('assets/curativos.png', altura: 80),
    ];
  }

  // parte da emergencia
  List<Widget> _conteudoEmergencia() {
    return [
      itemImagem('assets/atencao.png'),
      const Text(
        "Ligue para o SAMU (192) ou Corpo de Bombeiros (193) se:",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent),
      ),
      const SizedBox(height: 15),
      itemTexto("• A queimadura for extensa ou profunda (atingir camadas mais grossas da pele, ficando esbranquiçada ou carbonizada)."),
      itemImagem('assets/nao_faca_isso.png', altura: 80),
      const Divider(),
      itemTexto("• Atingir o rosto, mãos, pés, articulações ou genitais."),
      itemTexto("• For causada por produtos químicos ou corrente elétrica."),
      itemTexto("• Apresentar dificuldade para respirar."),
    ];
  }

  // função auxiliar pra construção do layout

  Widget itemTexto(String texto) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 16,
          height: 1.5,
          color: Color(0xFF4E342E),
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget itemImagem(String path, {double altura = 130}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Image.asset(
          path,
          height: altura,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}