import 'package:flutter/material.dart';

class FormularioCadastro extends StatelessWidget {
  String label;
  TextEditingController controller;
  bool ehNome;
  bool ehCPF;
  bool ehUF;
  bool ehDataDeNascimento;
  
  FormularioCadastro({
    required this.label,
    required this.controller,
    required this.ehNome,
    required this.ehCPF,
    required this.ehUF,
    required this.ehDataDeNascimento,
    super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
      ),
      validator: (value) {
        if (this.ehNome) {
          if (value?.isEmpty == true) {
            return 'Nome é obrigatório.';
          }
          else if (value!.length > 100) {
            return 'Máximo 100 caracteres.';
          }
        }
        if (this.ehCPF) {
          if (value?.isEmpty == true) {
            return 'CPF é obrigatório.';
          }
          else if (value!.length > 11) {
            return 'Máximo 11 caracteres sem pontuação.';
          }
        }
        if (this.ehUF) {
          if (value?.isEmpty == true) {
            return 'UF é obrigatória.';
          }
          else if (value!.length > 2) {
            return 'Máximo 2 caracteres.';
          }
        }
        if (this.ehUF) {
          if (value?.isEmpty == true) {
            return 'Data de nascimento é obrigatória.';
          }
          else if (value!.length > 10) {
            return 'Máximo 10 caracteres.';
          }
        }
      },
    );
  }
}