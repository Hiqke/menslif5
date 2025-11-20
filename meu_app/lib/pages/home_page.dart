import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _astroController;
  late Animation<double> _astroAnimation;

  @override
  void initState() {
    super.initState();
    _astroController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);

    _astroAnimation = Tween<double>(begin: -5, end: 5)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(_astroController);
  }

  @override
  void dispose() {
    _astroController.dispose();
    super.dispose();
  }

  // === Definir período do dia ===
  String _getPeriodo() {
    final hora = DateTime.now().hour;
    if (hora >= 5 && hora < 12) return "manha";
    if (hora >= 12 && hora < 19) return "tarde";
    return "noite";
  }

  // === Saudação ===
  String _saudacao() {
    final hora = DateTime.now().hour;
    if (hora >= 5 && hora < 12) return "Bom dia";
    if (hora >= 12 && hora < 19) return "Boa tarde";
    return "Boa noite";
  }

  // === Cores e ícones ===
  (IconData, List<Color>) _aparenciaPorPeriodo() {
    final periodo = _getPeriodo();

    switch (periodo) {
      case "manha":
        return (
          Icons.wb_sunny,
          [const Color(0xFFFFE082), const Color(0xFF64B5F6)]
        ); // Amarelo + azul
      case "tarde":
        return (
          Icons.wb_sunny_outlined,
          [const Color(0xFFFFD54F), const Color(0xFF42A5F5)]
        ); // Sol forte
      default:
        return (
          Icons.nights_stay,
          [const Color(0xFF1A237E), const Color(0xFF4A148C)]
        ); // Noite roxo escuro
    }
  }

  @override
  Widget build(BuildContext context) {
    final saudacao = _saudacao();
    final (astroIcon, cores) = _aparenciaPorPeriodo();

    return CustomScrollView(
      slivers: [
        // === HEADER DINÂMICO ===
        SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: cores,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(26)),
            ),
            child: Stack(
              children: [
                AnimatedBuilder(
                  animation: _astroAnimation,
                  builder: (context, _) {
                    return Positioned(
                      top: 10 + _astroAnimation.value,
                      right: 10 + sin(_astroAnimation.value * pi / 10) * 5,
                      child: Icon(
                        astroIcon,
                        size: 60,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    );
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$saudacao 👋",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Bem-vindo ao Mens Lifes!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Cuidar de si mesmo é o primeiro passo para viver melhor.",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // === CONTEÚDO PRINCIPAL ===
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _quickAction(Icons.favorite, "Saúde", Colors.blueAccent),
                    _quickAction(Icons.psychology, "Psicólogo", Colors.teal),
                    _quickAction(
                        Icons.fitness_center, "Treinos", Colors.orange),
                  ],
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Artigos de Saúde",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1565C0),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _articleCard(
                  "Alimentação saudável no dia a dia",
                  "Dicas práticas para manter uma dieta equilibrada sem abrir mão do sabor.",
                ),
                _articleCard(
                  "Sono e saúde mental",
                  "Como dormir melhor pode impactar positivamente seu bem-estar emocional.",
                ),
                _articleCard(
                  "A importância de conversar",
                  "Buscar apoio psicológico é um ato de coragem, não de fraqueza.",
                ),
                const SizedBox(height: 24),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Dicas rápidas de bem-estar",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1565C0),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _tipCard(Icons.accessibility_new,
                    "Alongue-se por 5 minutos a cada hora."),
                _tipCard(
                    Icons.water_drop, "Beba água regularmente durante o dia."),
                _tipCard(Icons.self_improvement,
                    "Reserve um tempo para meditar ou respirar fundo."),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // === WIDGETS AUXILIARES ===
  static Widget _quickAction(IconData icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, size: 30, color: color),
        ),
        const SizedBox(height: 6),
        Text(label,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
      ],
    );
  }

  static Widget _articleCard(String title, String subtitle) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1565C0))),
            const SizedBox(height: 6),
            Text(subtitle,
                style: const TextStyle(color: Colors.black87, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  static Widget _tipCard(IconData icon, String text) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF1565C0)),
        title: Text(text,
            style: const TextStyle(fontSize: 15, color: Colors.black87)),
      ),
    );
  }
}
