import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp ({super.key});

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter First Application",
      theme: ThemeData(
          primarySwatch:  Colors.blue,
      useMaterial3: true
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),

    );
  }
}


class HomeScreen extends StatelessWidget{
  const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("First Application"),
      ),
      body: Stack(
        children: [
          Container(color: Colors.blue.shade50,),
          Center(
            child:Container(
              height: 220,
              width: 280,
              padding: const EdgeInsets.all(16),
              decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                  )
                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Icon(
                  Icons.flutter_dash,
                      size:60,
                  color: Colors.blue,
                ),
                  SizedBox(height: 12),
                  Text('Welcome to My Flutter Application',
                  style:TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: 8,),
                  Text("This is Your First Simple Page",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

            ),
          ),
          const Positioned(
              bottom:20,
              left:20,
              right: 20,
              child: InfoCard()
          ),
        ],
      ),
    );
  }
}


class InfoCard extends StatelessWidget{
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
          )
        ],
      ),
      child: Row(
        children: const [
          Icon(Icons.info, size: 40, color: Colors.blue),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Flutter Component",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("This is a reusable widget"),
            ],
          )
        ],
      ),
    );
  }
}