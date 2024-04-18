
import 'package:flutter/material.dart';
import 'package:plantapp/pages/home.dart';
import 'package:plantapp/pages/micro/MicroDetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),

    );
  }
}
