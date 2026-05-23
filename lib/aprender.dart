import 'package:flutter/material.dart';

class Aprender extends StatefulWidget {
  const Aprender({super.key});

  @override
  State<Aprender> createState() => _AprenderState();
}

class _AprenderState extends State<Aprender> {
  int telaAtual = 0;

  void mudarTela(int index) {
    setState(() {
      telaAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        title: const Text(
          'Vamos Aprender!',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            if (telaAtual == 0) {
              Navigator.pop(context);
            } else {
              setState(() => telaAtual = 0);
            }
          },
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
          ),
        ),
      ),
      body: Container(
        child: _construirCorpo(),
      ),
    );
  }

  Widget _construirCorpo() {
    switch (telaAtual) {
      case 0:
        return menuAprender();
      case 1:
        return telaConteudo(
          "O que é e tipos de queimadura",
          [
            itemImagem('assets/atencao.png', largura: 120),
            itemTexto("Queimaduras são lesões causadas por contato direto com alguma fonte de calor."),
            const Divider(height: 30),
            itemTexto("• Queimaduras térmicas: Provocadas por fogo, vapor, objetos quentes ou pelo sol."),
            itemImagem('assets/sol_forte.png', largura: 100),
            itemTexto("• Queimaduras químicas: São causadas por produtos químicos que machucam a pele."),
            itemTexto("• Queimaduras elétricas: Causadas por descargas elétricas e fios desencapados."),
            const Divider(height: 30),
            itemTextoDestaque("Graus de Queimadura:"),
            itemTexto("1 grau: Atingem as primeiras camadas da pele. Causam inchaço e vermelhidão."),
            itemImagem('assets/primeiro_grau.png', largura: 120),
            itemTexto("2 grau: Atinge camadas mais profundas. Destrói tecidos e pode causar bolhas e cicatrizes."),
            itemImagem('assets/segundo_grau.png', largura: 120),
            itemTexto("3 grau: É uma queimadura muito grave que machuca profundamente a pele."),
            itemImagem('assets/terceiro_grau.png', largura: 120),
          ],
        );
      case 2:
        return telaConteudo(
          "Como prevenir",
          [
            itemImagem('assets/tarefa_concluida.png', largura: 120),
            itemTexto("• Nunca deixe panelas com cabos voltados para fora do fogão."),
            itemTexto("• Verifique se as panelas estão quentes antes de tocar."),
            const Divider(height: 30),
            itemTexto("• Deixe velas longe de tecidos e objetos inflamáveis."),
            itemTexto("• Fique longe de fósforos, álcool e produtos de limpeza."),
            itemImagem('assets/atencao.png', largura: 120),
            itemTexto("• Não mexa em fios elétricos e não toque em tomadas."),
            itemTexto("• Use protetor solar e roupas que protejam do sol."),
          ],
        );
      case 3:
        return telaConteudo(
          "O que causa",
          [
            itemImagem('assets/fogo_quente.png', largura: 110),
            itemTextoDestaque("Causas comuns de acidentes:"),
            itemTexto("• Encostar em panelas quentes ou água fervendo."),
            itemImagem('assets/panela_quente.png', largura: 110),
            itemTexto("• Exposição prolongada ao sol sem proteção."),
            itemTexto("• Vapores quentes, frio extremo ou fricção forte na pele."),
            const Divider(height: 30),
            itemTexto("• Contato com águas-vivas (caravelas), taturanas ou urtigas."),
            itemTexto("• Misturar produtos de limpeza ou agentes químicos."),
            itemImagem('assets/objeto_quente.png', largura: 110),
          ],
        );
      case 4:
        return telaConteudo(
          "O que fazer",
          [
            itemImagem('assets/primeiros_socorros.png', largura: 100),
            itemTexto("1. Coloque a parte queimada em água corrente fresca por 10 minutos."),
            itemImagem('assets/agua_fria.png', largura: 100),
            itemTexto("2. Se houver sujeira no local, cubra com um pano limpo e úmido, sem apertar."),
            const Divider(height: 30),
            itemTextoDestaque("O que NUNCA fazer:"),
            itemImagem('assets/nao_faca_isso.png', largura: 120),
            itemTexto("• Nunca retire corpos estranhos ou graxa do local queimado."),
            itemTexto("• Não coloque manteiga, pó de café, creme dental ou qualquer outra substância."),
            itemImagem('assets/curativos.png', largura: 100),
            itemTexto("• Nunca fure as bolhas e nunca puxe as peles que estão soltas."),
          ],
        );
      default:
        return menuAprender();
    }
  }

  //widgets auxiliares de estilo

  Widget itemTexto(String texto) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 16,
          height: 1.5,
          color: Color(0xFF4E342E),
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget itemTextoDestaque(String texto) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget itemImagem(String path, {double largura = 150}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Center(
        child: Image.asset(
          path,
          width: largura,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget menuAprender() {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Image.asset(
                'assets/gotinhoaprender.png',
                width: 180,
              ),
              const SizedBox(height: 10),
              const Text(
                "Escolha um assunto:",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
              ),
              const SizedBox(height: 30),
              _botaoMenuInterno("O que é e tipos", Icons.menu_book_rounded, Colors.green, 1),
              _botaoMenuInterno("Como prevenir", Icons.shield_rounded, Colors.blue, 2),
              _botaoMenuInterno("O que causa", Icons.gavel_rounded, Colors.red, 3),
              _botaoMenuInterno("O que fazer", Icons.health_and_safety_rounded, Colors.orange, 4),
            ],
          ),
        ),
    );
  }

  Widget _botaoMenuInterno(String texto, IconData icone, Color cor, int destinoIndex) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton.icon(
          onPressed: () => mudarTela(destinoIndex),
          icon: Icon(icone, color: Colors.white, size: 28),
          label: Text(
            texto,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: cor,
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ),
    );
  }

  Widget telaConteudo(String titulo, List<Widget> elementos) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              titulo,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Colors.orange,
                  letterSpacing: 1),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: Colors.orange.shade100, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: elementos,
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () => mudarTela(0),
                icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
                label: const Text(
                  "Voltar ao Menu",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}