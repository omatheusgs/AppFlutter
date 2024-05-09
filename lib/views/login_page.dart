import 'package:desafio/core/modelos/credencial.dart';
import 'package:desafio/core/modelos/local_exception.dart';
import 'package:desafio/views/bemvindo_page.dart';
import 'package:desafio/views/home_page.dart';
import 'package:desafio/servicos/login/login_servico.dart';
import 'package:desafio/servicos/usuario/usuario_servico.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override 
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginServico loginServico = const LoginServico();
  final _formKey = GlobalKey<FormState>();
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();
  bool verSenha = false;
  bool animacaoCarregamento = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 1],
            colors: [
              Color.fromARGB(255, 139, 255, 230),
              Colors.white,
            ],
          )),
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                    width: 220,
                    height: 220,
                    child: Image.asset('assets/logo.png'),
                ),
              TextFormField(                
                autofocus: true,
                controller: _usuarioController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text('Usuário'),
                  labelStyle: TextStyle(color: Color.fromARGB(255, 0, 141, 94))
                  ),
                  validator: (usuario) {
                    if (usuario == null || usuario.isEmpty) {
                      return 'Digite seu usuário';
                    }
                    return null;
                  },
                ),
              TextFormField( 
                autofocus: true,
                controller: _senhaController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: !verSenha,
                decoration: InputDecoration(
                  label: const Text('Senha'),
                  labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 141, 94)),
                  suffixIcon: IconButton(
                    icon: Icon(verSenha ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                    onPressed: () {
                      setState(() {
                        verSenha = !verSenha;
                      });
                    },
                  )
                ),
                validator: (senha) {
                  if (senha == null || senha.isEmpty) {
                    return 'Digite sua senha';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ButtonStyle(
                 textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 15)) ,
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {                  
                    logar();
                  }
                }, 
                child: const Text('Entrar'))
        ],))],),
        ))
        ;
  }

  void logar() async {
    try {  
      final usuario = await const LoginServico().autenticar(Credencial(_usuarioController.text, _senhaController.text));
      if (usuario.token.isNotEmpty) {
        const UsuarioServico().setUsuarioLocal(usuario);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
      }   
    } catch (error) {
      await LocalException.trataExViewContext(error, context);
    }
  }
}