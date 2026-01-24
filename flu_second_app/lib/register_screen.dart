import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget{
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left:20, right: 20, top:150, bottom: 150),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
            Icon(Icons.app_registration,
              size: 80,
              color: Colors.blue,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter your name",
                labelText: "Name",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius:BorderRadius.circular(14),
                ),
              ),
              style: TextStyle(
                  fontSize: 20,
                  backgroundColor: Colors.white
              ),
            ),
            SizedBox(height: 16),

            TextField(
              decoration:InputDecoration(
                hintText: "Enter your email",
                labelText: "Email",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius:BorderRadius.circular(14),
                ),
              ),
              style: TextStyle(
                backgroundColor: Colors.white,
                fontSize: 20,
              ),
            ),

            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter your password",
                labelText: "Password",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius:BorderRadius.circular(14),
                ),
              ),
              style: TextStyle(
                backgroundColor: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton(onPressed:(){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Register Successful 🎉")),
              );
            },
               child:Text("Register"),
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(context); // Login screen pe wapas jao
              },
              child: Text('Already have account? Login',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        ),
      ),
    );


  }


}