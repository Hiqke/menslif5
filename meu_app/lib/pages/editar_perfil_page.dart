import 'package:flutter/material.dart';

class EditarPerfilPage extends StatefulWidget {
  const EditarPerfilPage({super.key});

  @override
  State<EditarPerfilPage> createState() => _EditarPerfilPageState();
}

class _EditarPerfilPageState extends State<EditarPerfilPage> {
  final _formKey = GlobalKey<FormState>();
  String nome = "João Silva";
  String email = "joaosilva@gmail.com";
  String telefone = "(79) 99999-9999";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Perfil"),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: nome,
                decoration: const InputDecoration(labelText: "Nome"),
                onSaved: (value) => nome = value ?? nome,
              ),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: email,
                decoration: const InputDecoration(labelText: "E-mail"),
                onSaved: (value) => email = value ?? email,
              ),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: telefone,
                decoration: const InputDecoration(labelText: "Telefone"),
                onSaved: (value) => telefone = value ?? telefone,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.save();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Dados atualizados com sucesso!"),
                      backgroundColor: Color(0xFF1565C0),
                    ),
                  );
                  Navigator.pop(context);
                },
                child: const Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
