import 'package:flutter/material.dart';
import 'auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  String _message = '';

  void _login() async {
    var user = await _authService.login(
      _emailController.text,
      _passwordController.text,
    );
    setState(() {
      _message = user != null
          ? 'Connecté : ${user.email}'
          : 'Erreur de connexion';
    });
  }

  void _signup() async {
    var user = await _authService.signUp(
      _emailController.text,
      _passwordController.text,
    );
    setState(() {
      _message = user != null
          ? 'Inscrit : ${user.email}'
          : 'Erreur d\'inscription';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Connexion Mintycard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: Text('Se connecter')),
            ElevatedButton(onPressed: _signup, child: Text('S’inscrire')),
            SizedBox(height: 20),
            Text(_message, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
