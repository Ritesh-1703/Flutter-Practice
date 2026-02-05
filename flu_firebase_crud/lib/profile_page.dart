import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'user_service.dart';
import 'auth_service.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;
  final userService = UserService();
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => authService.logout(),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: userService.getUserProfile(user.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text("Creating profile..."));
          }

          final data = snapshot.data!.data()!;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name: ${data['name'] ?? ''}"),
                Text("Email: ${data['email'] ?? ''}"),
                Text("Phone: ${data['phone'] ?? ''}"),
                Text("DOB: ${data['dob'] ?? ''}"),
                Text("Gender: ${data['gender'] ?? ''}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
