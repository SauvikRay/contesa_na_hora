import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      appBar:   MainAppBarWidget(text: 'Service',),
      body: Center(
        child: Text('Publication'),
      ),
    ),
    );
  }
}
