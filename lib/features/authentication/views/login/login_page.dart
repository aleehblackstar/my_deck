import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faça Login'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 160,
              child: ElevatedButton(
                onPressed: () {}, 
                child: Text('Entrar'),
              ),
            ),
            Text.rich(
              TextSpan(
                text: "Não tem conta ainda? Toque ",
                children: [
                  TextSpan(
                    text: " aqui ",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "para se criar.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}