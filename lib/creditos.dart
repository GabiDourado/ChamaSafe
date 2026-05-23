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

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.platformDefault,
      );
    } else {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child:  Column(
            children: [
              const Text(
                "Fontes do conteúdo do app:",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
              ),
              const SizedBox(height: 10),
              _buildRefCard(
                titulo: "Biblioteca Virtual em Saúde - Ministério da Saúde",
                subtitulo: "Acesse o portal oficial de saúde",
                onTap: () => abrirLink('https://bvsms.saude.gov.br/queimaduras/'),
              ),
              const SizedBox(height: 12),

              _buildRefCard(
                titulo: "Eurofarma - Primeiros socorros",
                subtitulo: "Acesse e entenda como proceder em caso de queimaduras",
                onTap: () => abrirLink('https://eurofarma.com.br/artigos/primeiros-socorros-entenda-como-proceder-em-caso-de-queimaduras'),
              ),
              const SizedBox(height: 12),

              _buildRefCard(
                titulo: "Hospital São Camilo",
                subtitulo: "Acesse as recomendações e prevenções",
                onTap: () => abrirLink('https://hospitalsaocamilosp.org.br/queimaduras-recomendacoes-e-como-prevenir/'),
              ),
              const SizedBox(height: 12),

              _buildRefCard(
                titulo: "Instituto Santa Catarina - Primeiros Socorros",
                subtitulo: "O que fazer em emergências",
                onTap: () => abrirLink('https://www.institutosc.com.br/web/blog/primeiros-socorros-queimadura'),
              ),
              const SizedBox(height: 50),
              const Text(
                "IAs utilizadas para geração de imagens e adaptação textual:",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              _buildRefCard(
                titulo: "ChatGPT",
                subtitulo: "Geração de imagens e adaptação textual",
                onTap: () => abrirLink('https://chatgpt.com/'),
              ),
              const SizedBox(height: 12),
              _buildRefCard(
                titulo: "Gemini",
                subtitulo: "Geração de imagens e adaptação textual",
                onTap: () => abrirLink('https://gemini.google.com'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildRefCard({
    required String titulo,
    required String subtitulo,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titulo,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4E342E),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitulo,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF8D6E63),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              const Icon(
                Icons.open_in_new,
                size: 18,
                color: Colors.brown,
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