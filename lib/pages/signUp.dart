

import 'package:booking_gym/DB/auth_service.dart';
import 'package:booking_gym/DB/db_service.dart';
import 'package:booking_gym/models/user.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Nous sommes ravis de vous retrouver',
              style: TextStyle(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nom',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre nom';
                }
                return null;
              },
              onSaved: (value) {
                _nameController.text = value!;
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre email';
                }
                return null;
              },
              onSaved: (value) {
                _emailController.text = value!;
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Mot de passes',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '******';
                }
                return null;
              },
              onSaved: (value) {
                _passwordController.text = value!;
              },
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  await AuthServices().signUp(_emailController.text,_passwordController.text,_nameController.text);
                }
              },
              child: const Text('Réserver'),
            ),
          ],
        ),
      ),
    );
  }
}