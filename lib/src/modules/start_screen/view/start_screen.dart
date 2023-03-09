import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_management_system/src/constants/app_sizes.dart';
import 'package:order_management_system/src/routing/app_route.dart';
import 'package:order_management_system/src/utils/font_style.dart';

import '../../../components/logo_ekopii.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                LogoEkopII(
                  height: 400,
                ),
              ],
            ),
            const Text(
              'Welcome to Ekopii ',
            ),
            Text('Order Management System', style: kTextStyleLato),
            gapH24,
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width / 2,
              child: ElevatedButton(
                onPressed: () {
                  context.goNamed(AppRoute.logIn.name);
                },
                child: const Text('Login Now'),
              ),
            ),
            gapH16,
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width / 2,
              child: ElevatedButton(
                onPressed: () {
                  context.goNamed(AppRoute.signUp.name);
                },
                child: const Text('Create Account'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
