import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
    appBar: const  MainAppBarWidget(text: 'FAQs',),
      body: Center(
        child: Text('FAQS'),
      ),
    ),
    );
  }
}
