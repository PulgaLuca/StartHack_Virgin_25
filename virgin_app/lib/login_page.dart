import 'package:flutter/material.dart';
import 'login_form_page.dart';  // Import the LoginFormPage

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background to white
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
            SizedBox(height: 40), // Space between logo and buttons

            // Login Button
            ElevatedButton(
              onPressed: () {
                // Navigate to LoginFormPage when "Login" is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginFormPage()),
                );
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white), // White text
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Red background for button
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
            SizedBox(height: 20), // Space between buttons

            // Register Button
            ElevatedButton(
              onPressed: () {
                // Action for register (you can add functionality)
                print('Register pressed');
              },
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white), // White text
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Red background for button
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
