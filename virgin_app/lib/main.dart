import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Imposta lo sfondo della pagina su bianco
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo
            Image.asset(
              'assets/logo.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 40), // Spazio tra il logo e i pulsanti

            // Pulsante Login
            ElevatedButton(
              onPressed: () {
                // Azione per il login
                print('Login pressed');
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white), // Testo bianco
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Sfondo del pulsante rosso
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
            SizedBox(height: 20), // Spazio tra i pulsanti

            // Pulsante Register
            ElevatedButton(
              onPressed: () {
                // Azione per la registrazione
                print('Register pressed');
              },
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white), // Testo bianco
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Sfondo del pulsante rosso
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}