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
      backgroundColor: const Color(0xFFFDF5E6),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Vamos Aprender!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
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
      body: _construirCorpo(),
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
            itemImagem('assets/atencao.png'),
            itemTexto("Queimaduras são lesões causadas por contato direto com alguma fonte de calor."),
            const Divider(),
            itemTexto("Tipos de Queimaduras:"),
            itemTexto("• Térmicas: Fogo, vapor, objetos quentes ou pelo sol."),
            itemImagem('assets/sol_forte.png', altura: 80),
            itemTexto("• Químicas: Substâncias que queimam a pele."),
            itemTexto("• Elétricas: Descargas elétricas e fios desencapados."),
            const Divider(),
            itemTexto("Graus de Queimadura:"),
            itemTexto("1 grau: Atinge as primeiras camadas da pele. Causa inchaço e vermelhidão."),
            itemImagem('assets/primeiro_grau.png', altura: 90),
            itemTexto("2 grau: Atinge camadas mais profundas. Pode destruir tecidos e glândulas."),
            itemImagem('assets/segundo_grau.png', altura: 90),
            itemTexto("3 grau: Atinge todas as camadas da pele e pode chegar ao osso."),
            itemImagem('assets/terceiro_grau.png', altura: 90),
          ],
        );
      case 2:
        return telaConteudo(
          "Como prevenir",
          [
            itemImagem('assets/tarefa_concluida.png'),
            itemTexto("• Nunca deixe panelas com cabos voltados para fora do fogão."),
            itemTexto("• Verifique se as panelas estão quentes antes de tocar."),
            const Divider(),
            itemTexto("• Deixe velas longe de tecidos e cortinas."),
            itemTexto("• Fique longe de fósforos, álcool e produtos de limpeza."),
            itemImagem('assets/atencao.png', altura: 80),
            itemTexto("• Não mexa em fios elétricos e não toque em tomadas."),
            itemTexto("• Use sempre protetor solar e roupas que protejam do sol."),
          ],
        );
      case 3:
        return telaConteudo(
          "O que causa",
          [
            itemImagem('assets/fogo_quente.png'),
            itemTexto("Causas comuns de acidentes:"),
            itemTexto("• Encostar em panelas quentes ou água fervendo."),
            itemImagem('assets/panela_quente.png', altura: 90),
            itemTexto("• Exposição ao sol sem proteção e vapores quentes."),
            itemTexto("• Frio extremo ou fricção forte na pele."),
            const Divider(),
            itemTexto("• Contato com águas-vivas, taturanas ou urtigas."),
            itemImagem('assets/objeto_quente.png', altura: 90),
            itemTexto("• Misturar produtos de limpeza ou agentes químicos."),
          ],
        );
      case 4:
        return telaConteudo(
          "O que fazer",
          [
            itemImagem('assets/primeiros_socorros.png'),
            itemTexto("1. Coloque a área queimada em água corrente fria por 10 minutos."),
            itemImagem('assets/agua_fria.png', altura: 90),
            itemTexto("2. Se houver sujeira, cubra com um pano limpo e úmido."),
            const Divider(),
            itemTexto("O que NUNCA fazer:"),
            itemImagem('assets/nao_faca_isso.png'),
            itemTexto("• Nunca retire corpos estranhos ou graxa do local."),
            itemTexto("• Não passe manteiga, pó de café ou creme dental."),
            itemImagem('assets/curativos.png', altura: 90),
            itemTexto("• Nunca fure bolhas ou puxe as peles soltas."),
          ],
        );
      default:
        return menuAprender();
    }
  }

//Widgets auxiliares
  Widget itemTexto(String texto) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
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

  Widget menuAprender() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/Gotinho.png', height: 160),
            const SizedBox(height: 30),
            botaoMenu("O que é e tipos", 1),
            botaoMenu("Como prevenir", 2),
            botaoMenu("O que causa", 3),
            botaoMenu("O que fazer", 4),
          ],
        ),
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
        child: Text(texto, style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
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
            Text(titulo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange)),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                children: elementos,
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () => mudarTela(0),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text("Voltar ao Menu", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}