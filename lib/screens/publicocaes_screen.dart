import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';

class PublicationScreen extends StatefulWidget {
  const PublicationScreen({Key? key}) : super(key: key);

  @override
  State<PublicationScreen> createState() => _PublicationScreenState();
}

class _PublicationScreenState extends State<PublicationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: const  MainAppBarWidget(text: 'Publicações',),
      body: Center(
        child: Text('Publication'),
      ),
    ),
    );
  }
}
