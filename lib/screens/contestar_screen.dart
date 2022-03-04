import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';

class ContestarScreen extends StatefulWidget {
  const ContestarScreen({Key? key}) : super(key: key);

  @override
  State<ContestarScreen> createState() => _ContestarScreenState();
}

class _ContestarScreenState extends State<ContestarScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: const  MainAppBarWidget(text: 'Contestar/Submeter Multa',),
      body: Center(
        child: Text('Contestar'),
      ),
    ),
    );
  }
}
