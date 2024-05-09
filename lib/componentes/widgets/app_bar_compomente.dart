// import 'dart:io';
import 'package:desafio/views/checagem_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'indicador_processamento.dart';

class AppBarComponente {
  final _firebaseAuth = FirebaseAuth.instance;
     Future<void> goToLogin(BuildContext context) async {
      await showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            titlePadding: const EdgeInsets.symmetric(horizontal: 25),
            actionsPadding: const EdgeInsets.symmetric(horizontal: 8),
            contentPadding: const EdgeInsets.all(12),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            icon: const Icon(
              Icons.question_mark_rounded,
              size: 48,
              color: Color.fromARGB(255, 255, 0, 0),
            ),
            iconPadding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            title: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Color.fromARGB(255, 0, 0, 0)))),
              child: const Text(
                'Deseja sair?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(80, 40)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 141, 94))),
                  onPressed: () async {
                    mostrarFlushbarSucesso(context, 'Saindo...');
                    await sair(context);
                  },
                  child: const Text('SIM', style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(80, 40)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red.shade600),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('NÃO', style: TextStyle(fontSize: 16,  color: Colors.white)),
                ),
              )
            ],
          );
        },
        context: context);
      }

  AppBar buildAppBar(
    BuildContext context,
    String titulo,
    bool podeVoltar,
  ) {
    final GlobalKey<ScaffoldState> key = GlobalKey();
    final Widget menuBtn = iconBotao(key);
    final botaoSair = IconButton(
      icon: const Icon(Icons.exit_to_app),
      color: Colors.white,
      onPressed: () => goToLogin(context),
    );

    return AppBar(
      title: Text(titulo, style: TextStyle(color: Colors.white)),
      // leading: podeVoltar ? menuBtn : const SizedBox(
      //           width: 2,
      //         ),
      centerTitle: true,
          actions: <Widget>[
            FadeIn(
              duration: const Duration(seconds: 2),
              child: botaoSair,
            ),
          ],
          backgroundColor: const Color.fromARGB(255, 0, 141, 94)
        );
  }

  Widget iconBotao(GlobalKey<ScaffoldState> key) {
    final menuBtn = IconButton(
      color: Colors.white,
      icon: const Icon(Icons.keyboard_backspace_sharp),
      onPressed: () => key.currentState!.openDrawer(),
    );
    return menuBtn;
  }

    sair(BuildContext context) async {
      await _firebaseAuth.signOut().then(    
        (user) => Navigator.pushReplacement(
          context, 
          MaterialPageRoute(
            builder: (context) => const ChecagemPage(),
          ),
        ),
      );
    }

}