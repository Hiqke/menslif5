import 'package:flutter/material.dart';
import 'add_article_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        title: const Text("Área do Profissional"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            "Bem-vindo, profissional da saúde 👩‍⚕️",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1565C0),
            ),
          ),
          const SizedBox(height: 20),
          _dashboardCard(
            context,
            title: "Adicionar novo artigo",
            icon: Icons.article_outlined,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddArticlePage()),
            ),
          ),
          _dashboardCard(
            context,
            title: "Atualizar dicas de bem-estar",
            icon: Icons.tips_and_updates_outlined,
            onTap: () {},
          ),
          _dashboardCard(
            context,
            title: "Gerenciar profissionais",
            icon: Icons.group_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _dashboardCard(BuildContext context,
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF1565C0)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.arrow_forward_ios_rounded,
            size: 18, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
