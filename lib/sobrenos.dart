import 'package:flutter/material.dart';
import 'package:tela_de_calculo/Home.dart';

class Sobrenos extends StatelessWidget {
  const Sobrenos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre nós'),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Minha Gasoza Minha Vida',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[900],
              ),
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
