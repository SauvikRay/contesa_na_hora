import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: const  MainAppBarWidget(text: 'Contactos',),
      body: Center(
        child: Text('Contactos Screen'),
      ),
    ),
    );
  }
}
