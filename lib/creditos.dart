import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuInfo extends StatelessWidget {
  const MenuInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
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
        title: const Text("Créditos e referências", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //gotinho
              Image.asset(
                'assets/gotinhoamor.png',
                width: 180,
              ),
              const SizedBox(height: 10),
              const Text(
                "Informações do aplicativo:",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
              ),
              const SizedBox(height: 30),
              _botaoMenu(
                context,
                "Créditos",
                Icons.info,
                Colors.green,
                const Creditos(),
              ),

              const SizedBox(height: 20),
              _botaoMenu(
                context,
                "Referências",
                Icons.library_books,
                Colors.blue,
                const Refs(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class Creditos extends StatelessWidget {
  const Creditos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(title: const Text('Créditos', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 0,
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
          ),
        ),
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: [
                const Text(
                  "Disciplina:",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Desenvolvimento de software",
                  style: TextStyle(fontSize: 20, color: Colors.brown),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Professor:",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Prof. Dr. Elvio Gilberto da Silva",
                  style: TextStyle(fontSize: 20, color: Colors.brown),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Equipe:",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Eduardo Merlin Simão",
                  style: TextStyle(fontSize: 20, color: Colors.brown),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Gabriela Dos Santos Dourado",
                  style: TextStyle(fontSize: 20, color: Colors.brown),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Leridia Casanova Abrantes",
                  style: TextStyle(fontSize: 20, color: Colors.brown),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Curso:",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
                ),
                const SizedBox(height: 10),
                Image.asset('assets/Ciencia_da_Computacao.jpg', height: 130),
                const SizedBox(height: 15),
                const Text(
                  "Apoio:",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
                ),
                const SizedBox(height: 10),
                Image.asset('assets/extensao.jpg', height: 130),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
    );
  }
}
class Refs extends StatelessWidget {
  const Refs({super.key});

  Future<void> abrirLink(String link) async {
    final Uri url = Uri.parse(link);

    if (!await launchUrl(url)) {
      throw Exception('Não foi possível abrir o link');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
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
      appBar: AppBar(title: const Text('Referências', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child:  Column(
            children: [
              const Text(
                "Fontes do conteúdo do app:",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  abrirLink('https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiTtOu-paeUAxU7kZUCHY6rEoIQFnoECCEQAQ&url=https%3A%2F%2Fbvsms.saude.gov.br%2Fqueimaduras%2F&usg=AOvVaw3SkxxpxrO4jnckyBNKAwLT&opi=89978449');
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(child:
                      Text("Biblioteca Virtual em Saúde - Ministério da Saúde",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
                        textAlign: TextAlign.center,
                    ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.open_in_new, size: 20, color: Colors.brown,),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  abrirLink('https://eurofarma.com.br/artigos/primeiros-socorros-entenda-como-proceder-em-caso-de-queimaduras');
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(child:
                    Text("Eurofarma - Primeiros socorros: entenda como proceder em caso de queimaduras",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
                      textAlign: TextAlign.center,
                    ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.open_in_new, size: 20, color: Colors.brown,),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  abrirLink('https://hospitalsaocamilosp.org.br/queimaduras-recomendacoes-e-como-prevenir/');
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(child:
                      Text("Hospital São Camilo",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.open_in_new, size: 20, color: Colors.brown,),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  abrirLink('https://www.institutosc.com.br/web/blog/primeiros-socorros-queimadura');
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(child:
                    Text("Instituto Santa Catarina - Primeiros socorros para queimadura: o que fazer em emergências",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
                      textAlign: TextAlign.center,
                    ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.open_in_new, size: 20, color: Colors.brown,),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                "IAs utilizadas para geração de imagens e adaptação textual:",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  abrirLink('https://chatgpt.com/');
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(child:
                      Text("ChatGPT",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.open_in_new, size: 20, color: Colors.brown,),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  abrirLink('https://gemini.google.com');
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(child:
                      Text("Gemini",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.open_in_new, size: 20, color: Colors.brown,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Widget _botaoMenu(BuildContext context, String texto, IconData icone, Color cor, Widget destino) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => destino));
        },
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