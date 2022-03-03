import 'package:flutter/material.dart';

class ContestarScreen extends StatefulWidget {
  const ContestarScreen({Key? key}) : super(key: key);

  @override
  State<ContestarScreen> createState() => _ContestarScreenState();
}

class _ContestarScreenState extends State<ContestarScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('Contestar'),
      ),
      body: Center(
        child: Text('Contestar'),
      ),
    ),
    );
  }
}
