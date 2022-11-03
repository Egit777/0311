import 'package:flutter/material.dart';
import 'Database/BancoDados.dart';
import 'package:tela_de_calculo/Home.dart';
import 'telaCalculo.dart';
import 'sobrenos.dart';
import 'graficoo.dart';
import 'historico.dart';

const Color darkBlue = Color.fromARGB(255, 255, 255, 255);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BancoDados.criarBanco();

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Home(),
        ),
      ),
    );
  }
}
