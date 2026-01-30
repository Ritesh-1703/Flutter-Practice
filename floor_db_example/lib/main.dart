import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Floor Database",
      home: Text("This is Floor Home",
      style: TextStyle(
        color: Colors.amber),
      ),
    );
  }
}