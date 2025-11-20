import 'package:flutter/material.dart';

class SaudePage extends StatefulWidget {
  const SaudePage({super.key});

  @override
  State<SaudePage> createState() => _SaudePageState();
}

class _SaudePageState extends State<SaudePage> {
  // Estado dos desafios
  final Map<String, bool> _desafios = {
    "Bebi 2L de água hoje": false,
    "Fiz uma caminhada leve": false,
    "Meditei por 5 minutos": false,
    "Evitei telas antes de dormir": false,
  };

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // === CABEÇALHO MOTIVACIONAL ===
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
                "Saúde e Bem-Estar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "Pequenos hábitos geram grandes mudanças 🌿",
                style: TextStyle(color: Colors.white70, fontSize: 15),
              ),
            ],
          ),
        ),

        const SizedBox(height: 28),

        // === DESAFIOS DIÁRIOS ===
        const Text(
          "Desafios de Hoje",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1565C0),
          ),
        ),
        const SizedBox(height: 10),

        ..._desafios.entries.map((e) => _desafioCard(e.key, e.value)).toList(),

        const SizedBox(height: 28),

        // === SEÇÃO DE PROGRESSO (INTERATIVA) ===
        const Text(
          "Seu Progresso",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1565C0),
          ),
        ),
        const SizedBox(height: 14),
        _progressContainer(),

        const SizedBox(height: 30),

        // === ARTIGOS RECENTES ===
        const Text(
          "Artigos Recentes",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1565C0),
          ),
        ),
        const SizedBox(height: 12),
        _articleCard(
          "Alimentos que fortalecem o sistema imunológico",
          "Descubra quais nutrientes ajudam seu corpo a se proteger melhor.",
        ),
        _articleCard(
          "A importância de pausas ativas no trabalho",
          "Movimente-se durante o expediente e reduza o estresse físico.",
        ),
        _articleCard(
          "Sono reparador: como melhorar sua rotina noturna",
          "Pequenas mudanças que fazem diferença na qualidade do sono.",
        ),

        const SizedBox(height: 30),

        // === DICAS DO DIA ===
        const Text(
          "Dicas do Dia",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1565C0),
          ),
        ),
        const SizedBox(height: 12),
        _tipCard(Icons.spa, "Respire fundo e alongue-se ao acordar."),
        _tipCard(Icons.water_drop, "Leve uma garrafinha de água com você."),
        _tipCard(
            Icons.bedtime, "Desconecte-se das telas 30 min antes de dormir."),
      ],
    );
  }

  // === COMPONENTES INTERATIVOS ===

  Widget _desafioCard(String texto, bool concluido) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _desafios[texto] = !concluido;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: concluido ? Colors.green[50] : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: concluido ? Colors.green : const Color(0xFF1565C0),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              concluido ? Icons.check_circle : Icons.circle_outlined,
              color: concluido ? Colors.green : const Color(0xFF1565C0),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                texto,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: concluido ? Colors.green[700] : Colors.black87,
                  decoration: concluido
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _progressContainer() {
    final progresso =
        _desafios.values.where((v) => v).length / _desafios.length;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text(
            "Progresso de hábitos saudáveis",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: progresso,
            backgroundColor: Colors.white,
            color: const Color(0xFF1565C0),
            minHeight: 8,
            borderRadius: BorderRadius.circular(10),
          ),
          const SizedBox(height: 10),
          Text("${(progresso * 100).toStringAsFixed(0)}% concluído",
              style: const TextStyle(color: Colors.black54)),
        ],
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
