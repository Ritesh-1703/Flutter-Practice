import 'package:floor_db_example/ui/home/Home_page.dart';
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
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}