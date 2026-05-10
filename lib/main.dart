import 'package:flutter/material.dart';
import 'aprender.dart';
import 'quiz.dart';
import 'primeiros_socorros.dart';
import 'creditos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(), // Isso chama a tela inicial
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFF3E0),
              Color(0xFFFFE0B2),
            ],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
                width: 340,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(35),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10), // Sombra para baixo
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "FOGO?\n",
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFFFF9800),
                              letterSpacing: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: "NÃO!",
                            style: TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF1E88E5),
                              letterSpacing: 1.5,

                              shadows: [
                                Shadow(color: Colors.black26, offset: Offset(2, 2), blurRadius: 2),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),

                    // IMAGEM DO GOTINHO
                    Image.asset(
                      'assets/Gotinho.png',
                      height: 320,
                    ),

                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MenuPrincipal()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4CAF50),
                          elevation: 8,
                          shadowColor: Colors.green.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Vamos Começar!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 28),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        title: const Text('Menu Principal', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
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
            children: [
              //gotinho
              Image.asset(
                'assets/gotinho3.png',
                height: 180,
              ),
              const SizedBox(height: 10),
              const Text(
                "O que vamos fazer?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
              ),
              const SizedBox(height: 30),
              _botaoMenu(
                context,
                "Vamos aprender!",
                Icons.menu_book_rounded,
                Colors.green,
                const Aprender(),
              ),
              _botaoMenu(
                context,
                "Teste seus Conhecimentos",
                Icons.quiz_rounded,
                Colors.blue,
                const Quiz(),
              ),
              _botaoMenu(
                context,
                "Primeiros Socorros",
                Icons.medical_services_rounded,
                Colors.redAccent,
                const PrimeirosSocorros(),
              ),
              _botaoMenu(
                context,
                "Créditos e referências",
                Icons.star_rounded,
                Colors.orange,
                const Creditos(),
              ),
            ],
          ),
        ),
      ),
    );
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
}