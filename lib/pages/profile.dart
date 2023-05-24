import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // ajouter la photo de profil de l'utilisateur ici
            ),
            const SizedBox(height: 10),
            Text(
              'Monsieur X', // ajouter le nom et le prénom de l'utilisateur ici
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 10),
            Text(
              'monsieurx@gmail.com', // ajouter l'email de l'utilisateur ici
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 10),
            Text(
              'Date d\'inscription : 12/05/2023', // ajouter la date d'inscription de l'utilisateur ici
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Ajouter ici le code pour la déconnexion de l'utilisateur
              },
              child: const Text('Déconnexion'),
            ),
          ],
        ),
      ),
    );
  }
}
