import 'package:flutter/material.dart';
import 'dart:ui' as ui;
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
              Color(0xFFFFF8ED),
              Color(0xFFFFD89A),
            ],
          ),
        ),
        child: Stack(
          children:[
            Positioned(
              top: 200,
              left: 70,
              child: Icon(
                Icons.water_drop,
                color: Color(0xFF6EC6FF),
                size: 24,
              ),
            ),
            Positioned(
              top: 260,
              right: 50,
              child: Icon(
                Icons.water_drop,
                color: Color(0xFF6EC6FF),
                size: 20,
              ),
            ),
            Positioned(
              bottom: 230,
              left: 60,
              child: Icon(
                Icons.water_drop,
                color: Color(0xFF6EC6FF),
                size: 22,
              ),
            ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text:TextSpan(
                          children: [
                            TextSpan(
                              text: "FOGO?\n",

                              style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w900,
                                shadows: [
                                  Shadow(
                                    color: Colors.black26,
                                    offset: Offset(2, 2),
                                    blurRadius: 3,
                                  ),
                                ],
                                foreground: ui.Paint()
                                  ..shader = const LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFFF5722),
                                    ],
                                  ).createShader(
                                    const Rect.fromLTWH(0, 0, 300, 70),
                                  ),
                              ),
                            ),
                            TextSpan(
                              text: "NÃO!",

                              style: TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.w900,
                                shadows: [
                                  Shadow(
                                    color: Colors.black26,
                                    offset: Offset(2, 2),
                                    blurRadius: 3,
                                  ),
                                ],
                                foreground: Paint()
                                  ..shader = const LinearGradient(
                                    colors: [
                                      Color(0xFF42A5F5),
                                      Color(0xFF1565C0),
                                    ],
                                  ).createShader(
                                    const Rect.fromLTWH(0, 0, 300, 70),
                                  ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),

                      // IMAGEM DO GOTINHO
                      Image.asset(
                        'assets/Gotinho.png',
                        width: 280,
                      ),

                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF6EDB4D),
                                Color(0xFF3FAE2A),
                              ],
                            ),

                            borderRadius: BorderRadius.circular(40),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.withOpacity(0.4),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),

                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const MenuPrincipal(),
                                ),
                              );
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              elevation: 0,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
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
                                  ),
                                ),

                                SizedBox(width: 10),

                                Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ],
                            ),
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
                width: 180,
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
                const MenuInfo(),
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