import 'package:flutter/material.dart';
import 'auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();

  String gender = "Male";
  bool loading = false;

  final AuthService authService = AuthService();

  Future<void> register() async {
    try {
      setState(() => loading = true);

      await authService.registerWithEmailAndPassword(
        emailController.text.trim(),
        passController.text.trim(),
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        dob: dobController.text.trim(),
        gender: gender,
      );

      // ❌ Do NOT Navigator.pop()
      // AuthWrapper will navigate automatically
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: "Phone"),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: dobController,
              decoration: const InputDecoration(labelText: "DOB (YYYY-MM-DD)"),
            ),
            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              value: gender,
              decoration: const InputDecoration(labelText: "Gender"),
              items: const [
                DropdownMenuItem(value: "Male", child: Text("Male")),
                DropdownMenuItem(value: "Female", child: Text("Female")),
                DropdownMenuItem(value: "Other", child: Text("Other")),
              ],
              onChanged: (v) => setState(() => gender = v ?? "Male"),
            ),

            const SizedBox(height: 8),
            TextField(
              controller: passController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: loading ? null : register,
              child: loading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text("Create Account"),
            ),
          ],
        ),
      ),
    );
  }
}
