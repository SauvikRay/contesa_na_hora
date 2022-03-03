import 'package:flutter/material.dart';

class PublicationScreen extends StatefulWidget {
  const PublicationScreen({Key? key}) : super(key: key);

  @override
  State<PublicationScreen> createState() => _PublicationScreenState();
}

class _PublicationScreenState extends State<PublicationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('Publication'),
      ),
      body: Center(
        child: Text('Publication'),
      ),
    ),
    );
  }
}
