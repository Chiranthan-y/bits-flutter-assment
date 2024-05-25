import 'package:flutter/material.dart';
import 'package:quicktask/services/auth_service.dart'; 
import 'package:quicktask/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService(); // Use your AuthService

  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) => setState(() => _email = value),
                validator: (value) => value!.isEmpty ? 'Enter an email' : null,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (value) => setState(() => _password = value),
                validator: (value) => value!.isEmpty ? 'Enter a password' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result = await _authService.signIn(_email, _password);
                    if (result == null) {
                      setState(() => _error = 'Could not sign in with those credentials');
                    }
                  }
                },
                child: Text('Login'),
              ),
              SizedBox(height: 12),
              Text(
                _error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              ElevatedButton(
                child: Text('Sign up'),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
