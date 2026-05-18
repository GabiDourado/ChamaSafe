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
    {"pergunta": "O que devemos usar para proteger a pele do sol?", "opcoes": ["Sabonete", "Água", "Protetor solar", "Toalha"], "correta": 2},
    {"pergunta": "Onde não devemos mexer na cozinha?", "opcoes": ["Na geladeira", "No fogão quente", "Na mesa", "Na cadeira"], "correta": 1},
    {"pergunta": "O que pode causar queimadura elétrica?", "opcoes": ["Mexer em tomada sem proteção","Brincar na areia",  "Comer frutas", "Assistir TV"], "correta": 0},
    {"pergunta": "O que fazer se você se queimar?", "opcoes": ["Colocar gelo direto", "Passar manteiga", "Ignorar", "Colocar a área em água fria"], "correta": 3},
    {"pergunta": "O que NÃO devemos passar na queimadura?", "opcoes": ["Água limpa", "Pomada indicada", "Pasta de dente", "Gaze"], "correta": 2},
    {"pergunta": "Brincar com fósforo é:", "opcoes": ["Perigoso","Seguro",  "Divertido sempre", "Sem problema"], "correta": 0},
    {"pergunta": "Quem devemos chamar se a queimadura for grave?", "opcoes": ["Um amigo", "Um adulto responsável", "Um colega", "Ninguém"], "correta": 1},
    {"pergunta": "Velas acesas devem ficar:", "opcoes": ["Perto de cortinas", "No chão", "Na cama", "Longe de objetos que pegam fogo"], "correta": 3},
    {"pergunta": "Por que não devemos tocar em ferro de passar ligado?", "opcoes": ["Porque é pesado", "Porque faz barulho", "Porque pode queimar a pele", "Porque é feio"], "correta": 2},
    {"pergunta": "O que fazer antes de tomar banho quente?", "opcoes": ["Testar a temperatura da água","Entrar direto",  "Correr", "Gritar"], "correta": 0},
    {"pergunta": "Crianças devem cozinhar sozinhas?", "opcoes": ["Sim, sempre", "Não, só com um adulto por perto", "Sim, sem cuidado", "Apenas à noite"], "correta": 1},
    {"pergunta": "O fogo é:", "opcoes": ["Um brinquedo", "Sempre seguro", "Só bonito", "Algo perigoso que precisa de cuidado"], "correta": 3},
    {"pergunta": "Colocar gelo diretamente na queimadura é:", "opcoes": ["Correto", "Sempre bom", "Errado, pode piorar", "Não faz diferença"], "correta": 2},
    {"pergunta": "O que fazer se a roupa pegar fogo?", "opcoes": ["Correr", "Pular", "Esconder", "Parar, deitar e rolar no chão"], "correta": 3},
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
              Image.asset('assets/gotinho2.png', width: 130,),//Imagem do gotinho
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
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        // Mudamos o alinhamento principal para distribuir o espaço uniformemente
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "PARABÉNS!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.orange),
          ),

          // Agora o Flutter vai aceitar o tamanho que você definir aqui!
          Image.asset(
            'assets/gotinhofeliz.png',
            height: 220, // Ajuste esse valor para o tamanho ideal que você quer na tela
            fit: BoxFit.contain,
          ),

          Text(
            "Você completou o desafio de prevenção!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.grey[700]),
          ),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
            ),
            child: Text(
              "Você acertou $acertos de ${perguntas.length} perguntas",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          // Removemos o Spacer() antigo que estava esmagando o layout para cima
          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: reiniciarQuiz,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                elevation: 3,
              ),
              child: const Text("Tentar Novamente", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}