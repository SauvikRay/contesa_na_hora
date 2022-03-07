import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';

class SobrenosScreen extends StatefulWidget {
  const SobrenosScreen({Key? key}) : super(key: key);

  @override
  State<SobrenosScreen> createState() => _SobrenosScreenState();
}

class _SobrenosScreenState extends State<SobrenosScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      appBar:   MainAppBarWidget(text: 'Sobrenos',),
      body: Center(
        child: Text('Publication'),
      ),
    ),
    );
  }
}
