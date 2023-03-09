import 'package:flutter/material.dart';
import 'package:order_management_system/src/modules/home/components/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('EkopII'),
      ),
    );
  }
}
