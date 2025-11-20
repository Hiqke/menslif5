import 'package:flutter/material.dart';

class PsicologoPage extends StatelessWidget {
  const PsicologoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ==== Cabeçalho Dinâmico ====
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Apoio Psicológico 💬",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Cuide da sua mente, encontre equilíbrio e converse com profissionais que te entendem.",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // ==== Carrossel de Psicólogos ====
          const Text(
            "Profissionais disponíveis",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1565C0),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _psychologistCard(
                    "Dra. Ana Martins", "Terapia Cognitivo-Comportamental"),
                _psychologistCard("Dr. Paulo Silva", "Psicologia Positiva"),
                _psychologistCard("Dra. Camila Rocha", "Terapia de Casal"),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // ==== Sessões Recentes ====
          const Text(
            "Sessões Recentes",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1565C0),
            ),
          ),
          const SizedBox(height: 12),
          _sessionCard("Dra. Ana Martins", "Há 2 dias"),
          _sessionCard("Dr. Paulo Silva", "Há 1 semana"),

          const SizedBox(height: 30),

          // ==== Artigos sobre Saúde Mental ====
          const Text(
            "Artigos sobre Saúde Mental",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1565C0),
            ),
          ),
          const SizedBox(height: 12),
          _articleCard(
            "Como lidar com a ansiedade no dia a dia",
            "Entenda as causas e descubra técnicas simples de respiração e foco.",
          ),
          _articleCard(
            "Autoconhecimento e equilíbrio emocional",
            "Aprenda a observar seus sentimentos e identificar padrões de comportamento.",
          ),

          const SizedBox(height: 30),

          // ==== Dicas do Psicólogo ====
          const Text(
            "Dicas do Psicólogo",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1565C0),
            ),
          ),
          const SizedBox(height: 12),
          _tipCard(Icons.self_improvement,
              "Reserve 10 minutos por dia para respirar e se observar."),
          _tipCard(Icons.nightlight_round,
              "Desconecte-se das telas 30 minutos antes de dormir."),
          _tipCard(Icons.people_alt,
              "Se você estiver passando por um momento difícil, ligue para o Centro de Valorização da Vida (CVV) pelo número 188. Eles oferecem apoio emocional de forma gratuita e sigilosa."),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // ==== COMPONENTES ====

  static Widget _psychologistCard(String name, String specialty) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFBBDEFB),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: const Icon(Icons.psychology_alt,
                size: 50, color: Color(0xFF1565C0)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFF1565C0))),
                const SizedBox(height: 4),
                Text(specialty, textAlign: TextAlign.center),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1565C0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text("Agendar",
                      style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _sessionCard(String name, String lastSession) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF1565C0).withOpacity(0.1),
          child: const Icon(Icons.psychology, color: Color(0xFF1565C0)),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text("Última sessão: $lastSession"),
      ),
    );
  }

  static Widget _articleCard(String title, String description) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: double.infinity,
            color: const Color(0xFFBBDEFB),
            child: const Icon(Icons.image, size: 60, color: Colors.white70),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1565C0),
                    )),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
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
