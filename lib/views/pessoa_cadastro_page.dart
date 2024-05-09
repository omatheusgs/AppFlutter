import 'package:desafio/componentes/widgets/app_bar_compomente.dart';
import 'package:desafio/core/modelos/pessoa.dart';
import 'package:desafio/core/modelos/pessoa_provider.dart';
import 'package:desafio/views/home_page.dart';
import 'package:desafio/views/formulario_cadastro.dart';
import 'package:flutter/material.dart';

class PessoaCadastroPage extends StatefulWidget {
  const PessoaCadastroPage({super.key});

  @override
  State<PessoaCadastroPage> createState() => _PessoaCadastroPageState();
}

class _PessoaCadastroPageState extends State<PessoaCadastroPage> {
  String titulo = 'CADASTRO';
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerCpf = TextEditingController();
  TextEditingController controllerUf = TextEditingController();
  TextEditingController controllerDataDeNascimento = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PessoaProvider pessoaProvider = PessoaProvider.of(context) as PessoaProvider;

    int? index;
    if (pessoaProvider.indexPessoa != null) {
      index = pessoaProvider.indexPessoa;
      controllerNome.text = pessoaProvider.pessoaSelecionada!.nome;
      controllerCpf.text = pessoaProvider.pessoaSelecionada!.cpf;
      controllerUf.text = pessoaProvider.pessoaSelecionada!.uf;
      controllerDataDeNascimento.text = pessoaProvider.pessoaSelecionada!.dataDeNascimento;

      setState(() {
        this.titulo = 'EDITAR';
      });
    }

    GlobalKey<FormState> _key = GlobalKey();

    void salvar() {
      PessoaProvider pessoaProvider = PessoaProvider.of(context) as PessoaProvider;

      final validado = _key.currentState?.validate();

      if (validado == false) {
        return;
      }

      _key.currentState?.save();
      
      Pessoa pessoa = Pessoa(
        codigo: 0, 
        nome: controllerNome.text, 
        cpf: controllerCpf.text,
        uf: controllerUf.text,
        dataDeNascimento: controllerDataDeNascimento.text
      );
      
      if (index != null) {
        pessoaProvider.pessoas[index] = pessoa;
      } 
      else {
        int pessoaLength = pessoaProvider.pessoas.length;
        pessoaProvider.pessoas.insert(pessoaLength, pessoa);
      }

      Navigator.push(
        context, 
         MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBarComponente().buildAppBar(context, this.titulo, true),
      body: ListView(
      children: [ 
      Center(
      child: Column(
        children: [
          FormularioCadastro(
            label: 'Nome', 
            controller: controllerNome,
            ehNome: true,
            ehCPF: false,
            ehUF: false,
            ehDataDeNascimento: false),
          FormularioCadastro(
            label: 'CPF', 
            controller: controllerCpf,
            ehNome: false,
            ehCPF: true,
            ehUF: false,
            ehDataDeNascimento: false),
          FormularioCadastro(
            label: 'UF', 
            controller: controllerUf,
            ehNome: false,
            ehCPF: false,
            ehUF: true,
            ehDataDeNascimento: false),
          FormularioCadastro(
            label: 'Data de Nascimento', 
            controller: controllerDataDeNascimento,
            ehNome: false,
            ehCPF: false,
            ehUF: false,
            ehDataDeNascimento: true),
          SizedBox(
            child: TextButton(
                onPressed: salvar, 
                child: Text('Salvar'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
          )
        ]
      ),
    )]));
  }
}