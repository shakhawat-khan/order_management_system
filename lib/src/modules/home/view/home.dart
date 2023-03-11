import 'package:flutter/material.dart';
import 'package:order_management_system/src/modules/home/components/drawer.dart';

class HomePage extends StatelessWidget {
  final String email;
  const HomePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(email: email),
      appBar: AppBar(
        title: const Text('EkopII'),
      ),
    );
  }
}
