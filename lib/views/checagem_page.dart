import 'package:desafio/views/home_page.dart';
import 'package:desafio/views/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChecagemPage extends StatefulWidget {
  const ChecagemPage({Key? key}) : super(key: key);

  @override 
  State<ChecagemPage> createState() => _ChecagemPageState();
}

class _ChecagemPageState extends State<ChecagemPage> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
        if (user == null) {
                     Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            LoginPage(),
                      ),
                      (Route route) => false,
                    );
        } else {         
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));         
        }
  });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}