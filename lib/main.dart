import 'package:flutter/material.dart';

void main() {
  runApp(const NoteMasterApp());
}

class NoteMasterApp extends StatelessWidget {
  const NoteMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
