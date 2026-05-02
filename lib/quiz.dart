import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int perguntaAtual = 0;
  int? respostaSelecionada;
  bool respondeu = false;
  int acertos = 0;
  bool finalizou = false;

  final List<Map<String, dynamic>> perguntas = [
    {"pergunta": "O que pode causar uma queimadura?", "opcoes": ["Brincar com bola", "Encostar em panela quente", "Ler um livro", "Dormir"], "correta": 1},
    {"pergunta": "O que devemos usar para proteger a pele do sol?", "opcoes": ["Sabonete", "Protetor solar", "Água", "Toalha"], "correta": 1},
    {"pergunta": "Onde não devemos mexer na cozinha?", "opcoes": ["Na geladeira", "No fogão quente", "Na mesa", "Na cadeira"], "correta": 1},
    {"pergunta": "O que pode causar queimadura elétrica?", "opcoes": ["Brincar na areia", "Mexer em tomada sem proteção", "Comer frutas", "Assistir TV"], "correta": 1},
    {"pergunta": "O que fazer se você se queimar?", "opcoes": ["Colocar gelo direto", "Colocar a área em água fria", "Passar manteiga", "Ignorar"], "correta": 1},
    {"pergunta": "O que NÃO devemos passar na queimadura?", "opcoes": ["Água limpa", "Pomada indicada", "Pasta de dente", "Gaze"], "correta": 2},
    {"pergunta": "Brincar com fósforo é:", "opcoes": ["Seguro", "Perigoso", "Divertido sempre", "Sem problema"], "correta": 1},
    {"pergunta": "Quem devemos chamar se a queimadura for grave?", "opcoes": ["Um amigo", "Um adulto responsável", "Um colega", "Ninguém"], "correta": 1},
    {"pergunta": "Velas acesas devem ficar:", "opcoes": ["Perto de cortinas", "Longe de objetos que pegam fogo", "No chão", "Na cama"], "correta": 1},
    {"pergunta": "Por que não devemos tocar em ferro de passar ligado?", "opcoes": ["Porque é pesado", "Porque pode queimar a pele", "Porque faz barulho", "Porque é feio"], "correta": 1},
    {"pergunta": "O que fazer antes de tomar banho quente?", "opcoes": ["Entrar direto", "Testar a temperatura da água", "Correr", "Gritar"], "correta": 1},
    {"pergunta": "Crianças devem cozinhar sozinhas?", "opcoes": ["Sim, sempre", "Não, só com um adulto por perto", "Sim, sem cuidado", "Apenas à noite"], "correta": 1},
    {"pergunta": "O fogo é:", "opcoes": ["Um brinquedo", "Algo perigoso que precisa de cuidado", "Sempre seguro", "Só bonito"], "correta": 1},
    {"pergunta": "Colocar gelo diretamente na queimadura é:", "opcoes": ["Correto", "Errado, pode piorar", "Sempre bom", "Não faz diferença"], "correta": 1},
    {"pergunta": "O que fazer se a roupa pegar fogo?", "opcoes": ["Correr", "Parar, deitar e rolar no chão", "Pular", "Esconder"], "correta": 1},
  ];

  void validarResposta(int index) {
    if (respondeu) return;
    setState(() {
      respostaSelecionada = index;
      respondeu = true;
      if (index == perguntas[perguntaAtual]['correta']) {
        acertos++;
      }
    });
  }

  void proximaPergunta() {
    setState(() {
      if (perguntaAtual < perguntas.length - 1) {
        perguntaAtual++;
        respostaSelecionada = null;
        respondeu = false;
      } else {
        finalizou = true;
      }
    });
  }

  void reiniciarQuiz() {
    setState(() {
      perguntaAtual = 0;
      acertos = 0;
      respostaSelecionada = null;
      respondeu = false;
      finalizou = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5E6),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text('Quiz de prevenção', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: finalizou ? telaParabens() : telaPergunta(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget telaPergunta() {
    var questao = perguntas[perguntaAtual];
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        // Removido o Spacer() e ajustado o alinhamento
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Pergunta ${perguntaAtual + 1} de ${perguntas.length}",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Image.asset('assets/gotinho2.png', height: 80),//Imagem do gotinho
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: (perguntaAtual + 1) / perguntas.length,
            backgroundColor: Colors.grey[300],
            color: Colors.orange,
            minHeight: 10,
          ),
          const SizedBox(height: 30),
          Text(questao['pergunta'], textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF4E342E))),
          const SizedBox(height: 30),
          // Lista de opções
          ...List.generate(4, (index) {
            Color cardColor = Colors.white;
            if (respondeu) {
              if (index == questao['correta']) cardColor = Colors.green[100]!;
              else if (index == respostaSelecionada) cardColor = Colors.red[100]!;
            }
            return GestureDetector(
              onTap: () => validarResposta(index),
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: respondeu && index == questao['correta'] ? Colors.green : Colors.grey[300]!,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.orange[100],
                      child: Text(String.fromCharCode(65 + index), style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(width: 15),
                    Expanded(child: Text(questao['opcoes'][index], style: const TextStyle(fontSize: 16))),
                  ],
                ),
              ),
            );
          }),
          const Spacer(),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: respondeu ? proximaPergunta : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                elevation: 5,
              ),
              child: Text(perguntaAtual == perguntas.length - 1 ? "Finalizar" : "Próxima",
                  style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }

  Widget telaParabens() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, // Faz o botão ficar na largura da twla
          children: [
            const SizedBox(height: 20),
            const Text("PARABÉNS!", textAlign: TextAlign.center, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.orange)),
            Image.asset('assets/gotinhofeliz.png', height: 150,),//gotinho feliz
            const SizedBox(height: 10),
            Text("Você completou o desafio de prevenção!", textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey[700])),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Text("Você acertou $acertos de ${perguntas.length} perguntas",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const Spacer(), // Empurra o botão para o fundo da tela de parabéns
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: reiniciarQuiz,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                child: const Text("Tentar Novamente", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}