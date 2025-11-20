import 'package:flutter/material.dart';
import 'editar_perfil_page.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          "Gerenciar Perfil",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1565C0),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Acesse suas informações pessoais, edite seus dados e personalize sua experiência no app.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 24),

        // === Seção: Informações do Usuário ===
        const Text(
          "Informações Pessoais",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1565C0),
          ),
        ),
        const SizedBox(height: 12),
        _infoCard(Icons.person, "Nome", "João Silva"),
        _infoCard(Icons.email, "E-mail", "joaosilva@gmail.com"),
        _infoCard(Icons.phone, "Telefone", "(79) 99999-9999"),

        const SizedBox(height: 30),

        // === Seção: Preferências ===
        const Text(
          "Preferências",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1565C0),
          ),
        ),
        const SizedBox(height: 12),
        _optionCard(context, Icons.notifications, "Notificações",
            "Gerencie alertas e lembretes do app."),
        _optionCard(context, Icons.lock, "Segurança",
            "Atualize sua senha e configure o acesso seguro."),
        _optionCard(context, Icons.language, "Idioma",
            "Selecione o idioma de exibição."),

        const SizedBox(height: 30),

        // === Seção: Ações ===
        const Text(
          "Ações da Conta",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1565C0),
          ),
        ),
        const SizedBox(height: 12),
        _actionCard(context, Icons.edit, "Editar Perfil",
            "Atualize seus dados pessoais."),
        _actionCard(context, Icons.logout, "Sair da Conta",
            "Encerrar sessão e voltar à tela inicial."),
      ],
    );
  }

  // === COMPONENTES AUXILIARES ===

  static Widget _infoCard(IconData icon, String title, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF1565C0).withOpacity(0.1),
          child: Icon(icon, color: const Color(0xFF1565C0)),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(value),
      ),
    );
  }

  static Widget _optionCard(
      BuildContext context, IconData icon, String title, String description) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF1565C0)),
        title: Text(title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios,
            size: 16, color: Colors.black45),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("$title em desenvolvimento...")),
          );
        },
      ),
    );
  }

  static Widget _actionCard(
      BuildContext context, IconData icon, String title, String description) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF1565C0)),
        title: Text(title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
        subtitle: Text(description),
        onTap: () {
          if (title == "Editar Perfil") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const EditarPerfilPage()),
            );
          } else if (title == "Sair da Conta") {
            Navigator.pushReplacementNamed(context, '/');
          }
        },
      ),
    );
  }
}
