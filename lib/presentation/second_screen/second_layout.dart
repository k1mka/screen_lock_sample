import 'package:flutter/material.dart';

class SecondLayout extends StatefulWidget {
  const SecondLayout({super.key});

  @override
  State<SecondLayout> createState() => _SecondLayoutState();
}

class _SecondLayoutState extends State<SecondLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Hello"),
      ),
    );
  }
}
