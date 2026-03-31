import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image:  AssetImage('assets/images/image.png'),
            fit: BoxFit.contain
          ),
        ),
        child: const Center(
          child: Text('Senai', style: TextStyle(fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold)), // Text
        ), // Center
      ),
    )
    );
  }
}
