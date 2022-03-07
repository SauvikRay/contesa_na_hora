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
    return  SafeArea(child: Scaffold(
      appBar: const  MainAppBarWidget(text: 'Service',),
      body: Center(
        child: Image.asset('assets/images/user.png'),
      ),
    ),
    );
  }
}
